
PImage img;
PImage img2;

void setup() {
  size(700, 700);
  img = loadImage("awarhol_jmbasquiat.jpg");
  img2 = loadImage("basquiat4.jpg");
  imageMode(CENTER);
  noStroke();
  background(255);
}

void draw() { 



  int i = 0;
  while (i <= 25) {
    drawPoint();
    i = i +1;
  }
}

void drawPoint() {

  
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);

  float value = brightness (pix);
  int i = round( map (value, 0, 255, 0, 700*700-1) );
  color c2 = img2.pixels[i];


  fill(c2, 128);
  rect(x, y, random(0,15), random(0,15));
}



