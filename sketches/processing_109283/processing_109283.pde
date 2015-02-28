
size(400, 400);

int x1 = random(0, 400);
int x2 = random(0, 400);
int y1 = random(0, 400);
int y2 = random(0, 400);
int r = random (0, 255);
int g = random (0, 255);
int b = random (0, 255);

fill(r, g, b);
rect(x1, y1, x2, y2);
line(x1, y1, x2, y2);


