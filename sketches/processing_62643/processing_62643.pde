
void setup() {
  size(300,300);
  background(255);
}
void draw() {
   background(240,240,240);
  ellipseMode(CENTER);
  noStroke();
  
  //ellipse rot
  
  fill(250,10,10,100);
  ellipse(75,75,mouseX,mouseY);
  ellipse(150,75,mouseX,mouseY);
  ellipse(225,75,mouseX,mouseY);
  
  
  //ellipse gelb
  
  fill(250,240,0,100);
  ellipse(75,150,mouseX,mouseY);
  ellipse(150,150,mouseX,mouseY);
  ellipse(225,150,mouseX,mouseY);
  
  
  //ellipse blau
  
   fill(0,120,255,100);
  ellipse(75,225,mouseX,mouseY);
  ellipse(150,225,mouseX,mouseY);
  ellipse(225,225,mouseX,mouseY);
  
  
  
   println(mouseX);

 }
