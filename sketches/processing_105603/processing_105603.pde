
//Thibault Bourgeois
// Happy sad picture
// 5-8-2013

void setup (){
  size(500,500);
  smooth();
}


  void myHappyCreature(){
    background(255);
    fill(255,255, 10);
    ellipse (mouseX,mouseY,300,300);
    fill(0);
    arc(mouseX, mouseY+25, mouseX-50, mouseY-50, 0, PI);
    ellipse (mouseX-75, mouseY-50, 30, 30);
    ellipse (mouseX+75, mouseY-50, 30, 30);
}
  void mySadCreature(){
    background(500,0,0);
    fill(0);
    ellipse (mouseX,mouseY,300,300);
    fill(500,0,0);
    bezier(mouseX-50, mouseY+100, mouseX+50,mouseY+50,mouseX+50, mouseY+80, mouseX+50, mouseY+100);
    ellipse (mouseX-75, mouseY-50, 30, 30);
    ellipse (mouseX+75, mouseY-50, 30, 30);
    stroke (500,0,0);
    line(mouseX-75, mouseY-90, mouseX-50, mouseY-65);
    line(mouseX+75, mouseY-90, mouseX+50,mouseY-65);
    fill(0);
    ellipse (mouseX-75, mouseY-50, 7, 7);
    ellipse (mouseX+75, mouseY-50, 7, 7);

    noStroke();
    
  }

void draw() {
if (mousePressed) {
  myHappyCreature();
}
else {
mySadCreature();
}
}
