
float bx;
float by;
boolean fillerUp = false;
float yOffset = 0.0;
String textContent = "";
float amount;
  
void setup()
{
  size(640, 640);
  background(#000000);
}
  
void draw()
{
  fill(#FF0000);
  rect(0, 0 , mouseX, height);
  fill(#F0F0F0);
  rect(mouseX, 0, width - mouseX, height);
strokeWeight(4);
stroke(#000000);
noFill();
rect(100,100, width-200, height - 200);
fill(#FFFFFF);
stroke(#FFFFFF);
strokeWeight(0);
rect(0,0,width, 100);
rect(0,0,100, height);
rect(0,height-100,width, 100);
rect(width-100, 0, 100, height);
fill(0);
text(textContent, 20, height- 20);
amount = (mouseX-100);
}

void mousePressed() 
{
  fill(#FFFFFF);
  textContent = "% " + ((amount/(width-200))*100);
}
