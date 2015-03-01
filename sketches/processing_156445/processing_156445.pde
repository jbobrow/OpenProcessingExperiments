
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
counter++
stroke (42, 235, 152); 
if (mousePressed) {
line(250, 250, mouseX, mouseY)
}
else {
fill (74, 74, 168);
stroke (0);
ellipse (mouseX, mouseY, 50, 50);
}
}
