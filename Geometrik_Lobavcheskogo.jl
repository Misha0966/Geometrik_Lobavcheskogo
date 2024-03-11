using Plots

# Задаем координаты точки и уравнение прямой
point = [1, 2, 3]
line_point = [0, 0, 0]
line_direction = [1, 1, 1]  # Направляющий вектор прямой

# Находим два вектора, параллельных данной прямой
v1 = [1, -line_direction[1], -line_direction[2]]
v2 = [line_direction[3], -line_direction[1], -line_direction[2]]

# Задаем координаты точек для визуализации
points = [point, line_point, line_point + v1, line_point + v2]

# Создаем график
anim = @animate for t in 0:0.1:1
    plot3d(legend=false, xlim=(-2, 2), ylim=(-2, 2), zlim=(-2, 2))
    plot3d!([line_point[1] + t*line_direction[1], line_point[1] + t*line_direction[1] + v1[1]], 
            [line_point[2] + t*line_direction[2], line_point[2] + t*line_direction[2] + v1[2]], 
            [line_point[3] + t*line_direction[3], line_point[3] + t*line_direction[3] + v1[3]], color=:blue)
    plot3d!([line_point[1] + t*line_direction[1], line_point[1] + t*line_direction[1] + v2[1]], 
            [line_point[2] + t*line_direction[2], line_point[2] + t*line_direction[2] + v2[2]], 
            [line_point[3] + t*line_direction[3], line_point[3] + t*line_direction[3] + v2[3]], color=:red)
    scatter!(map(p -> p[1], points), map(p -> p[2], points), map(p -> p[3], points), color=:black, markersize=5)
end

gif(anim, "lobachevsky.gif", fps = 10)