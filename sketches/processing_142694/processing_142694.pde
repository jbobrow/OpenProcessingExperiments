
PImage[] img = new PImage [15];



//PImage img;
//PImage img1;
//PImage img2;
//PImage img3;
//PImage img4;
//PImage img5;
//PImage img6;
//PImage img7;
//PImage img8;
//PImage img9;
//PImage img10;
//PImage img11;
//PImage img12;
//PImage img13;
//PImage img14;



void setup() {
  size(900, 270);
  noStroke();
  background(255);
  img [0] = loadImage("wave1.jpg");
  img [1] = loadImage("wave2.jpg");
  img [2] = loadImage("wave3.jpg");
  img [3] = loadImage("wave4.jpg");
  img [4] = loadImage("wave5.jpg");
  img [5] = loadImage("wave6.jpg");
  img [6] = loadImage("wave7.jpg");
  img [7] = loadImage("wave8.jpg");
  img [8] = loadImage("wave9.jpg");
  img [9] = loadImage("wave10.jpg");
  img [10] = loadImage("wave11.jpg");
  img [11] = loadImage("wave12.jpg");
  img [12] = loadImage("wave13.jpg");
  img [13] = loadImage("wave14.jpg");
  img [14] = loadImage("wave15.jpg");
  
}
   
void draw() {
  
float x = width/10;
float y = height/3;

int p = int(random(15));

  fill(random(250), random(250), random(250), random(250));
 if(key == 'q' && keyPressed == true) {
     image(img[p], 0, 0, width/10, height/3);
   }
 if(key == 'w' && keyPressed == true) {
     rect(x, 0, width/10, height/3);
   }
 if(key == 'e' && keyPressed == true) {
     image(img[p], 2*x, 0, width/10, height/3);
   }
 if(key == 'r' && keyPressed == true) {
     rect(3*x, 0, width/10, height/3);
   }
 if(key == 't' && keyPressed == true) {
     image(img[p], 4*x, 0, width/10, height/3);
   }
 if(key == 'y' && keyPressed == true) {
     rect(5*x, 0, width/10, height/3);
   }
 if(key == 'u' && keyPressed == true) {
     image(img[p], 6*x, 0, width/10, height/3);
   }
 if(key == 'i' && keyPressed == true) {
     rect(7*x, 0, width/10, height/3);
   }
 if(key == 'o' && keyPressed == true) {
     image(img[p], 8*x, 0, width/10, height/3);
   }
 if(key == 'p' && keyPressed == true) {
     rect(9*x, 0, width/10, height/3);
   }
 if(key == 'a' && keyPressed == true) {
     rect(0, y, width/10, height/3);
   }
 if(key == 's' && keyPressed == true) {
     image(img[p], x, y, width/10, height/3);
   }
 if(key == 'd' && keyPressed == true) {
     rect(2*x, y, width/10, height/3);
   }
 if(key == 'f' && keyPressed == true) {
     image(img[p], 3*x, y, width/10, height/3);
   }
 if(key == 'g' && keyPressed == true) {
     rect(4*x, y, width/10, height/3);
   }
 if(key == 'h' && keyPressed == true) {
     image(img[p], 5*x, y, width/10, height/3);
   }
 if(key == 'j' && keyPressed == true) {
     rect(6*x, y, width/10, height/3);
   }
 if(key == 'k' && keyPressed == true) {
     image(img[p], 7*x, y, width/10, height/3);
   }
 if(key == 'l' && keyPressed == true) {
     rect(8*x, y, width/10, height/3);
   }
 if(key == ';' && keyPressed == true) {
     image(img[p], 9*x, y, width/10, height/3);
   }
 if(key == 'z' && keyPressed == true) {
     image(img[p], 0, 2*y, width/10, height/3);
   }
 if(key == 'x' && keyPressed == true) {
     rect(x, 2*y, width/10, height/3);
   }
 if(key == 'c' && keyPressed == true) {
     image(img[p], 2*x, 2*y, width/10, height/3);
   }
 if(key == 'v' && keyPressed == true) {
     rect(3*x, 2*y, width/10, height/3);
   }
 if(key == 'b' && keyPressed == true) {
     image(img[p], 4*x, 2*y, width/10, height/3);
   }
 if(key == 'n' && keyPressed == true) {
     rect(5*x, 2*y, width/10, height/3);
   }
 if(key == 'm' && keyPressed == true) {
     image(img[p], 6*x, 2*y, width/10, height/3);
   }
 if(key == ',' && keyPressed == true) {
     rect(7*x, 2*y, width/10, height/3);
   }
 if(key == '.' && keyPressed == true) {
     image(img[p], 8*x, 2*y, width/10, height/3);
   }
  if(key == '/' && keyPressed == true) {
     rect(9*x, 2*y, width/10, height/3);
   }
}


