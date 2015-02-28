
PImage a;

void setup() {
  size(370, 278);

  a = loadImage("peepingtom_370x278.jpeg");
}

void draw() {
  background(80);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2); 
  if (mouseX < width/2 && mouseY < height/2)
    image(a, 0, 0);
}


