
  int vertical = 40;
  int horizontal = 40;
  int speed = 20;

void setup() {
  size (400,400);
}
void draw() {
  
  background(115,0,211);
  stroke(0);
  noStroke();
  fill(0,255,74);
  
 if (mouseX < 0 && mouseY < 400) {
    rect (0,0,200,200);
  } else if (mouseX > 100 && mouseY < 100) {
    rect(100,0,100,100);
  }else if (mouseX < 100 && mouseY > 100) {
    rect(0,100,100,100);
  }else if (mouseX > 100 && mouseY > 100) {
    rect(100,0,100,100);
  }
  
  horizontal = horizontal + speed;
  vertical = vertical + speed;
  fill(238,255,5);
  ellipse(horizontal, vertical, 20, 20);
   
   
  //is ball gets to edge of screen, switch direction
   
  if(vertical >= 400){//is ball gets to edge of screen
   
    //ball switches direction
     
    speed=-5;
  }
     if(vertical < 100){//is ball gets to edge of screen
    //ball changes direction
    speed=5;
  }
  
  stroke (255,0,153);
  noFill();
  drawCircle(width/2,height/2,100);
}

void drawCircle (float x, float y, float radius) {
  ellipse (x, y, radius, radius);
  if (radius > 8) {
    drawCircle (x + radius/2, y, radius/2);
    drawCircle (x - radius/2, y, radius/2);
    drawCircle (x, y + radius/2, radius/2);
    drawCircle (x, y - radius/2, radius/2);
  }
 
}


