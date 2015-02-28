
void setup() {
  size(250,250);
  background(0);
    smooth();
}
 
void draw() {//on mouse command
  if (mousePressed)
  {
    float r = dist(width,height,mouseX,mouseY);
    line(mouseX,mouseY,r,r);
    line(20-mouseX,mouseY,r,r);
    line(mouseX,20-mouseY,r,r);
    line(10-mouseX,20-mouseY,r,r);
    
    if((mouseX<125)&(mouseY<125))//between range
   
    {
      stroke(random(210), 10, 90, 50);//line colours with random variable
    }
  }
  
}


