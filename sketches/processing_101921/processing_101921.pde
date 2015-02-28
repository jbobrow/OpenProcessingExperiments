
float x;
float y;
float px;
float py;
float easing = 0.05;
int recx = 100;
int recy = 300;
int w = 250;
int h = 300;
void setup() {
size(500,500);
}
void draw() {
//background(430);
   float targetX = mouseX;
   x += (targetX - x) * easing;
   float targetY = mouseY;
   y += (targetY - y) * easing;
   float weight = dist(x,y,px,py);
   strokeWeight(weight);
     stroke((mouseY/2 - mouseX/2) % 100 + 100, mouseX/2 % 100 + 100, mouseY/2 % 100 + 100);
   //Thank you thomas for the line above :)
   line(x, y, px, py);
   py = y;
   px = x;
    
if ((mouseX > recx) && (mouseX < recx+w) &&
(mouseY > recy) && (mouseY < recy+h)) {
fill(0);
} else {
fill(255);
}
rect(recx, recy, w, h);
triangle(100, 300, 350, 300, 225, 250);
}



