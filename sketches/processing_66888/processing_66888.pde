
void setup(){
  size(400,400);
  background(240);
  smooth();
  noStroke();
  frameRate(60);
}

void draw(){
  for(int i=0;i<10;i++);
  noStroke();
  fill(random(250),random(250),random(250));
  rect(50,mouseY,20,20);
  
  fill(random(250),random(250),random(250));
  rect(mouseX,50,20,20);
  
  fill(random(250),random(250),random(250));
  rect(350,mouseY,20,20);
  
  fill(250,random(250),random(250));
  rect(mouseY,mouseX,mouseX,mouseY);
  
  fill(100,250,100);
  ellipse(250,250,mouseX,mouseY);
  noFill();
  stroke(1);
  ellipse(100,100,mouseX,mouseY);
}
