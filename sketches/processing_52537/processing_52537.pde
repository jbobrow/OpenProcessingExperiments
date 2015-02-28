
/* @pjs preload="/static/uploaded_resources/p.1954/earth.png"; */

float angle = 0.0; 
//int angle;
PImage pinky;
PImage rose4;
PImage bird1;

   float x, y;
   float xspeed, yspeed;
   float xdirection, ydirection;
   
PImage bird2;


 
void setup() {
  size(600, 600);
  pinky = loadImage("pinky.jpg");
  imageMode(CENTER);
  smooth();
  
  rose4 = loadImage("rose4.png");
  
  bird1 = loadImage("bird1.png");
  
  bird2 = loadImage("bird2.png");
    
    x = width/2;
    y = height/2;
    xspeed = 2.8;
    yspeed = 2.2;
    xdirection = 1;
    ydirection = 1;
    
    angle = 0;
  
    
}
 
void draw() {
  background(pinky);
  
  pushMatrix();
  translate(300,300);
  rotate(angle);
  image(rose4, 0, 0, 300,300);
  angle += .04;
  popMatrix();
  
  x += xspeed * xdirection;
  y += yspeed * ydirection;
  image(bird1, x, y, 180, 180);
  
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(angle));
  image(bird2, 0, 0, 350, 300);
  popMatrix();
  angle++;
  
  
  if (x > width-50 || x < 0)
  xdirection *= -1;
  
  if (y > height-50 || y < 0)
  ydirection *= -1;
  
  

    
  }
  
//  
//  if (counter == 1) {
//    image(rose1,300,300);
//    image(halfopen, 400, 500);
//    
//    image(bird1, 320 , 330);
//    
//    
//  }
//  
//  
//  if (counter == 2){
//    image(rose2,300,300);
//    image(bird12, 220, 299);
//    image(bird2, 330, 315);
//  }
//  
//  if(counter == 3){
//    image(rose3,300,300);
//    image(bird13,120,250);
//    image(bird22, 280, 250);
//    
//  }
//  
//  if(counter ==4){
//    image(rose4,300,300);
//    image(bird14,5,200);
//    image(bird23, 190,180);
//    
//  }
//  
//  if(counter == 5){
//    image(rose4,300,300);
//    image(bird24, 30, 50);
//    
//  }
//  
//  
//  if (counter >= 2) {
//    image(openhand,400,500);
//    
//  }
//  
//  counter = counter + 1;
//  if (counter >= 6) {
//    counter = 0;
//  }
//    
////  float x = random(width);
////  float y = random(height);
////  float d = random(100, 300);
////  image(earth, x, y, d, d);
//}
// 

