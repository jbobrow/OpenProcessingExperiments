
void setup()
{
  size(500,500);
}
void draw()
{
  background(7,181,247);
  //dibuix del fons
  fill(165,120,5);
  stroke(165,120,5);
  rect(0,4*height/5,width,height);
  //dibuix del terra
  fill(46,129,14);
  stroke(46,129,14);
  rect(1.25*width/5,1.5*height/5,50,2.5*height/5);
  ellipse(1.5*width/5,1.5*height/5,50,50);
  rect(0.5*width/5,3*height/5,90,50);
  ellipse(0.5*width/5,3.25*height/5,50,50);
  rect(0.25*width/5,3.25*height/5,50,-46);
  ellipse(0.5*width/5,2.75*height/5,50,50);
  rect(1.5*width/5,2.25*height/5,90,50);
  ellipse(2.40*width/5,2.50*height/5,50,50);
  rect(2.15*width/5,2.55*height/5,50,-50);
  ellipse(2.40*width/5,2.05*height/5,50,50);
  //dibuix del cactus
  stroke(5,5,5);
  fill(5,5,5,0);
  fill(211,202,15);
  stroke(211,234,85);
  ellipse(mouseX,mouseY,40,40);
  stroke(180,140,7);
  fill(3,3,3,0);
  ellipse(mouseX,mouseY,45,45);
  ellipse(mouseX-5,mouseY,37,45);
  ellipse(mouseX,mouseY-5,39,45);
  ellipse(mouseX-7,mouseY,45,32);
  ellipse(mouseX-6,mouseY+4,45,45);
  ellipse(mouseX-5,mouseY+8,33,24);
  stroke(121,109,12);
  ellipse(mouseX+2,mouseY-8,39,25);
  ellipse(mouseX+4,mouseY,32,29);
  ellipse(mouseX+6,mouseY+9,35,29);
  ellipse(mouseX-5,mouseY,45,32);
  ellipse(mouseX+6,mouseY-2,45,45);
  ellipse(mouseX+5,mouseY+3,33,24);
  //dibuix bola de palla
}


