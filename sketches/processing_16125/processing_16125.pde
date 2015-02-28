
/*Hello everybody, this is my little creature but in object oriented programming.*/

//definig the class
Face myFace;


//defining the setup
void setup() {
  size(200,200);
  smooth();
  myFace = new Face();
}

void draw() {
  //list of functions which are called
  background(255);
  myFace.drawEyes();
  myFace.drawPupils();
  myFace.drawEyebrows();
  myFace.drawMove();
  myFace.drawNose();
  myFace.drawMouth();
}

class Face {
  //defining the functions which need to be called
  int x = int(random(0,width));
  int y = int(random(0,height));
  int xspeed = 1;
  int yspeed = 1;
  
  
  //defining the eye
  
  void drawEyes() {
    fill(255);
    stroke(0);
    strokeWeight(2);
    ellipse(x,y,20,10);
    ellipse(x+30,y,20,10);
  }
  //defining the pupil
  void drawPupils() {
    fill(0);
    stroke(162,0,0);
    strokeWeight(2);
    ellipse(x,y,8,8);
    ellipse(x+30,y,8,8);
  }
  
  void drawEyebrows() {
    rectMode(CENTER);
    stroke(0);
    rect(x,y-10,20,1);
    rect(x+30,y-10,20,1);
  }  
    
  void drawNose() {
  rectMode(CENTER);
  rect(x+15,y+15,3,12);
  }
  
  void drawMouth() {
  ellipse(x+15,y+30,40,8);
  } 
  
  //let the ellipses bounce
  void drawMove()
  {
    x += xspeed;
    y += yspeed;
    
    if (x < 12 || x > 158)
    {
    xspeed *= -1;
    }
    if (y<12 || y>163)
   {
     yspeed *= -1;
    
   } 
 
 }
}



