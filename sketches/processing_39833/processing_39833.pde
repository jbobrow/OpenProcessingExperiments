
void setup(){
  size(300,200);
  smooth();
  
}
void draw() {
background(0);
stroke(255);
strokeWeight(1);
line(mouseX,mouseY,width/2,height/2);
line(mouseX,mouseY,10,10);
line(mouseX,mouseY,290,10);
line(mouseX,mouseY,10,190);
line(mouseX,mouseY,290,190);
if (mousePressed) {stroke(150,0,0);
} else {
 stroke(0,150,0);
}
strokeWeight(10);
line(mouseX,mouseY,mouseX+20,mouseY);
line(mouseX,mouseY,mouseX-20,mouseY);
line(mouseX,mouseY,mouseX,mouseY+20);
line(mouseX,mouseY,mouseX,mouseY-20);
}

