
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Jieun
// ID: 201420072
//import ddf.minim.*;

//Minim minim;
//AudioInput input;

float a=0;
float x;
void setup() {
  size (600, 600, P3D);
  smooth();
  background(0);
  //minim = new Minim (this);
  //input = minim.getLineIn (Minim.MONO, 512);
}

void draw() {
  lights();
  //float dia = input.mix.level() * 250;
  //x += input.mix.level() * 100;
  pushMatrix();
  translate(width/2, height/2);
  strokeWeight(4);
  rotateY(cos(a));
  stroke(108, 232, 202, 9);
  rotateX(sin(mouseY));
  fill(9, 50);
  sphere(200);
  popMatrix();
  a=+0.01;

  title();
}

void title() {   
  fill(255);  
  textAlign(RIGHT); 
  text("KIM Jieun, Untitled, Dynamic Media, 2014", width-50, height-20);
} 
void keyPressed() { 
  if (key=='s') saveFrame("201420072_KIM_Jieun/####.jpg");
}

