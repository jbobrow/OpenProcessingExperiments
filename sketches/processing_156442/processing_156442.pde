
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
counter++
stroke (0);
line(250, 250, mouseX, mouseY)
line (250, 250, 50, 50);

}
