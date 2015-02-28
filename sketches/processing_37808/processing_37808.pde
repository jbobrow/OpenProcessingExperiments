
float bam = 0.0;
void setup() {
  size (500, 500);
  fill(255, 255, 255);
  smooth();
  noStroke();
  background(255, 255, 255);
}
 
 
void draw() {
  fill(0,0,0);
  float xPos;
  float yPos;
  int gridSize = 20;
  int gridDistance = 20;
  bam = random(mouseX/5);
  if(bam >= 40) {
     ellipse(random(500),random(500),20,20); 
  }
  //defines the x-coordinate 
  for (int x=0; x<width; x=x+gridDistance) {
    //defines the y-coordinate   
    for (int y=0; y<=height; y=y+gridDistance) {
      //the position is mostly determined by a grid but it also
      //has a component of randomness
      fill((x/2)/(mouseX/50+1)+random(mouseX/3)-random(mouseX/2),120+random(mouseX/2)-random(mouseX/2),60+random(mouseX/2)-random(mouseX/3),100);
      xPos = x;
      yPos = y;
      y += 1;
      //80 is a "magic number" I figured out by trial and error
      //it reduces the amount of randomness
 
      //you can use the functions map and constrain for similar purposes
 
      rect(xPos, yPos, gridSize, gridSize);
    }
  }
}

