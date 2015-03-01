
//Assignment 6b: Design something by using mouseMoved() and/or mouseDragged().
float x, y, z;
void setup(){
  size(400,400);
  
}

void draw(){
  
  
}

void mouseMoved(){
  
}
void mouseDragged(){
    if((mouseX<width/2)&&(mouseY>height/2))
  {
    x=100;
    y=100;
    z=255;
  }
  if((mouseX<width/2)&&(mouseY<height/2))
  {
    x=255;
    y=30;
    z=100;
  }
   else if((mouseX>width/2)&&(mouseY>height/2))
  {
    x=0;
    y=255;
    z=30;
  }
   else if((mouseX>width/2)&&(mouseY<height/2))
  {
    x=255;
    y=255;
    z=255;
  }
  
  for(int i = 200; i>0; i-=10){
    fill(random(x),random(y),random(z));
  ellipse(mouseX,mouseY,i,i);
  }
}




