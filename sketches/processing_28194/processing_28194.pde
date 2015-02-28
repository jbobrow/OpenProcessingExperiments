
	
void setup() {
  
  size (800,600);
  
  PImage fons;
  fons = loadImage("girasoles.jpg");
  fons.resize(800,600);
  image(fons, 0, 0);
  
}

void draw() {

  scale(0.5);
  float grados = 15;

  ////////////////////////////Branca
  pushMatrix();
  translate (270,460);
  smooth();
  strokeWeight(5);
  //strokeCap(ROUND);
  stroke(#053102);
  line(270,460,270,133);
  
  ///////////////////////////Flor-centre
  pushMatrix();
  translate(270,133);
  smooth();
  strokeWeight(2);
  fill (55,30,3);
  stroke(255,166,0);
  ellipse (0,0,50,50);
  
  ///////////////////////////Petals
  smooth();
  strokeWeight(2);
  fill(255,170,0);
  stroke(255,200,0);
 
  for (int i=0; i<24;i++){
    pushMatrix();
    float radianes = radians(grados*i);
    rotate (radianes);
    translate (0,-55);
    ellipse (0,0,15,60);
    popMatrix();
    }
 
  popMatrix();
  popMatrix();
 
}





