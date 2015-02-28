
PImage sloth;

void setup() {
  size (500,350);
  sloth = loadImage("babySloth.jpg");
  noStroke();
}

void draw(){
  background(0,0,0);
  for (int i=0; i<5000; i++){

  int rx = (int)random(sloth.width);
  int ry = (int)random(sloth.height);
  int index = ry*sloth.width + rx;

  color C = sloth.pixels[index];
  float Cr = red (C);
  float Cg = green (C);
  float Cb = blue (C);

  
  fill (Cr, Cg, Cb);
  rect ( rx,ry, mouseX/10,mouseY/10);
  }
}


