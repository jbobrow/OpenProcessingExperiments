
void setup(){
  size(600,600);
  background(0,0,0);
  smooth();
}

float x=20;



void draw(){
  
  noFill();
  stroke(x*4,x*2,x*8);
  rectMode(CENTER);
  rect(300,300,x+2,x+2);
  stroke(x*8,x*4,x*2);
rect(150,300,x+4,x+4);
rect(450,300,x+4,x+4);
stroke(x+2,x+4,x+6);
rect(300,600,x*2,x*4);

 


  noFill();
  stroke(mouseX,mouseY,x);
  ellipse(300,mouseY,mouseX,mouseY);
  noFill();
  ellipse(300,mouseY,x+2,x+2);
  noFill();
  ellipse(mouseX,300,x+4,x+4);
  ellipse(mouseX,300,mouseX,mouseY);
 
  x=x+.15;
}

void mouseDragged(){
  x=mouseX;
  
 
}


