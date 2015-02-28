
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(0,255,255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}
void draw(){
textSize(55, 55);
text("Zac", 90, 135);
fill(100);
textAlign(LEFT);
}
