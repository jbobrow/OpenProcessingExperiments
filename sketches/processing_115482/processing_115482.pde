
PImage img;
float a = PI/3.0;
float b = 0.5;
color pcolor;
void setup() {   
    size(500, 500); 
    img = loadImage("paint-palette-clip-art.jpg");
} 
 
void draw() { 
  image(img, 0, 0, 100, 100);
  fill(red(pcolor), green(pcolor), blue(pcolor));
if (keyPressed) {
  if (key == ']') {
    a += 1;      
  }
  if (key == '[') {
    a -= 1;
  }
  if (key == '=') {
    b += 0.1;
  }
  if (key == '-') {
    b -= 0.1;
  }
}  

if (mousePressed == true) {
  if (mouseButton == LEFT) { 
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(a);
    scale(b);
    triangle(20, 0, 40, 40, 0, 40);
    popMatrix();
  }
  if (mouseButton == RIGHT)
  {
    pcolor = get(mouseX, mouseY);
  }
}
}
 


