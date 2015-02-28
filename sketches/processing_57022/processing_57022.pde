
void setup (){
  size(800, 800);
  frameRate(14);
  //how fast the random things generate (X # of things per second. Default is 30 per sec.)

}



void draw(){
  
  noStroke();
  fill (random(200,255), random (0, 66), random(100,173), 100);
rect(random(800), random(800), 50, 50);
  // will generate a random number between 0 and whatever number you put in the ()
  
  
}

