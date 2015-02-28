
int counter;

void setup() {  //setup function called initially, only once
  size(480, 360);
  background(255);  //set background white
 // colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() { 
  }
void mouseDragged()
{
  fill(random(0,255),random(0,255),random(0,255),100);
  rect(pmouseX, pmouseY, 50, 50);
}
