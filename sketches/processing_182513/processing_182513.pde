


color c = color(209,227,209);
float x = 100;
float y = 100;
float xspeed = 10;
float yspeed = 10;
float gravity = 0.7;




void setup() {
  size(200,200);
  smooth();
  frameRate(45);
 
  
}
 void display() {
  fill(c);
  ellipseMode(CENTER);
  ellipse(x,y,20,20);
}
void draw() {
      background(255);
      move();
      display();
      
    }
    void move() {
      x = x + xspeed;
      y = y + yspeed;
      yspeed = yspeed + gravity;
      if (y > 190) {
        yspeed = -yspeed + gravity;
        c = color(random(255),random(255),random(255));
        
      }
      if (y < 1) {
        yspeed = yspeed + gravity;
        c = color(random(255),random(255),random(255));
      }
      if (x > width) {
      xspeed = -xspeed;
      c = color(random(255),random(255),random(255));
      }
      if (x < 1) {
        xspeed = -xspeed;
        c = color(random(255),random(255),random(255));
      }}




