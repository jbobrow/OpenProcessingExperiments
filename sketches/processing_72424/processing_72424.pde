
float rectX = 10;
float rectY =20;

float rectX2 = 60;
float rectY2 = 100;




void setup(){
  size(400,400);
  smooth();
  frameRate(200);
  background(0);
}

void draw(){
  stroke(255);
  fill(random(100,200),random(100,200),random(100,200));
  rectMode(CENTER);
  rectX=rectX+6;
  rectY=rectY+3;
  rect (rectX%width,rectY%height,5,100);
  
  noStroke();
  fill(random(0,100),random(0,100),random(0,100),50);
  rectX2=rectX2+6;
  rectY2=rectY2+3;
  rect (rectX2%width,rectY2%height,5,100);
  

  
}

