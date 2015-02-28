
PImage head;
PImage leaves;
PImage face;

int opacity;

float x, y;

void setup() {
  size(640, 480);
  smooth();
  imageMode(CENTER);
  head = loadImage("head.png");
  leaves = loadImage("leaves.png");
  face = loadImage("face.png");
  x = width/2;
  y = height/2;
}

void draw() {
  background(#E5DA97);
  float a = mouseX;
  float bx = mouseX - width;
  pushMatrix(); 
    translate(x, y);
    rotate(radians(mouseX));
    image(leaves, 0, 0, a, a);
    image(head, 0, 0, bx/5, bx/5); 
    tint(#318326, mouseX/5);
    image(leaves, 0, 0, a, a);  
    image(head, 0, 0, bx/5, bx/5); 
    noTint();
    popMatrix(); 
    
    image(face, 320, 240, a/3.5, a/3.5);
}


