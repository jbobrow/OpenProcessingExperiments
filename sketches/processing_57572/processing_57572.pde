
//Flower array
int numFlower = 14;
Flower[] flowers = new Flower[numFlower];

//Variables
float x = 100.0;
int z = 0;
float xPos;
float yPos;
float tilt = .01;
float scalar = 66;

//Declaring myCloud
Cloud myCloud = new Cloud();
  
//Set up  
void setup() {
  size (600, 400);
  smooth ();
  for(int i = 0; i < flowers.length; i++) {
    flowers[i] = new Flower(color(255,0,0), 25, 25, tilt, scalar);
  }
}

//DRAW
void draw() {
  background(#3BB9FF);
   myCloud.show();
   myCloud.go();
  for (int i = 0; i < flowers.length; i++) {
    noStroke();
    pushMatrix();
    //The translate line is modified from Professor LeMasters
    //Flower_ClassLExperiment draft 1: March 26, 2012
    //http://openprocessing.org/sketch/57305
    translate(i*50 - 225, height/1.59);
    flowers[i].doFlower();
    flowers[i].sway();
    popMatrix();
  }
}




