
ArrayList<Ball> balls;
boolean mve = false;

//Colour:
int c = 255;
int o = 255;
int l = 255;
  
void setup() {
  size(700, 400);
  smooth(); 
   
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
  float xSpeed;
  float ySpeed;

 Ball(float inX, float inY ) {
    x = inX;
    y = inY;
  }

 void update() { 
  if(dist(mouseX, mouseY,pmouseX, pmouseY) == 0){
    mve = false;
  }  
  if(mve ==true){
    x = x + (mouseX-x)/90;
    y = y + (mouseY-y)/90;  
    }
     if(mouseButton == LEFT){
     c=2;
     o=31;
     l=211;
     }
  }

  void fade() {    
    update();
    
    noStroke();
    fill(c,o,l);
    ellipse(x, y, 10, 10);
  } 
}

void mouseMoved() {
 mve = true;
}
 

