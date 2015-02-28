
ArrayList<Ball> balls;
boolean mve = false;
  
void setup() {
  size(700, 400);
  smooth(); 
  frameRate(20);
   
  balls = new ArrayList();
}
  
void draw() {   
 noStroke();
 fill(0,10);
 rect(0,0,width,height);
 
 

  for (Ball b : balls)
  {
    b.fade();
  }
  
}
  

void mousePressed() {  
  if (mouseButton == LEFT) {
    balls.add(new Ball(350,200));
  }
  else if ((mouseButton == RIGHT)&&(balls.size() > 0)) {
    balls.remove(0);
  }
}
 
class Ball {
 
  float x, y;

 Ball(float inX, float inY ) {
    x = inX;
    y = inY;
  }

 void update() { 
  if(dist(mouseX, mouseY,pmouseX, pmouseY) == 0){
    mve = false;
  }  
  if(mve ==true){
    x = x + (mouseX-x)/100;
    y = y + (mouseY-y)/100;  
    }
  }

  void fade() {    
    update();
    
    noStroke();
    fill(170);
    rect(x, y, 10, 10);
  } 
}

void mouseMoved() {
 mve = true;
}
 

