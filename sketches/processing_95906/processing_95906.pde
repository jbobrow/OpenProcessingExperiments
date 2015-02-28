
void setup(){
  size(500,500);
  background(0);
  smooth();
}

void draw(){
//  fill(0,100);
//  rect(0,0,width,height);

//  noStroke();
//  fill(random(0,255),random(0,255),random(0,255));
//  ellipse(mouseX,mouseY,30,30);
  
}


void mouseDragged(){
  noStroke();
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(mouseX,mouseY,30,30);  
}
