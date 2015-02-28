
int counter = 0;
 
PImage [] images = new PImage [11];
 
void setup() {
    size (302,450);
    smooth();
 
    images[0] = loadImage ("stairs2.png");
    images[1] = loadImage ("stairs3.png");
    images[2] = loadImage ("stairs4.png");
    images[3] = loadImage ("stairs5.png");
    images[4] = loadImage ("stairs6.png");
    images[5] = loadImage ("stairs7.png");
    images[6] = loadImage ("stairs8.png");
    images[7] = loadImage ("stairs9.png");
    images[8] = loadImage ("stairs10.png");
    images[9] = loadImage ("stairs11.png");
    images[10] = loadImage ("stairs12.png");
     
    }
 
void mousePressed() {
  if(counter < 10) {
    counter++;
  }
  else {
    counter=0;
  }
}
 
void draw() {
  background(255);
  imageMode(CENTER);
  image(images[counter], 200,225);
  
}


