

void setup(){
  size(400,400);
  background (255);
}

void draw (){
  if (mousePressed){

    strokeWeight(10);
    stroke(random(0,255),random(0,255),random(0,255));
  line (mouseX,400,mouseX,0);
  fill(random(0,255),random(0,255),random(0,255));
  ellipse (mouseX+random(-100,100),mouseY+random(-100,100),40,40);
}}

