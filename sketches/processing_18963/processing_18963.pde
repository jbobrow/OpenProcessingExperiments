
void setup(){
  size(350,350);
  background(RGB);
  colorMode(RGB,width);
  smooth();
  frameRate(20);
}
int x=0;
int y=0;
void draw() {
  if(x<100){
background(HSB,width);
fill(65,65,65);
noStroke();
rect(width/2,height/2,75,75);
x++;
}
if(x<150){
  noStroke();
  fill(x,75,75);
  rect(width/2,height/2,75,75);
x++;
}
if(x>=150){
  noStroke();
fill(250,250,250);
rect(x-150,x-150,75,75);
x++;
}
if(x>=300){
  noStroke();
fill(203,203,203);
rect(x,0,75,75);
x++;
}
  noStroke();
  fill(x,75,75);
  rect(width/2,height/2,75,75);
x++;
if(x>=315){
  noStroke();
fill(52,23,252);
rect(x,0,75,75);
x++;
}
if(x >= 400){
    noLoop();
}
}









