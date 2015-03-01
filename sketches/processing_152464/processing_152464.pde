
float x;
float y;
float i;
float n;
float a=random(0,255);
float b=random(0,255);
float c=random(0,255);
void setup(){
  size(800, 600);
  frameRate(50);
}
void draw(){
  background(255);
  stroke(0);
  line(20, 300, 780, 300);
  line(400, 20, 400, 580);
  stroke(a, b, c);
  strokeWeight(2);
  for(i=0; i<6*PI; i=i+0.025){
    x=15*i*cos(i+n)+400;
    y=15*i*sin(i+n)+300;
    ellipse(x, y, 1, 1);
  }
  n=n+0.261;
}
