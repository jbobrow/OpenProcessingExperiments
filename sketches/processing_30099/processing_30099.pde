
float x=100;

void setup(){
  size(900,900);
  background(0);
  smooth();
  frameRate(45);
  colorMode(HSB, 360,100,100);
}

void draw(){
  noFill();
  x++;
  if(x>=360){
    x=0;
  }
  stroke(x,100,100);
  for (int i = 0; i < 500; i = i+15) {
  ellipse(5+i*2,5+i*2, 10+i,10+i);
  ellipse(900-i*2,25+i*2, 10+i,10+i);
  ellipse(random(900),random(900), random(400),random(400));
  
  }
  stroke(0);
  ellipse(random(900),random(900), 5,5);
  ellipse(random(900),random(900), 5,5);
  ellipse(random(900),random(900), 5,5);
}

