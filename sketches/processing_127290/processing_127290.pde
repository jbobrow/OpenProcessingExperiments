
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 

ellipse(120,45,90,90);
rect(75,80,90,125);
line(30,160,76,90);
line(165,80,200,165);
ellipse(40,140,50,50);
 }
