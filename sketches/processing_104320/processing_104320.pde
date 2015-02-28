
float x;
float y;
float px;
float py;
float easing=0.05;
void setup(){
  size(500,500);
  background(255);
  colorMode(HSB);
  
  smooth();
 
}
void draw(){
  float targetX=mouseX;
  x+=(targetX-x)*easing;
  float targetY=mouseY;
  y+=(targetY-y)*easing;
float weight=dist(x,y,px,py);
strokeWeight(weight);
    stroke(random(255),100,255,100);
    py=y;
   px=x;
  if (mousePressed==true){
   
    //ellipse(mouseX,mouseY,5,5);
  line(mouseX,mouseY,pmouseX,pmouseY);
  }
}



