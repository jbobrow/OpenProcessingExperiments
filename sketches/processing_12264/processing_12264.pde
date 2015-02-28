
//Colorfulls by Vanessa Wong
// 17 Sep. 2010
void setup()
{
  size(500, 500);
  smooth();
  noStroke();
  //noCursor();
  fill(255);
  background(90, 78, 90);
 
}

void draw(){
if(mousePressed){//presss the mousse and drag
  {
  
  //background(mouseX-45, mouseY-67, mouseY-48);
  fill(mouseX, mouseY, 78);   
  rect(mouseX, mouseY, 70, 35, 60, 40);
  //rect(mouseX+20, mouseY+20, 45, 50);
  fill(mouseY, mouseY, 255);
  triangle(mouseX+5, mouseY, mouseX-5, mouseY, 250, 250);
  fill(mouseX, 70, mouseY);       
  ellipse(mouseX, mouseY, 40, 15);
  fill(mouseY, 60, mouseX);
  ellipse(mouseX+70, mouseY, 40, 15);
  //quad(mouseX, mouseY, 15, 9, 8, 10, 17, 19);
  }
}
}


