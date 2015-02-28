
int ellipseRadius;
int x;
int y;
int z;
int eyeAngle = 0;
int angleChange = 5;
final int ANGLE_LIMIT = 360;
PImage bg2;

void setup()
{
  size(400, 300);
  bg2 = loadImage("bg2.jpg");
  background(bg2);
  smooth();
  frameRate(30);
  stroke(0);
  ellipseMode(CENTER);
  ellipseRadius = 20;
  x = 60;
  y = 10;
  z = 175;
  noStroke();
  drawFace();
  
 
  
}

void draw()
{
  background(bg2);
  pushMatrix();
  
  drawFace();
  eyeAngle += angleChange;
  
   if (eyeAngle > ANGLE_LIMIT || eyeAngle < 0)
  {
    angleChange= -angleChange;
    eyeAngle += angleChange;
  }
  popMatrix();
  }
 
void drawFace()
{
 
  Eye1();
  Eye2();
  Face();
}
 void Face()
{
  stroke(0);
  fill(0,0);
  arc(175, 75, 30, 10, -PI, 0);
  arc(215, 75, 30, 10, -PI, 0);
  noFill();
  stroke(0);
  bezier(70, 140, 180, 190, 240, 180, 320, 140);
  bezier(50, 175, 25, 25, 125, 25, 170, 55);
  bezier(210, 55, 355, 5, 320, 90, 350, 175);
 //endpoint,sidecontrol,sidecontrol,endpoint
  }

void Eye1()
{
  pushMatrix();
    translate(z, y+100);
        rotate(radians(eyeAngle));
        translate(-z, -y-100);
        
  
  fill(0,0,0);
 
  {
    ellipse(z, y+100, x-30, x-10);
   
    
  }
     popMatrix();
  
}


void Eye2()
{
  pushMatrix();
    translate(z+40, y+100);
        rotate(radians(-eyeAngle));
        translate(-z-40, -y-100);
        
  


  {
    ellipse(z+40, y+100, x-30, x-10);
   
    
  }
     popMatrix();
  
}






