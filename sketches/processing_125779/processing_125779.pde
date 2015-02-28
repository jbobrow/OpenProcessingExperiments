
int counter;

void setup() {  //setup function called initially, only once
  size(400, 400);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
background (222, 224, 199);



fill(60, 92, 15);

textSize(25);

text("Luukku 17", 145, 350);



noStroke();

fill (54, 92, 89);



ellipse(200, 200, 100, 94);

bezier(179, 159, 275, 75, 218, 144, 316, 256);

ellipse(150, 160, 50, 50);

triangle (126, 158, 111, 166, 134, 174);

quad (219, 183, 220, 237, 273, 300, 317, 281);
}
