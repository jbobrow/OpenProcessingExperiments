
PImage planet;
  
void setup() {
  size(1024, 768);
  smooth();
  planet = loadImage("planet.png");
  frameRate(1);
  imageMode(CENTER);
}
  
void draw() {
  background(0);
  
  //stars
  
  for(int i=0; i<1000; i++){
     strokeWeight(random(3));
     stroke(255, random(50,255));
     point(random(width), random(height)); 
  }
  //planet
  float x = random(width);
  float y = random(height);
  float d = random(80, 800);
  image(planet, x, y, d, d);
}



