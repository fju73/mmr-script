local DragController = {}

local UserInputService = game:GetService("UserInputService")


local dragging = false
local dragStart
local startPosition


function DragController.Enable(frame, dragArea)

	dragArea = dragArea or frame


	dragArea.InputBegan:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			
			dragging = true
			dragStart = input.Position
			startPosition = frame.Position

		end

	end)


	UserInputService.InputChanged:Connect(function(input)

		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			
			local delta = input.Position - dragStart

			frame.Position = UDim2.new(
				startPosition.X.Scale,
				startPosition.X.Offset + delta.X,
				startPosition.Y.Scale,
				startPosition.Y.Offset + delta.Y
			)

		end

	end)


	UserInputService.InputEnded:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			
			dragging = false
			
		end

	end)

end


return DragController