

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB, 360, 100, 100);
  
  x = 0;
  y = 0;
  myImage = loadImage("http://dummyimage.com/100.png");

}

void draw() {  //draw function loops 
  image(myImage, x, y);
  x += 1;
  y += 1;
}
