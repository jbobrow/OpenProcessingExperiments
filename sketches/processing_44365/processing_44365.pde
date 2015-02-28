
PFont font;


void setup() {
size(480,120);
smooth();
  font = loadFont("BentonSans-Medium-20.vlw");
  textFont(font);
}

void draw(){
  background(204);
  randomSeed(0);
  for (int i = 35; i < width + 40; i += 40) {
    int gray = int(random(0,102));
    float scalar = random(0.25, 1.0);
    owl(i,110, gray, scalar);
    
    // if mouse pressed
  if (mousePressed == true) {
    // draw black box
    noStroke();

    fill(0, 0, 0, 35);
    rect(0, 0, 480, 120);
    textFont(font);
    fill(255);
    textSize(20);
    text("Happy Owl-ween", 10, 108);
  }
  
}
}
void owl(int x, int y, int g, float s) {
  pushMatrix();
  translate (x, y);
  scale(s); //sets the scale
  stroke(g); //sets the gray value
  strokeWeight(70);
  line(0, -35, 0, -65);   //body 
  noStroke();
  fill(255-g);
  ellipse(-17.5, -65, 35, 35); //left eye dome
  ellipse(17.5, -65, 35, 35); //right eye dome
  arc(0, -65, 70, 70, 0, PI); //chin
  fill(g);
  ellipse(-14, -65, 8, 8); //left eye
  ellipse(14, -65, 8, 8); //right eye
  quad(0, -58, 4, -51, 0, -44, -4, -51); //beak
  popMatrix();
 }
{
}

