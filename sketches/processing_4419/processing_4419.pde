
void setup () {
  size (400, 400);
  frameRate(8);
  colorMode(RGB);
}

void draw() {
  background(255);
  stroke(random(255));
  float heightUp = random(20, 300);
  float colourtest = 30;
 
  
   for (int test = 0; test < width; test += 10) {  
    rect(test, 400, 10, -heightUp);
    color(colourtest+heightUp);
    fill (random(255));
   
   
    heightUp = random(20, 300); 
  }}
  


