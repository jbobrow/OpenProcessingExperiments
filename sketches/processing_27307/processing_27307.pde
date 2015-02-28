
void setup() {
  colorMode(RGB,255);
 // size(640/2,480/2,P3D);
  size(320,240,P2D);
  smooth();
   
}
 public int px,py;
  public boolean forward = true;
  public boolean up = true;
void draw() {
  if (forward){
  px+=(int)random(1,10);
  }
  else
  {
   px-=(int)random(1,10);
  }
   
  if (up){
   py-=(int)random(cos(5),10);
  }
  else
  {
   py+=(int)random(5,10);
    }
  if (px>width){
   forward = false;
  }
   
  if (px<0){
   forward = true;
  }
   
  if (py<0){
   up = false;
  }
   
  if (py >height){
   up = true;
  }
 if (!mousePressed){
  mouseX= px;
  mouseY= py;
 }
  
 ellipse(mouseX,mouseY,10,10);
  
}
