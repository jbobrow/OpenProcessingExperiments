
float x;
float y;
float px;
float py;
float easing = 0.1;

void setup(){
  size(400,400);
  smooth();
 }

void draw(){
  if (mousePressed == false) 
{ 
  fill(0,100);
  textSize(12);
  text("try to press the left mouse button...",20,380);

noStroke();
  fill(255,50);
  rect(0,0,400,400);
  x+=(mouseX-x)*easing;
  y+=(mouseY-y)*easing;
  float weight = dist(x,y,px,py);
  py=y;
  px=x;
  stroke(0, 100);
  strokeWeight(weight);
  line(mouseX,mouseY,x,y); 
}

else {
  x+=(mouseX-x)*easing;
  y+=(mouseY-y)*easing;
  float weight = dist(x,y,px,py);
  py=y;
  px=x;
  stroke(0, 100);
  strokeWeight(weight);
  line(mouseX,mouseY,x,y); 
}
}



