
void setup(){
  size(300,300);
  smooth();
  frameRate(30);
}

void draw(){
  background(255);
ellipseMode(CENTER);
rectMode(CENTER);
stroke(0);
fill(mouseX/2,0,mouseY/2);
ellipse(mouseX,mouseY,80,80);
fill(mouseX,0,mouseY);
ellipse(mouseX-25,mouseY,30,30);
ellipse(mouseX+25,mouseY,30,30);
//ellipse(mouseX,mouseY,80,80);
fill(mouseX,mouseY,0);
rect(mouseX,mouseY+80,40,80,9);
triangle(mouseX-5,mouseY+10,mouseX+5,mouseY+10,mouseX,mouseY+15);
triangle(mouseX-15,mouseY+28,mouseX+15,mouseY+28,mouseX,mouseY+38);
strokeWeight(10);
line(mouseX+20,mouseY+60,pmouseX+50,pmouseY+50);
line(mouseX-20,mouseY+60,pmouseX-50,pmouseY+50);
line(mouseX-5,mouseY+120,pmouseX-10,pmouseY+145);
line(mouseX+5,mouseY+120,pmouseX+10,pmouseY+145);
strokeWeight(0);
}
