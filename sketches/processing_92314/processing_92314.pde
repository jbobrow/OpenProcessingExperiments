
//this is what happens when the program starts.
//it only happens once.
void setup()
{
  size(400, 400);
  smooth();
  strokeWeight(15);
  stroke(200);
}

//this tells Processing how to draw
//it happens continuously
void draw() {
  background(240);
  //draw an ellipse centered at 200,200
  //with width 300 and height 300
  fill(250,150,250);
  ellipse(200, 200, 300, 300);
  //draw a line from 100,250 to 300,250
 
  //draw a line from 200,200 to 200,220
  line(200, 180, 200,230);
  
  //eyes
  fill(0,255,200,100);
  ellipse(160,160,40,40);
  ellipse(240,160,40,40);
  fill(200,50,100,100);
  rect(mouseX,mouseY,100,50);
  
}
