
int counter;

void setup() {  //setup function called initially, only once
  size(400, 400);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  //translate(200,200);
  stroke(0,0,0);
  strokeWeigth(1);
}
int size = 200;

void draw() {  //draw function loops 
   rect(20,20,100,100);
   rect(-size/2, -size/2, size, size);
   rotate(10);
   scale(0.8);
}
