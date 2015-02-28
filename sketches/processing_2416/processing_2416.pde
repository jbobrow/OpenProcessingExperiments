
/*
citrusdream
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
  background(#da8e20);
  smooth();
};




void draw(){
  
  rad = noise(seed)*300;
  seed = seed + 0.05;
  
  circleSize = noise(seed2)*40;
  seed2 = seed2 + 0.02;
  
  translate(mouseX,mouseY);
  rotate(rot);
  stroke(255,255,0,50);
  line(100,0,rad,0);
  fill(0, random(0,255),random(0,255),50);
  ellipse(rad,0,circleSize,circleSize);
  
  rot = rot+speed;
  rad = random(0,54);
  
  
};


void keyPressed(){
  save("circle" + key +".png");
};

