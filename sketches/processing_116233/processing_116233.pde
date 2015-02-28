
int counter;

void setup() {  //setup function called initially, only once
  size(600, 600);
  background(255,215,0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  line(0,500,600,500);

}

void draw() {

 // draw a 20x20 circle centered

 // at the mouse location

 ellipse(mouseX, mouseY, 20, 20);

ellipse(random(600),random(600),30,30);
frameRate (random(2));

}
