
float x;
float y;
float easing =0.1;
float a = 100;
float b = 50;
float c = 150;
float d = 80;

void setup() {
  size(500, 500);
  background(255);
  smooth(); 
  noStroke();
}
 
void draw(){
  
 if (mouseX>a && mouseX <a+c && mouseY>b && mouseY <b+d){
   fill(0);
 }else{
   noFill();
 }

  if (mousePressed){
    fill(random(255), random(255), random(255),random(255));
  } else {
    noFill();
  }

  
  float targetX = mouseX;
  x +=(targetX - x)*easing;
  
  float targetY = mouseY;
  y +=(targetY - y)*easing;
  
  ellipse(x,y,10,10);
  stroke(random(255), random(255), random(255));
 
  
 
}


