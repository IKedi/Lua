local module = {}

local lexer = loadstring(game:GetObjects("rbxassetid://2405013009")[1].Source)()
local LineCountScale = 0
local LineCountOffset = 15
local TextToCounterGapOffset = 5

module.SetTextBox = function(textbox, theme)
	if not textbox or not textbox:IsA("TextBox") then return;end
	
	if not theme or type(theme) ~= 'table' then
		theme = {
			builtin = "132, 214, 247",
			keyword = "248, 109, 124",
			number = "255, 198, 0",
			string = "173, 241, 149",
			comment = "102, 102, 102"
		}
	end
	
	local lastxsize = 0
	local lastysize = 0
	local background = tostring(math.floor(textbox.BackgroundColor3.R * 255))..", "..tostring(math.floor(textbox.BackgroundColor3.R * 255))..", "..tostring(math.floor(textbox.BackgroundColor3.R * 255))

	local LexerScroll = Instance.new("ScrollingFrame", textbox.Parent)
	local LexerLabel = Instance.new("TextLabel", textbox)
	local LinesLabel = Instance.new("TextLabel", textbox)
	
	LexerScroll.Size = textbox.Size
	LexerScroll.Position = textbox.Position
	LexerScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
	LexerScroll.BackgroundColor3 = textbox.BackgroundColor3
	LexerScroll.BorderColor3 = textbox.BorderColor3
	LexerScroll.ScrollBarImageColor3 = textbox.TextColor3
	
	textbox.Size = UDim2.new(textbox.Size.X.Scale - LineCountScale, textbox.Size.X.Offset + LineCountOffset, textbox.Size.Y.Scale, textbox.Size.Y.Offset)
	textbox.Position = UDim2.new(textbox.Position.X.Scale + LineCountScale, textbox.Position.X.Offset + LineCountOffset, textbox.Position.Y.Scale, textbox.Position.Y.Offset)
	
	textbox.Parent = LexerScroll
	textbox.BackgroundTransparency = 1
	textbox.Position = UDim2.new(LineCountScale, LineCountOffset + TextToCounterGapOffset, 0, 0)
	textbox.Size = UDim2.new(100, 0, 100, 0)
	textbox.MultiLine = true
	textbox.ClearTextOnFocus = false
	textbox.Font = Enum.Font.Code
	textbox.TextWrapped = false
	textbox.TextScaled = false
	textbox.TextXAlignment = Enum.TextXAlignment.Left
	textbox.TextYAlignment = Enum.TextYAlignment.Top
	
	LexerLabel.Name = "Visual"
	LexerLabel.Position = UDim2.new(0, 0, 0, 0)
	LexerLabel.Size = textbox.Size
	LexerLabel.BackgroundTransparency = 1
	LexerLabel.Font = textbox.Font
	LexerLabel.TextColor3 = textbox.TextColor3
	LexerLabel.TextSize = textbox.TextSize
	LexerLabel.TextStrokeColor3 = textbox.BackgroundColor3
	LexerLabel.TextStrokeTransparency = 0
	LexerLabel.TextXAlignment = Enum.TextXAlignment.Left
	LexerLabel.TextYAlignment = Enum.TextYAlignment.Top
	LexerLabel.RichText = true
	
	LinesLabel.Name = "LineCount"
	LinesLabel.Size = UDim2.new(LineCountScale, LineCountOffset, textbox.Size.Y.Scale, textbox.Size.Y.Offset)
	LinesLabel.Position = UDim2.new(-LineCountScale, -(LineCountOffset + TextToCounterGapOffset), 0, 0)
	LinesLabel.BackgroundColor3 = textbox.BackgroundColor3
	LinesLabel.BorderColor3 = textbox.BorderColor3
	LinesLabel.Font = Enum.Font.Code
	LinesLabel.Text = "1"
	LinesLabel.TextColor3 = textbox.TextColor3
	LinesLabel.TextSize = textbox.TextSize
	LinesLabel.TextYAlignment = Enum.TextYAlignment.Top
	
	local function highlight()
		local write = "\n<font color=\"rgb("..background..")\"></font>"
		
		if textbox.Text:find('\t') then
			textbox.Text = textbox.Text:gsub("\t", "    ")
			textbox.CursorPosition += 3
		end
		
		for name, val in lexer.scan(textbox.Text) do
			local wrote = false
			
			for _type, _color in pairs(theme) do
				if name == _type then
					write = write.."<font color=\"rgb(".._color..")\">"..val.."</font>"
					wrote = true
				end
			end
			
			if not wrote then
				write = write..val
			end
		end
		
		write = write:gsub("\n", "\n<font color=\"rgb("..background..")\">‎</font>") --RichText doesn't allow two empty lines (empty char)
		
		LexerLabel.Text = write
		
		if LinesLabel then
			LinesLabel.Text = ""
			
			for i = 1, LexerLabel.TextBounds.Y / LexerLabel.TextSize do
				LinesLabel.Text = LinesLabel.Text..tostring(i)
				
				if i ~= LexerLabel.TextBounds.Y / LexerLabel.TextSize then
					LinesLabel.Text = LinesLabel.Text.."\n"
				end
			end
		end
		
		LexerScroll.CanvasSize = UDim2.new(LineCountScale, textbox.TextBounds.X + LineCountOffset + TextToCounterGapOffset, 0, textbox.TextBounds.Y)

		if LexerScroll.CanvasSize.X.Offset ~= lastxsize then
			LexerScroll.CanvasPosition = Vector2.new(LexerScroll.CanvasSize.X.Offset, LexerScroll.CanvasPosition.Y)
		end
		
		if LexerScroll.CanvasSize.Y.Offset ~= lastysize then
			LexerScroll.CanvasPosition = Vector2.new(LexerScroll.CanvasPosition.X, LexerScroll.CanvasSize.Y.Offset)
		end
		
		lastxsize = LexerScroll.CanvasSize.X.Offset
		lastysize = LexerScroll.CanvasSize.Y.Offset
	end

	local write = ""
	local bg = background:split(",")
	
	highlight()
	
	textbox:GetPropertyChangedSignal("Text"):Connect(highlight)
end

return module
