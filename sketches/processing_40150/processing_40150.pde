
//credit to Nick Senske for dotFilter code

PImage pic;
int cell = 7;  //dot size

void setup() {
  pic = loadImage("wallframe.png"); // saved file of wall
  size(300, 300);
  smooth();
}



void draw() {
  background(pic);
   noStroke();
  for (int y=cell; y <= 299; y+=cell) {    
    for (int x=cell; x <= 299; x+=cell) {



      color sameC = color(pic.pixels[x + (y * 300)]); //pics the color of the blocks
      fill(sameC);


      float radius = cell / (brightness(pic.pixels[x + (y * 300)]) / 100);
      rectMode(CENTER);
      rect(x, y, radius, radius);  //places rectangles
    }
  }
}


