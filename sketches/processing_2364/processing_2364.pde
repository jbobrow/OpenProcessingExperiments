

/*

Magali Jaume
spring
June, 2009
magali@magalijaume.com

*/

 float rot = 0;
  float rad = 100;
  float speed = 0.01;

  float seed = 0;
  float seed2 = 0;

  float circleSize = 10;


void setup(){
  
  size(500,500);
  background(255);
  smooth();
  
 
  
};


void draw(){
  
  
  rad = noise(seed) * 200;
  seed = seed + 0.006;
  circleSize = noise(seed2) * 10;
  seed2 = seed2 + 0.06;
 
  
  line(250,500, 250,300);
  
 
  translate(250,300);
  rotate(rot);
  stroke(150,250,100,23);
  line(0,0,rad,0);
  //stroke(204,255,255,30);
  line(1,1, 10,100);
  fill(random(0,255),random(0,255),random(0,255),50);
  ellipse(rad,0,circleSize,circleSize);
 
  

  
    rot = rot + speed;
 
 
  
  
  
  
  
};
  
  

  
  

