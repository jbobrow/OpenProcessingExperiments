
PImage cat;
PImage cupcake;
 
void setup() {
   
  size(500,300);
 
  cat = loadImage("cat.png");
  cupcake = loadImage("cupcake.png");

   
   
  float c = map(mouseX, 0,width, 175,10);
  background(c,c,c);
}
 
void draw() {
   
  float ellipse1x;
ellipse1x = random (-100, 900);
float ellipse1y;
ellipse1y = random(-100, 900);
 
float back = map(mouseX, 0,width, 500,-500 );
  image(cat,back,50);
 

 float front = map(0,mouseY,width,60,-10);
  image(cupcake, front, 100);
   
}

   




