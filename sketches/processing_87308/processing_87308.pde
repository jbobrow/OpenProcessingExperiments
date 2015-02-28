
void setup() {
  size(640,480);
}
void draw(){
background(.18,.18,.18,.18);
//  rectMode(CENTER);
//  rect(mouseX,mouseY,100,100);
colorMode(RGB,1);
stroke(1,0,0);
strokeWeight(abs(mouseX-pmouseX));
line(pmouseX,pmouseY,mouseX,mouseY);
strokeWeight(abs(mouseY-pmouseY));
line(pmouseX,pmouseY,mouseX,mouseY);
}


