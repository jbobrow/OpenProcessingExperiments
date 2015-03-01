
int counter;

void setup() {  //setup function called initially, only once
  size(800, 200);
  background(255);  
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 2;
  smooth();
}
void draw()
{
  if (mousePressed)
  {
    fill(266);
  }
  else
  {
    fill(0);
  }
  
//void draw()
 // counter++;
 // fill(random(2),105,105,100);
  
  if(mousePressed == true) { //add some interaction,,,,?
    ellipse(mouseX, mouseY, 55, 55);
  }
  else {
    ellipse(width/1, height/1, 1*sin(counter), 1*sin(counter));
  }
}
