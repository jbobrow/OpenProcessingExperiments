
/* 
 
Cindy Ng 
June 14,2009 
cindy.ng@cindysng.com
Pedal
 */ 

float rot = 0; // start 180 degree
float rad = 200;
float speed = 0.01;
float circleSize = 1;


float seed = 0;
float seed2 = 0;

void setup() {


  size(500,500);
  background(0);
  smooth();
  
};
  
  void draw() {
  
    rad = noise(seed) * 200;
    seed = seed + 0.003;
    
    circleSize = noise(seed2) * 10;
    seed2 = seed2 + 0.06;
    
  translate(250,250);
  rotate(rot);
  stroke(100,200,300,25);
  line(0,0, rad,0);
  fill(255,100,200,0);
  ellipse(rad,0,circleSize,circleSize);

  rot = rot + speed;
  
  line(250,500, 250,300); 


};

void keyPressed() {
  save("circle" + key+ ".png"); 
};
  

