

void setup() {
  size(400,400);
  smooth();
  noStroke();
  ellipseMode(CENTER);
  rectMode(CENTER);
  
}

void draw () {
  
  if(mousePressed){
  background(100);
  fill(255);
  rect(width/2,height/2,300,300);
  
}else{

  background(100);
  fill(200,50);  
  ellipse(mouseX,mouseY,200,200);}
  
  
}

