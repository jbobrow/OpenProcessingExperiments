
void setup(){
size (400, 200);
background (255);
}

float x=0.5;
int y=0;
int speed=2;

void draw(){
  background (255);
  frameRate(60);
  smooth();
  colorMode(HSB);
  fill(x*0.5, 190, 200);
  strokeWeight(3);
  ellipse(x, 100, 100, 100);
  x=x+speed;
  if (x<0||x>=400){
    speed=speed*-1;
  }
    
if (x<=50){
  stroke(0);
  ellipse(125, 100, 50, 50);
}
else if (x<=100){
      stroke(0);
  ellipse(175, 100, 50, 50);
}
else if (x<=150){
  stroke(0);
  ellipse (225, 100, 50, 50);
}
else if (x<=200){
  ellipse (275, 100, 50, 50);
}
else if (x<=250){
  stroke(0);
  ellipse (325, 100, 50, 50);
}
else if (x<=300){
  stroke(0);
  ellipse(375, 100, 50, 50);
}
}



