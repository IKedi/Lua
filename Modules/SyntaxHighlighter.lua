local module = {}

local lexer = loadstring(game:GetObjects("rbxassetid://2405013009")[1].Source)()
local LineCountScale = 0
local LineCountOffset = 15
local TextToCounterGapOffset = 5

module.SetTextBox = function(TextBox, theme)
	if not TextBox or not TextBox:IsA("TextBox") then return;end
	
	if theme == nil or type(theme) ~= 'table' then
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
	local background = tostring(math.floor(TextBox.BackgroundColor3.R * 255))..", "..tostring(math.floor(TextBox.BackgroundColor3.R * 255))..", "..tostring(math.floor(TextBox.BackgroundColor3.R * 255))
	
	local Folder = Instance.new("Folder", TextBox.Parent)
	local LexerScroll = Instance.new("ScrollingFrame", Folder)
	local LineCounterHolder = Instance.new("ScrollingFrame", Folder)
	local LexerLabel = Instance.new("TextLabel", TextBox)
	local LinesLabel = Instance.new("TextLabel", LineCounterHolder)
	
	Folder.Name = TextBox.Name
	
	LexerScroll.Name = "Scroller"
	LexerScroll.Size = UDim2.new(TextBox.Size.X.Scale - LineCountScale, TextBox.Size.X.Offset - LineCountOffset, TextBox.Size.Y.Scale, TextBox.Size.Y.Offset)
	LexerScroll.Position = UDim2.new(TextBox.Position.X.Scale + LineCountScale, TextBox.Position.X.Offset + LineCountOffset, TextBox.Position.Y.Scale, TextBox.Position.Y.Offset)
	LexerScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
	LexerScroll.BackgroundColor3 = TextBox.BackgroundColor3
	LexerScroll.BorderColor3 = TextBox.BorderColor3
	LexerScroll.ScrollBarImageColor3 = TextBox.TextColor3
	
	LineCounterHolder.Name = "Scroller"
	LineCounterHolder.Size = UDim2.new(LineCountScale, LineCountOffset, TextBox.Size.Y.Scale, TextBox.Size.Y.Offset)
	LineCounterHolder.Position = TextBox.Position
	LineCounterHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
	LineCounterHolder.BackgroundColor3 = TextBox.BackgroundColor3
	LineCounterHolder.BorderColor3 = TextBox.BorderColor3
	LineCounterHolder.ScrollBarThickness = 0 --Hides the scroll wheel
	LineCounterHolder.LayoutOrder = 1
	LineCounterHolder.ScrollingEnabled = false
	
	TextBox.Parent = LexerScroll
	TextBox.Size = UDim2.new(100, 0, 100, 0)
	TextBox.Position = UDim2.new(0, 5, 0, 0)
	TextBox.BackgroundTransparency = 1
	TextBox.MultiLine = true
	TextBox.ClearTextOnFocus = false
	TextBox.Font = Enum.Font.Code
	TextBox.TextWrapped = false
	TextBox.TextScaled = false
	TextBox.TextXAlignment = Enum.TextXAlignment.Left
	TextBox.TextYAlignment = Enum.TextYAlignment.Top
	
	LexerLabel.Name = "Visual"
	LexerLabel.Size = TextBox.Size
	LexerLabel.BackgroundTransparency = 1
	LexerLabel.Font = TextBox.Font
	LexerLabel.TextColor3 = TextBox.TextColor3
	LexerLabel.TextSize = TextBox.TextSize
	LexerLabel.TextStrokeColor3 = TextBox.BackgroundColor3
	LexerLabel.TextStrokeTransparency = 0
	LexerLabel.TextXAlignment = Enum.TextXAlignment.Left
	LexerLabel.TextYAlignment = Enum.TextYAlignment.Top
	LexerLabel.RichText = true
	
	LinesLabel.Name = "LineCount"
	LinesLabel.Size = UDim2.new(1, 0, TextBox.Size.Y.Scale, TextBox.Size.Y.Offset)
	LinesLabel.Position = UDim2.new(0, 0, 0, 0)
	LinesLabel.BackgroundColor3 = TextBox.BackgroundColor3
	LinesLabel.BorderColor3 = TextBox.BorderColor3
	LinesLabel.Font = Enum.Font.Code
	LinesLabel.Text = "1"
	LinesLabel.TextColor3 = TextBox.TextColor3
	LinesLabel.TextSize = TextBox.TextSize
	LinesLabel.TextYAlignment = Enum.TextYAlignment.Top
	
	local function updatescrolls()
		if LinesLabel then
			LinesLabel.Text = ""

			for i = 1, LexerLabel.TextBounds.Y / LexerLabel.TextSize do
				LinesLabel.Text = LinesLabel.Text..tostring(i)

				if i ~= LexerLabel.TextBounds.Y / LexerLabel.TextSize then
					LinesLabel.Text = LinesLabel.Text.."\n"
				end
			end
		end

		LexerScroll.CanvasSize = UDim2.new(LineCountScale, TextBox.TextBounds.X + LineCountOffset + TextToCounterGapOffset, 0, TextBox.TextBounds.Y)
		LineCounterHolder.CanvasSize = UDim2.new(0, 0, LexerScroll.CanvasSize.Y.Scale, LexerScroll.CanvasSize.Y.Offset)
		LineCounterHolder.CanvasPosition = Vector2.new(0, LexerScroll.CanvasPosition.Y)

		if LexerScroll.CanvasSize.X.Offset ~= lastxsize then
			LexerScroll.CanvasPosition = Vector2.new(LexerScroll.CanvasSize.X.Offset, LexerScroll.CanvasPosition.Y)
		end

		if LexerScroll.CanvasSize.Y.Offset ~= lastysize then
			LexerScroll.CanvasPosition = Vector2.new(LexerScroll.CanvasPosition.X, LexerScroll.CanvasSize.Y.Offset)
		end

		lastxsize = LexerScroll.CanvasSize.X.Offset
		lastysize = LexerScroll.CanvasSize.Y.Offset
	end
	
	local function highlight()
		local write = "\n<font color=\"rgb("..background..")\">‎</font>" --RichText doesn't allow two empty lines (empty char)
		
		if TextBox.Text:find('\t') then
			TextBox.Text = TextBox.Text:gsub("\t", "    ")
			TextBox.CursorPosition += 3
		end
		
		for name, val in lexer.scan(TextBox.Text) do
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
		
		write = write:gsub("\n", "\n<font color=\"rgb("..background..")\">‎</font>") --Same thing
		
		LexerLabel.Text = write
		updatescrolls()
	end
	
	local function changed(valname)
		local pass = true
		local exceptions = {
			"Text",
			"Size",
			"Position"
		}
		
		for i, exception in ipairs(exceptions) do
			if valname == exception then
				pass = false
			end
		end
		
		if pass then
			pcall(function() --If object doesn't have a variable that TextBox has it will give a error and we don't want that
				LexerScroll[valname] = TextBox[valname] --LexerScroll["Size"] is the same as LexerScroll.Size
			end)
			
			pcall(function()
				LineCounterHolder[valname] = TextBox[valname]
			end)
			
			pcall(function()
				LexerLabel[valname] = TextBox[valname]
			end)
			
			pcall(function()
				LinesLabel[valname] = TextBox[valname] 
			end)
		end
	end
	
	highlight()
	
	TextBox:GetPropertyChangedSignal("Text"):Connect(highlight)
	TextBox.Changed:Connect(changed) --When font size changes etc.
	
	LexerScroll:GetPropertyChangedSignal("CanvasPosition"):Connect(updatescrolls)
end

return module
