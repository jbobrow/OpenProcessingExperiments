
/*
ribbons experiment
ak@angelakwong.com
may 30, 2009
*/

float rot = PI;
float rad = (random (50,200));
float speed = 0.07;
float ribbon = 25;

float seed = 0;
float seed2 = 0;

boolean isDrawing = false; 

void setup(){
  size(600,800);
  background (255);
  smooth();


};


void draw(){
  
  if (isDrawing){ 
    
  rad = noise(seed) * 100;
  seed = seed + 1;
  
  ribbon = noise(seed2)*10;
  seed2 = seed2 * 0.03;
  
  translate(random(10,600),random(10,800));
  rotate (-250);
  stroke(25,25,250,65);
  line(0,0,rad,0);
  fill(50,50,255,50);
  ellipse(rad,0,ribbon +2, ribbon);
  
  rot = rot + speed;
  
  }

 
  

};

void mousePressed(){
    isDrawing = !isDrawing;
    
};

