
float x = 100;
float y = 150;
float z = 200;

x = random(255);
y = random(255);
z = random(255);

size(500, 500);
beginShape(TRIANGLE_FAN);
vertex(x, 300);
vertex(x, 20);
vertex(200, y);
vertex(100, 20);
vertex(400, 200);
vertex(20, 300);
endShape();
