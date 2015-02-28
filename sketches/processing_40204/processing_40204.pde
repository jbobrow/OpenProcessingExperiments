
PImage myPic;

void setup() {
  size(300, 300);
  myPic = loadImage("clown_fish.jpg");
  noStroke();
  smooth();
}

int cell = 1; // the size of the "pixels" 

void draw() {
  background(0);


  for (int y=cell; y <= 299; y+=cell) {    
    for (int x=cell; x <= 299; x+=cell) {
  // randomly chooses a color from the original image to fill the rectangles
      int a= int(random(0, myPic.width));
      int b= int(random(0, myPic.height));
      color myColor = myPic.get(a, b);
      fill(myColor);
 //this determines the size of the rectangle drawn based on the brightness of the original image
      float radius = cell * (brightness(myPic.pixels[x + (y * 300)]) / 200);
      rect(x, y, radius, radius);
    }
  }
 
}


