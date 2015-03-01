
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 

fill(239, 17, 195);
stroke (239, 17, 195);
 beginShape ();

vertex (0, 50);
vertex (50, 0);
vertex (250, 100);

vertex (450, 0);
vertex (500, 50);
vertex (250, 500);
endShape();
}
