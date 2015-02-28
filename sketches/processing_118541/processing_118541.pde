
PImage fish1;
PImage fish2;
PImage fish3;
float fish1X; 
float fish1Y;
float fish2X;
float fish2Y;
float fish3X;
float fish3Y;
float fish1Xspeed = -1;
float fish1Yspeed = -0.5;
float fish2Xspeed = 0.5; 
float fish2Yspeed = 1;
float fish3Xspeed = -0.5;
float fish3Yspeed = 1;
float x = 0;
float y = 0;


void setup() {
  size(700, 700);
  fish1X = 550; 
  fish1Y = 350;
  fish2X = width/2;
  fish2Y = height/2;
  fish3X = 500;
  fish3Y = 150;
  fish1 = loadImage("fish1.png");
  fish2 = loadImage("fish2.png");
  fish3 = loadImage("fish3.png"); 
  
}


void draw() {
  background(28, 133, 234); 
  image(fish1, fish1X,fish1Y, random(146, 154), random(133, 141));
  image(fish2, fish2X, fish2Y, random(109, 117), random(96, 104));
  image(fish3, fish3X, fish3Y, random(110, 116), random(77, 83));
  
  fish1X = fish1X + fish1Xspeed; 
  fish1Y = fish1Y + fish1Yspeed; 
  fish2X = fish2X +  fish2Xspeed;
  fish2Y = fish2Y + fish2Yspeed;
  fish3X = fish3X + fish3Xspeed;
  fish3Y = fish3Y + fish3Yspeed;
  
  if (fish1X >= width - 150 || fish1X <= 0) {
     fish1Xspeed = fish1Xspeed * -1;
  }   
  
  if (fish1Y >= height - 137 || fish1Y <= 0) {
     fish1Yspeed = fish1Yspeed * -1;
  }   
     
  if (fish2X>= width - 113 || fish2X <= 0) {
     fish2Xspeed = fish2Xspeed * -1;   
  }   
  
  if (fish2Y >= height - 100 || fish2Y<= 0) {
      fish2Yspeed = fish2Yspeed * -1;
  }    
  
  if (fish3X >= width - 131 || fish3X <= 0) {
      fish3Xspeed = fish3Xspeed * -1;
  }

  if (fish3Y >= height - 96 || fish3Y <= 0) {
      fish3Yspeed = fish3Yspeed * -1;
  }

  stroke(127);
  strokeWeight(2);
  
  x = 50;
  while (x < width) {
    line(x, 0, x, height);
    x = x + 50;
  }

  y = 50;
  while (y < height) {
    line(0, y, width, y);
    y = y + 50;
  }  

    
    
}

void mousePressed() {
  fish1Xspeed = -4;
  fish1Yspeed = -2;
  fish2Xspeed = 4;
  fish2Yspeed = 4;
  fish3Xspeed = -4;
  fish3Yspeed = 4;
}  


