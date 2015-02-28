
void setup() {
size(600, 400);

 }


void draw() {
  PImage df;
df = loadImage("c111.jpg");
background(df);

  fill (233,237,45);
  stroke(10);
  smooth();
  for (int i = 100; i < 600; i += 100) {
  ellipse(i, 300, 40, 40);
 }
  
  if (mouseButton == LEFT && mousePressed == true &&
  mouseX>90 &&  mouseX<110 &&
  mouseY>280 &&  mouseY<320) {
PImage img; 
img = loadImage("a1.jpg");
image(img, 200, 50,200,200);}

 if (mouseButton == LEFT && mousePressed == true && mouseX>180 &&  mouseX<220 &&
  mouseY>280 &&  mouseY<320) {
PImage g; 
g = loadImage("a3.jpg");
image(g, 200, 50,200,200);}

 if (mouseButton == LEFT && mousePressed == true && mouseX>280 &&  mouseX<320 &&
  mouseY>280 &&  mouseY<320) {
PImage g1; 
g1 = loadImage("a5.jpg");
image(g1, 200, 50,200,200);}


if (mouseButton == LEFT && mousePressed == true && mouseX>380 &&  mouseX<420 &&
  mouseY>280 &&  mouseY<320) {
PImage g2; 
g2 = loadImage("a9.jpg");
image(g2, 200, 50,200,200);}

if (mouseButton == LEFT && mousePressed == true && mouseX>480 &&  mouseX<520 &&
  mouseY>280 &&  mouseY<320) {
PImage g6; 
g6 = loadImage("a10.jpg");
image(g6, 200, 50,200,200);

}
}



