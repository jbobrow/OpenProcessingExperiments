
PImage planet;
float pmillis = 0;
float x, y, d;
float angle, inc;
 
void setup() {
  size(1024, 768);
  smooth();
  planet = loadImage("roulette.png");
  imageMode(CENTER);
}
 
void draw() {
  background(4,147,20);
  

 
  if (millis() - pmillis >= 4000) {
    x = x+50;
    y = y+50;
    d = 200;
    inc = random(-0.1, 0.2);
     
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


