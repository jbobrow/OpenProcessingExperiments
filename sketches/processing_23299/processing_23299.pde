
int counter = 0;
 
PImage [] images = new PImage [3];
 
void setup() {
    size (302,450);
    smooth();
 
    images[0] = loadImage ("rdoor.png");
    images[1] = loadImage ("rdooropen.png");
    images[2] = loadImage ("rdoorlock.png");
     
    }
 
void mousePressed() {
  if(counter < 2) {
    counter++;
  }
  else {
    counter=0;
  }
}
 
void draw() {
  background(255);
  imageMode(CENTER);
  image(images[counter], 151,225);
  
}


