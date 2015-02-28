
int counter = 0;
 
PImage [] images = new PImage [10];
 
void setup() {
    size (302,450);
    smooth();
 
    images[0] = loadImage ("frypan1.png");
    images[1] = loadImage ("frypan2.png");
    images[2] = loadImage ("frypan3.png");
    images[3] = loadImage ("frypan4.png");
    images[4] = loadImage ("frypan5.png");
    images[5] = loadImage ("frypan6.png");
    images[6] = loadImage ("frypan7.png");
    images[7] = loadImage ("frypan8.png");
    images[8] = loadImage ("frypan9.png");
     images[9] = loadImage ("frypan10.png");
   
   
     
    }
 
void mousePressed() {
  if(counter < 9) {
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


