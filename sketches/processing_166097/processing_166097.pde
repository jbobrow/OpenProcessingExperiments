
float x = 0.0; // X-coordinate
float y = 270.0; // Y-coordinate
float angle = 0.2; // Direction of motion
float speed = 0.5; // Speed of motion
void setup() {
size(400, 400);
background(0);
randomSeed(22);

}
void draw() {
angle += random(-0.1, 0.1);
x += cos(angle) * speed; // Update x-coordinate
y += sin(angle) * speed; // Update y-coordinate
translate(x, y);
rotate(angle);
stroke(255, 30);
line(0, -10, 0, 1000*(angle%2));
stroke(30, 230);
line(0, -10, 0, -1000*(angle%2));
stroke(100,160,140,90);
line(2, -10*(angle%1*4), -2, 0);
stroke(130,160,140,90);
line(2, 10*(angle%1*4), -2, 0);
fill(90,60,130,12);
noStroke();
ellipse(0,0,7,13);
fill(0,0,30,12);
ellipse(0,2,13,13);
}


