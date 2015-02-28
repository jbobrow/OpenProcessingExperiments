
//Rachel Hill Project 1, Drawing Machine
//February 14, 2014

void setup(){
  size(800,800);
  background(0);
  frameRate(.5);
}
  //Variables
  float y = 255;
  float i = 800;
  float s = 100;
  float d = 5; 
  float deg = 90;
  float trans = 100;

void draw() {
  //controls position of shape
   translate(random(height), random(height));
  if( i == 2){
     translate(deg, deg);
    }
    //shape parameters
  for(int a = 0; a < 100; a++){
    fill(random(y), random(y), random(y), random(trans)); // fill colors and opacity
    rotate(deg); //repeats shapes
    stroke(255,100); //stroke color and opacity
    strokeWeight(1); //thickness of stroke
    triangle(10*a, 11*a, s + a * d, s + a * d, random(d), random(d)); //shape created
    
  }
}
//Captures scenes
void mousePressed(){
  saveFrame("Pic ##");
}

