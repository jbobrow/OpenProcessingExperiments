
void setup(){
  size(600,600,P2D);
  background(200);
  smooth(4);
}

void draw(){
  fill(0,30);
  noStroke();
  ellipse(width/2,height/2, width/4,width/4);
  if (mousePressed) {

  stroke(0);
  line(0,0,mouseX,mouseY);
  line(width, height,mouseX,mouseY);
  line(0, height,mouseX,mouseY);
  line(width,0,mouseX,mouseY);

  if ( dist(width/2, height/2, mouseX, mouseY) < (width/8)){
  fill(0,255);
  noStroke();
  ellipse(width/2,height/2, width/4 ,width/4);
  background(200);

}

}
}
