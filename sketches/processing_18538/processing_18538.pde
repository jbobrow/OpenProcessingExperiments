
float i=1;

void setup(){
  size(250,250);
background(0);
smooth();
}

void draw(){
 strokeWeight(0.5);
 noFill();
stroke(#96ff01,40);
frameRate(25);
ellipse(125,125,random(500),random(500));

if (mouseY>100);
  stroke(#02fef5,40);
  noFill();
  line(mouseX,mouseY,0,150);
  line(mouseX,mouseY,250,150);
  
  if(mouseY<100);
  noFill();
  stroke(#880bbc,60);
  line(mouseX,mouseY,125,250);
 
}

