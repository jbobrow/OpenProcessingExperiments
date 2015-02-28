
/* @pjs preload="/static/uploaded_resources/p.1954/earth.png"; */
 
PImage pinky;
PImage rose1;
PImage rose2;
PImage rose3;
PImage rose4;
PImage closed;
PImage halfopen;
PImage openhand;
PImage bird1;
PImage bird12;
PImage bird13;
PImage bird2;
PImage bird22;
PImage bird23;
PImage bird24;
PImage bird14;


int counter = 0;
 
void setup() {
  size(600, 600);
  pinky = loadImage("pinky.jpg");
  imageMode(CENTER);
  frameRate(1);
  smooth();
  
  rose1 = loadImage("rose1.png");
  rose2 = loadImage("rose2.png");
  rose3 = loadImage("rose3.png");
  rose4 = loadImage("rose4.png");
  closed = loadImage("closeddhand.png");
  halfopen = loadImage("halfopenhand.png");
  openhand = loadImage("openhand.png");
  bird1 = loadImage("bird1.png");
  bird12 = loadImage("bird12.png");
  bird13 = loadImage("bird13.png");
  bird2 = loadImage("bird2.png");
  bird22 = loadImage("bird2.2.png");
  bird23 = loadImage("bird23.png");
  bird24 = loadImage("bird24.png");
  bird14 = loadImage("bird14.png");
  
}
 
void draw() {
  background(pinky);
  
  if (counter == 0) {
    
    image(closed, 400, 500);
    
  }
  
  
  if (counter == 1) {
    image(rose1,300,300);
    image(halfopen, 400, 500);
    
    image(bird1, 320 , 330);
    
    
  }
  
  
  if (counter == 2){
    image(rose2,300,300);
    image(bird12, 220, 299);
    image(bird2, 330, 315);
  }
  
  if(counter == 3){
    image(rose3,300,300);
    image(bird13,120,250);
    image(bird22, 280, 250);
    
  }
  
  if(counter ==4){
    image(rose4,300,300);
    image(bird14,5,200);
    image(bird23, 190,180);
    
  }
  
  if(counter == 5){
    image(rose4,300,300);
    image(bird24, 30, 50);
    
  }
  
  
  if (counter >= 2) {
    image(openhand,400,500);
    
  }
  
  counter = counter + 1;
  if (counter >= 6) {
    counter = 0;
  }
    
//  float x = random(width);
//  float y = random(height);
//  float d = random(100, 300);
//  image(earth, x, y, d, d);
}
 

