
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  fill ( 43,403,103,32);
  rect ( 100, 30, 100, 100); 
  fill (121,32,212);
  triangle(30, 75, 58, 20, 86, 75);
  fill(random);
  quad(20, 161, 86, 150, 169, 163, 130, 176);
  
}
