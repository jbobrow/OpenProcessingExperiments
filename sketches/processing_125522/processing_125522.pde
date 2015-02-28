
size(400, 400);
background(255);
noFill();

// x1, y1, x2, y2
line(100, 100, 300, 100);

// x, y, width, height, firstAngle, secondAngle
arc(200, 300, 50, 50, radians(0), radians(120));

// x1, y1, x2, y2, x3, y3, x4, y4
quad(20, 200, 60, 180, 100, 270, 30, 260);
