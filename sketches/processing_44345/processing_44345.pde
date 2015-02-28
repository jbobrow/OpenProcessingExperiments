
PImage a;
PImage a1;
int opacity;

void setup() {
  size (600, 600);
  a= loadImage ("a marat2.jpg");
}

void draw (){
image(a,0, 0);
tint(mouseX, mouseY, 255);
filter(INVERT);

}

