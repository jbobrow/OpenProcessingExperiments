
/**
 * Bolygone. 
 * 
 * Building Bolygone
 * Use X axis to change parameter.
 */
 
float a = 0.0;
float i =0;
float tempX =-1;
float rSize;  // rectangle size

void setup() {
  size(800, 600,P3D);
  rSize = width / 6;  
   background(0);
}
float phase = 0;
float phaseColor = 0;
void draw() {
 if(mousePressed || mouseX != tempX)
  {
    tempX=mouseX;
    background(0);
  }
  else
  {
    
  }
stroke(phaseColor,0,0);
  //line(30, 20, width, height);
  if(i>TWO_PI)
  {
    i=0;
  }
   float b = mouseX;

   float bv=b/width*180;

  
    
    float r = min(width,height)/2;
    float  x = r*cos(i);
    float  y = r*sin(i);
    
     float  xx = r*cos(bv*i);
    float  yy = r*sin(bv*i);
    
   point(x+width/2,y+height/2);
   line(x+width/2,y+height/2,xx+width/2,yy+height/2);
   // point(i+mouseX,(height/4)*sin(0.01*i+phase)+height/2);
   // point(i-mouseX,(height/4)*sin(0.01*i+phase)+height/2);
fill(0, 0, 0); 
textSize(40);
text("P:"+bv, 15, 30); 
fill(255, 0, 0); 
text("P:"+bv, 15, 30); 
 
 phaseColor= 200;
 i=i+0.05;

}

