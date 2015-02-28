
void setup() {
size(480, 480);
smooth();
 
}
 
void draw()
 
{
  background(127);//setting the background in the loop to only have one circle shown at a time
float y = (height*0.5);//centering the circle at the middle of the height
float x = (mouseX);//setting placement on the x-axis to mouseposistion
float d = (mouseY);//setting diameter to mouseposition on y-axis
 
  fill(255,200);
  stroke(255,200);
ellipse(x, y, d, d);//drawing light circle
 
  fill(0,200);
  stroke(0,200);
ellipse(width-x, y, width-d, width-d);//drawing dark circle, and making it the opposit of the light circle
 
}

