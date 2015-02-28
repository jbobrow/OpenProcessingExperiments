
void setup(){
  size(300,300);
  smooth();
  background(50);
  colorMode(HSB,200);
}

void draw(){
  
  stroke(100,100,100);
  fill(100,100,100);
  rect(0,100,100,300);
  
  stroke(100,70,90);
  rect(mouseX,100,mouseX,100);
  rect(100,-mouseY,100,-mouseY);
  
  fill(230);
  ellipse(100,mouseY,50,50);
  
  fill(230);
  ellipse(mouseY,200,50,50);
  
  stroke(6);
  fill(116,37,73);
  ellipse(width/2,height/2,mouseX,mouseX);
  
  stroke(4);
  fill(245,15,122);
  ellipse(width/2,height/2,140,140);
  
  stroke(2);
  fill(mouseX);
  ellipse(width/2,height/2,100,100);

}

