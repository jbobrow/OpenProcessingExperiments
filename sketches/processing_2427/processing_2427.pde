
/*
northernlights
june 2009
angelaseear@gmail.com
*/
float rot = 0;
float rad = 200;
float speed = 0.01;
float circleSize = 1;
float seed = 0;
float seed2 = 0;


void setup(){
  size(500,500);
  background(#030a2e);
  smooth();
};




void draw(){
  
  rad = noise(seed)*400;
  seed = seed + 0.03;
  
  circleSize = noise(seed2)*10;
  seed2 = seed2 + 0.09;
  
  translate(350,130);
  rotate(rot);
  stroke(55,250,255,25);
  line(0,0,rad,0);
  fill(55,255,100,50);
  ellipse(rad,0,circleSize,circleSize);
  
  rot = rot+speed;
  rad = random(0,540);
  
   rad = noise(seed)*400;
  seed = seed + 0.03;
  
  circleSize = noise(seed2)*8;
  seed2 = seed2 + 0.03;
  
  translate(50,100);
  rotate(rot);
  stroke(255,50,50,25);
  line(0,0,rad,0);
  fill(255,91,261,50);
  ellipse(rad,0,circleSize,circleSize);
  
  rot = rot+speed;
  rad = random(0,54);
  
  
};


void keyPressed(){
  save("circle" + key +".png");
};

