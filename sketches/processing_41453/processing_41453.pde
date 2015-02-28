
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
    x = x + (mouseX-x)/50;
    y = y + (mouseY-y)/50;  
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
    ellipse(x+12, 12, 15, 15);
    ellipse(200, y, 20, 20);  
    ellipse(x+12, 12, 30, 30);
    ellipse(250, y, 20, 20);  
    ellipse(x, 135, 100, 100);  
    
    fill(c,o+20,l-50);
    ellipse(x, 370, 15, 15);  
    ellipse(150,y,15,15);
    ellipse(500,y,400,400);
  } 
}

void mouseMoved() {
 mve = true;
}
 

