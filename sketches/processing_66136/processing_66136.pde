
PImage miro; 
int wid = 187;
int hei = 175;

color picsel;
color bg = color(255, 198, 53);

void setup() {
  size(wid*3, hei*3); //  size(380, 350);
  background(bg);
  miro = loadImage("miro02.jpg");
  miro.resize(wid*3, hei*3);
  image(miro, 0, 0);
}

void draw() {
  picsel = get(mouseX, mouseY);
  stroke(picsel);

  if (mousePressed) {
    line(pmouseX, pmouseY, mouseX, mouseY);
    strokeWeight(abs(pmouseX-mouseX)+5);
  }
}

// save image to pdf 
void keyPressed() {
  if (keyCode == DOWN) {
    saveFrame("line-##.tif");
  }
  if (keyCode == UP) {
    background(bg);
  }
}


