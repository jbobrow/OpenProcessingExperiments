
float angle = 45.0;

void setup(){
  size(250,250);
  background(0);
  smooth();

}

void draw(){
  fill(235);


  fill(129,185,162);
  angle=angle+0.01;
  translate(0,0);
  rotate(angle);
  stroke(255);
 line(0,0,250,250);
//white lines

  rect(250,250,250,250);
  fill(255,30);
  angle=angle-1;
  translate(-50,-90);
  rotate(random(10,6));
  rect(100,100,90,90);
//squares

}

