
void setup(){
  
  size(250,250);
  smooth();
}

void draw(){
  
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  background(0,100,255);
  
  fill(0,255,0);
  rect(125,210,252,102);
  
  fill(70,10,0);
  rect(190,150,20,40);
  
  fill(40,150,0);
  triangle(190,50,160,130,220,130);
  
  fill(255);
  ellipse(mouseX,mouseY,15,15);
  line(mouseX,mouseY+7.5,mouseX,mouseY+30);
  line(mouseX,mouseY+7.5,mouseX-10,mouseY+15);
  line(mouseX,mouseY+7.5,mouseX+10,mouseY+15);
  line(mouseX,mouseY+30,mouseX-10,mouseY+45);
  line(mouseX,mouseY+30,mouseX+10,mouseY+45);
  
  fill(255,255,0);
  ellipse(40,30,30,30);

}


