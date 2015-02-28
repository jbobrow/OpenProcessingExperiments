
void setup(){
  size (200,200);
  colorMode(HSB,200);
}

int x=0;

void draw(){
  x++;
  ellipse(x,mouseY,10,10);
  
  if (x > width){
    x = 0;
  }  
}


void mouseDragged(){

  fill(HSB,200,20,10);
  rectMode(CORNERS);
  rect(0,0,width,height);
  
  fill (mouseX,mouseY,200);
  ellipse(mouseX,mouseY,10,10);
  
}

