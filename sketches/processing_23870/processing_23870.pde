
int counter = 0;
  
PImage [] images = new PImage [3];
  
void setup() {
    size (400,400);
    smooth();
  
    images[0] = loadImage ("image8.jpg");
    images[1] = loadImage ("image9.jpg");
    images[2] = loadImage ("image10.jpg");
      
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
  image(images[counter], 200,200);
   
}

