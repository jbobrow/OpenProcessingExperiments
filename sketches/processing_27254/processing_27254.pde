
PImage nybras[];

void setup() {
  size(600,600);
  smooth();
  textSize(11);
  stroke(64,64);
  
  nybras = new PImage[81];
  for (int y=0; y<9; y++)
    for (int x=0; x<9; x++) {
      int i = y*9+x;
      nybras[i] = loadImage("n" + nf(i,2) + ".jpg");
    }
}

void draw() {
  int i = int(mouseY/66.67) * 9 + int(mouseX/66.67);
  image(nybras[i], 0, 0);
  
  noFill();
  for (int y=0; y<9; y++)
    for (int x=0; x<9; x++)
      rect (x*66.67, y*66.67, 66.67, 66.67);
  
  fill(128);
  int l=1;
  text("mouseX: "+mouseX, 10, 15*l++);
  text("mouseY: "+mouseY, 10, 15*l++);
  text("mouseX / 66.67: "+int(mouseX/66.67), 10, 15*l++);
  text("mouseY / 66.67: "+int(mouseY/66.67), 10, 15*l++);
  text("image: "+i, 10, 15*l++);
}


