
//Mauricio Orantes
//Computational Expressions
//Creating 12 flowers, with image background and moving cloud
//email: meo64@georgetown.edu

PImage img;
cloud con1; //creates cloud 

void setup() {
  size(600, 400);
  img = loadImage("sky.jpg");// image of the sky
  background(255);
  smooth(); 
  noStroke();
   con1 = new cloud(-9, 0, #000000, 5);// object called once, previously in the draw loop, the big reason it did not function the first time
   

}

void draw() {
  fill(#1A2C17);//background color
  image(img, 0, 0); //image call
  ground(); //grass function

 randomSeed(0);
  for (int i =35; i < width + 50; i +=50) {
    float scalar = random(0.25, 1.0);
    flower(i, 380, scalar);
  }
 con1.makecloud(); //creates cloud
 
  
}

// This function is for the Grass
void ground() {
  fill(#1A2C17);
  rect(0, 350, 600, 350);
 }


