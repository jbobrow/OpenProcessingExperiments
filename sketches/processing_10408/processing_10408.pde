

float diametro ;

float r;
float g;
float b;
float a;

float diam;
float x;
float y;

void setup() {
  size(700,700);
  background(172,222,230);
  smooth(); 
  noCursor();
}

void draw() {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(500);
  x = random(width);
  y = random(height);
  

  noStroke(); 
  fill(172,222,230);
    quad(mouseX,mouseY,100,100,100,100,100,100);
      fill(r,g,b,a);

  ellipse(mouseX,mouseY,200,200);
 
}

void mouseDragged() {
  diametro = random(0,500);
  println("has arastrado el raton");
  stroke(0,175,216);
  strokeWeight(2);
  ellipseMode(CENTER) ;
  ellipse(mouseX,mouseY,diametro,diametro);

}






