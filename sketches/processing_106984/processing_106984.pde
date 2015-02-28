
float x;
float y;
float px;
float py;
 
float easing=0.05;
 
void setup(){
  size(480,120);
  smooth();
  stroke(random(255),random(255),random(255),102);
   
}
 
void draw(){
  float targetX=mouseX;
  x=x+(targetX-x)*easing;
  float targetY=mouseY;
  y=y+(targetY-y)*easing;
   
  float weight=dist(x,y,px,py);
  strokeWeight(weight);
  line(x,y,pmouseX,pmouseY);
  px=x;
  py=y;
   
if(mousePressed){
background(180);
stroke(random(255),random(255),random(255),102);
}
}
