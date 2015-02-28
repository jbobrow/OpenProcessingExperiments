
PImage planet;
float pmillis = 0;
float x, y, d;
float angle, inc;

void setup() {
  size(1024, 768);
  smooth();
  planet = loadImage("planet.png");
  imageMode(CENTER);
}

void draw() {
  background(0);

  if (millis() - pmillis >= 1000) {
    x = random(width);
    y = random(height);
    d = random(80, 800);
    inc = random(-0.3, 0.3);
    
    //Back up pmillis
    pmillis = millis();
  }
  
  angle += inc;
  
  pushMatrix();
  translate(x,y);
  rotate( angle );
  image(planet, 0,0, d, d);
  popMatrix();
}



