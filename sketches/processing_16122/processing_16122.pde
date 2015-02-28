
//definig the class
Eye myEye;


//defining the setup
void setup() {
  size(200,200);
  smooth();
  myEye = new Eye();
}

void draw() {
  //list of functions which are called
  background(255);
  myEye.drawEye();
  myEye.drawPupil();
  myEye.drawEyebrow();
  myEye.drawMove();
}

class Eye {
  //defining the functions which need to be called
  int x = int(random(0,width));
  int y = int(random(0,height));
  int xspeed = 1;
  int yspeed = 1;
  
  
  //defining the eye
  
  void drawEye() {
    fill(255);
    stroke(0);
    strokeWeight(4);
    ellipse(x,y,30,15);
  }
  //defining the pupil
  void drawPupil() {
    fill(0);
    stroke(162,0,0);
    strokeWeight(4);
    ellipse(x,y,10,10);
  }
  
  void drawEyebrow() {
    rectMode(CENTER);
    stroke(0);
    rect(x,y-15,30,1);
  }
  //let the ellipses bounce
  void drawMove()
  {
    x += xspeed;
    y += yspeed;
    
    if (x < 17 || x > 183)
    {
    xspeed *= -1;
    }
    if (y<17 || y>190)
   {
     yspeed *= -1;
    
   } 
 
 }
}



