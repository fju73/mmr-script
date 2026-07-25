
local MathUtils = {}

function MathUtils.Distance2D(pointA, pointB)
	local x = pointA.X - pointB.X
	local y = pointA.Y - pointB.Y
	
	return math.sqrt(x * x + y * y)
end


function MathUtils.DistanceSquared(pointA, pointB)
	local x = pointA.X - pointB.X
	local y = pointA.Y - pointB.Y
	
	return x * x + y * y
end


function MathUtils.Lerp(a, b, alpha)
	return a + (b - a) * math.clamp(alpha, 0, 1)
end

return MathUtils