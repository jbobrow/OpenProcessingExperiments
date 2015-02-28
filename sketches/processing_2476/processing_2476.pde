

rec bouncy = new rec();
rec jump = new rec();
rec boo = new rec();
void setup() {
  size(500,500);
  background(255);
  smooth();
  
  bouncy.x = 100;
  bouncy.y = 200;
  bouncy.xspeed = 1;
  bouncy.yspeed = -5;
  
  jump.x = 300;
  jump.y = 25;
  jump.xspeed = 1;
  jump.yspeed = -0; 
  
  boo.x = 500;
  boo.y = 100;
  boo.xspeed = 1;
  boo.yspeed = -0; 
  
 // booing.col = color(random(255),random(255), random(255)); //added color to balls
};

void draw() {
  background(255);

  bouncy.update();
  bouncy.draw();
  
  jump.update();
  jump.draw();

  boo.update();
  boo.draw();
};

