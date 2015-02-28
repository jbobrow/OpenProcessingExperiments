
float s =1.3;

void setup(){
  size(480,450);
  smooth();
  background(255);
  stroke(0,120);

  frameRate(30);
}

void draw(){
  translate(mouseX,mouseY);
  s  -=0.03;
 scale(s);
  if(s<0){
    s=1.3;
}
 fill(255,139,202);
 stroke(0);
 strokeWeight(2);
 ellipse(-30,-20,15,10);
 ellipse(-10,-25,15,10);
 ellipse(10,-25,15,10);
 ellipse(30,-20,15,10);
 fill(255,139,202);
 stroke(0);
 strokeWeight(2);
 
 ellipse(0,0,40,20);
 
}

