
/*
Random Perlin Noise
May 2009
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
  
  circleSize = noise(seed2)*20;
  seed2 = seed2 + 0.09;
  
  translate(300,130);
  rotate(rot);
  background(255);
  line(mouseX,mouseY,rad,0);
  fill(247,16,22,100);
  ellipse(rad,0,circleSize,circleSize);
  
  rot = rot+speed;
  rad = random(0,540);
  
  
  
};


void keyPressed(){
  save("circle" + key +".png");
};

