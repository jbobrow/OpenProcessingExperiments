
int x;
int y;

void setup(){
  size(500,500);
  background(255,255,255);
  
  x=-50;
  y=-300;
  
}

void draw (){
  x=mouseX;
  y=mouseY;
  
  
  
  if ((mouseX<125)&&(mouseY<500)) {
    fill(245,0,255,40);
    noStroke();
    ellipse(x,y,10,10);
  
  }
  if ((mouseX>375)&&(mouseY<500)) {
    fill(0,200,200,40);
    noStroke();
    ellipse(x,y,10,10);
  }
  
  else {
    fill(200,125,0,40);
    noStroke();
    ellipse(x,y,10,10);
    
  }
}

