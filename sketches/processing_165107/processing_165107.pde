


void setup() {
  //setup function called initially, only once

  size(250, 250);

  background(0);
  //set background white

  colorMode(HSB);
   //set colors to Hue, Saturation, Brightness mode



}


void draw() {

    fill(255);
    rect(mouseX, mouseY, mouseY, mouseX);

}
