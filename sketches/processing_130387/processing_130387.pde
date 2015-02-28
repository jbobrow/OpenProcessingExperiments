
//Kevin Kan HW4
//Copyright © 2014

float r,g,b, x, y;


void setup(){
  size(400, 400);
  background(100,100,100);
  

}

//mousewheel
void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  println(e);
  fill(g,r,b);
  ellipse(mouseX, mouseY, 0+e*20, 0+e*20);
}

void draw(){
  noStroke();
  fill(r,g,b, 20);
  rect(0, 0, 400, 400);
  
  fill(b,g,r);
  ellipse(mouseX, mouseY, 20, 20);
  
  
}


//mouse pressed
void mousePressed(){
 r=random(255);
 g=random(255);
 b=random(255);
}

void keyPressed(){
  key=' ';
  fill(255,255,255);
  rect(0,0,400,400);
}


