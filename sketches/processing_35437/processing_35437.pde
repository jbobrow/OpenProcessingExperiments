
void setup()  {  
  size(400,400);  
  smooth();
}  

void draw()  {  
  background(255);  
  stroke(0);  
  branch(width/2,50,290);  
}  

void branch(float x, float y, float h)  {  
  ellipse(x,y,x-h,y+h);
  ellipse(x,y,x+h,y+h);
  if (h > 2) {
    branch(x-h,y+h,h/2);
    branch(x+h,y+h,h/2);
  }  
}
