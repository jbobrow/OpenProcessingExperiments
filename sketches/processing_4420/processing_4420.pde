
void setup () {
  size (400, 400);
  frameRate(5);
  colorMode(HSB, height);
}

void draw() {
  background(400);
  //stroke(random(255));
  float heightUp = random(20, 300);
  float colourtest = 20;
 
  
   for (int test = 0; test < width; test += 10) { 
    fill (colourtest+heightUp,400,400); 
    rect(test, 400, 10, -heightUp);
    //color(colourtest+heightUp);
    
   
   
    heightUp = random(20, 300); 
  }}

