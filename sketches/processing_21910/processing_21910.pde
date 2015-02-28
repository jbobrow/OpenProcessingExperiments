

int counter = 0;

PImage [] images = new PImage [9]; 

void setup() {
    size (700,500);
    smooth();

  
    images[0] = loadImage ("wall1.jpg");
    images[1] = loadImage ("wall2.jpg");
    images[2] = loadImage ("wall3.jpg");
    images[3] = loadImage ("wall4.jpg"); 
    images[4] = loadImage ("wall5.jpg");
    images[5] = loadImage ("wall6.jpg");
    images[6] = loadImage ("wall7.jpg");
    images[7] = loadImage ("wall8.jpg"); 
    images[8] = loadImage ("wall9.jpg");
    
    }

void mousePressed() {
  if(counter < 8) {
    counter++;
  }
  else {
    counter=0;
  }
}

void draw() {
  background(255);
  imageMode(CENTER);
  image(images[counter], 300, 200);
 
}

