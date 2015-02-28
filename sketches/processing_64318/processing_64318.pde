
import ddf.minim.*;

Minim minim;
AudioInput in;

  float rx;
  float ry;
 float x; 

void setup()
{
  size(400,400);

  minim = new Minim(this);
  minim.debugOn();
  
  in = minim.getLineIn(Minim.STEREO, 400);
  
  colorMode(HSB,400);
  noFill();
  smooth();
  
  rx =random(1,400);
  ry =random(1,400);
  x=HSB;
  
}

void draw()
{
  background(0);
  
  
  
  for(int i = 0; i < 400; i+=20)
  {
    strokeWeight(5);
    stroke(i,400,400);
    
    
    pushMatrix();
    translate(200,200);
    
    
      for(int q=0; q<360; q++){
    fill(q*6,360,360);
  
    rotate(radians(in.left.get(q)*180+mouseX));
    
    translate(q*x,0);
   noStroke(); 
   ellipse(0,0,20,20);

 
  }
    popMatrix();
     }
     
    
  }

