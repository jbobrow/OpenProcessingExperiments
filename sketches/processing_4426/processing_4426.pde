
float maxheight = 100;
  float heightUp = random(20, maxheight);
  float colourtest = 30;

void setup () {
  size (400, 400);
  frameRate(8);
  colorMode(HSB, height/2);
}

void draw() {
  
  background(0);
  //stroke(random(255));

  

  
   for (int test = 0; test < width; test += 10) { 
    fill (colourtest+heightUp,400,400); 
    rect(test, 200, 10, -heightUp);
    rect(test, 200, 10, heightUp);
    //color(colourtest+heightUp);
    

   
  
   if(keyPressed) {
   heightUp = random(20, maxheight)+50;
  } else {
   heightUp = random(20, maxheight);
  }
  
  }}
  
void mousePressed() {
  if (maxheight < 400) {
  maxheight += 10;}
  else {maxheight = 50;}
}

