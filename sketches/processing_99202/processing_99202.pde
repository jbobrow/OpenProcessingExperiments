
float redAmount;
float greenAmount;
float blueAmount;


void setup ()
{
  size(600, 400) ;
  background(255, 255, 255) ;
  smooth();
  frameRate(60);
}

void draw()
{
  redAmount = random(255);
  greenAmount = random(255);
  blueAmount = random(255);

  strokeWeight(4);

  fill(255);
  rect(0, 0, width, height);


  fill( redAmount, greenAmount, blueAmount);
  stroke( redAmount, greenAmount, blueAmount);

  line(0, 0, mouseX, mouseY); 
  line(0, 0, mouseY, mouseX); 
  line(mouseX,mouseY,width,0);
  line(mouseY,mouseX,width,0);
  line(mouseX,mouseY, width, height);
  line(mouseY,mouseX, width, height);
  line(mouseX, mouseY, 0, height);
  line(mouseY, mouseX, 0, height);

  ellipse(mouseX, mouseY, 50, 50);
