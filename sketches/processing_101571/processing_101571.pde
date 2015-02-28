
float x = 0;
float y = 100;
float speedX= 1.31;
float speedY =1.31;
void setup() {
 size(200, 200);
smooth(); 
}
void draw() {
  background(255);
 x = x + speedX;
if(x > width || x < 0) {
 speedX = speedX * -1.1;
 fill(abs(speedX)*50, 0, 0);

} 
y = y + speedY;
if(y > height || y < 0) {
 speedY = speedY * -1.1;
 fill(abs(speedX)*50, 0, 0);
} 
 stroke(0);
 //fill(175);
 ellipse(x, y, 32, 32);
}
