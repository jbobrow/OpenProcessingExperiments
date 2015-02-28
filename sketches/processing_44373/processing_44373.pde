
PImage redtype;
PImage type;

void setup() {
  size(600, 600);
  background (255);
  redtype = loadImage ("redtype.jpg");
  type = loadImage ("type.jpg");
}

void draw() {
  background (255);
  image(redtype, 0, -60, 600, 600);
  image(type, 0, 300, 600, 600);

  //redtype
    if (mousePressed)
    image (redtype, 300, 600);
    copy(mouseX, mouseY, mouseX, mouseY, mouseX, mouseY, 200, 200);
    
}

