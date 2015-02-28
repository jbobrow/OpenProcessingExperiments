
float x = 0;
float y = 0;
float w = 10;
float h = 10;
float bx=0;
float by=0;
float xOffset=0;
float yOffset=0;
float[] a = new float[100];
float[] b = new float[100];
float[] c = new float[100];
float[] d = new float[100];
boolean overshape=false;
boolean locked=false;
float size = 0;

int xdirection = 1;
int ydirection = 1;

void setup() {
  size(400,400);
  bx=width/2;
  by=height/2;
  background(255,255,255);
  fill(250,0,0,10);
  noStroke();
}
void draw() {
    background(255,255,255);
     
  rayo(mouseX,mouseY,size,size);
  if(mouseX >= 100)
  {
    rayo(bx,by,size,size);
  }
else
{
    size = 30;
    fill(250,0,0);
}
    if (mouseX > bx-size && mouseX < bx+size &&  mouseY > by-size && mouseY < by+size)
    {
    overshape= true;  
    if(!locked)
    { 
      stroke(255); 
      fill(153);
    }
    
    }  

}
void rayo(float x,float y,float w,float h) {
  beginShape(POLYGON);
  vertex(x+w/4,y);
  vertex(x+w,y+h/4);
  vertex(x+w/2,y+h/2);
  vertex(x+w,y+3*h/4);
  vertex(x+w/2,y+h);
  vertex(x+3*w/4,y+3*h/4);
  vertex(x+w/4,y+h/2);
  vertex(x+3*w/4,y+h/4);
  vertex(x+w/4,y);
  endShape();
}
void mousePressed()
{
  if(overshape)
  {
    size=80;
    fill(250,50,0);
  }
    xOffset = mouseX-bx; 
  yOffset = mouseY-by; 
}
void mouseDragged()
{
  if(locked)
  {    
    size=80; 
     bx = mouseX-xOffset; 
    by = mouseY-yOffset;   
  }
}
void mouseReleased() {
  locked = false;
}



