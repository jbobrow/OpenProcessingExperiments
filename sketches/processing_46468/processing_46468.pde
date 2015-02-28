

PFont f;
float posX=random(width);
float posY=random(height);
float o = 0.05;
float n;
float m;



void setup() {
  size(800, 600);
  background (255); 
  smooth();
  frameRate(4);
}


void draw() {
   noStroke();
  fill(255, 255, 255, 20);
  rect(0, 0, width, height);
 
  f = loadFont("LiGothicMed-48.vlw");
   posX = random(width);
   posY = random(height);  
 o = o + 0.01;
 n = noise(o) *width;
 m = noise(o) *height;
    
  fill (random(255),random(255),random(255),200);
  
  textFont(f,random(500));
 posX = posX+ 50;
 posY = posY + 50;  
  text ("ART",(width/2-400)+n,(height/2-200)+m);
  

  
  
}


