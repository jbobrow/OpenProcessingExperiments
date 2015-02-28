
float a=30;

void setup (){
  size(250,250);
  background(255);
  smooth();
  frameRate(190);
}

void draw (){
  fill(0,20);
  a=a+0.2;
  translate(0,0);
  rotate(a);
  stroke(120, 90);
  line(0,0,250,250);

  fill(0,50);
  a=a+0.5;
  translate(250,250);
  rotate(a);
  stroke(100, 10);
  line(250,250, 0,0);
  
  noFill();
  a=a+0.1;
  translate(0,0);
  rotate(a);
  stroke(124,88,96,80);
  line(100,100, 250,250);
  
  noFill();
  a=a+0.05;
  translate(0,250);
  rotate(a);
  stroke(255, 50);
  line(0,0, 250,250);

}


void keyPressed(){
  if (key=='s');
  save ("fan.png");
}

