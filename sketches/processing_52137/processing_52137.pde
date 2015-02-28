
void setup() {
  size(800,450);
background(0);
  smooth();
}

void draw() {
  stroke(mouseX,mouseY,0);
  strokeWeight(3);
  line(pmouseX,pmouseY,mouseX,mouseY);

  
fill(0,mouseX,mouseY+200);
abs(mouseX-pmouseX);
ellipseMode(CENTER);
ellipse(mouseX,mouseY,mouseX/18,mouseY/18);
}
  void mousePressed() {
    //father
    stroke(10,25,150);
fill(0,mouseX+100,mouseY+100);
abs(mouseX-pmouseX);
ellipseMode(CENTER);
ellipse(mouseX,mouseY,15,15);
    //sons
    strokeWeight(1);
    stroke(10,225,120);
fill(0,mouseX+50,mouseY+50);
abs(mouseX-pmouseX);
ellipseMode(CENTER);
ellipse(mouseX+10,mouseY+10,5,5);
    strokeWeight(1);
    stroke(220,5,0);
fill(0,mouseX+50,mouseY+50);
abs(mouseX-pmouseX);
ellipseMode(CENTER);
ellipse(mouseX-10,mouseY-10,5,5);
strokeWeight(1);
    stroke(10,225,120);
fill(0,mouseX+50,mouseY+50);
abs(mouseX-pmouseX);
ellipseMode(CENTER);
ellipse(mouseX+10,mouseY-10,5,5);
    strokeWeight(1);
    stroke(220,5,0);
fill(0,mouseX+50,mouseY+50);
abs(mouseX-pmouseX);
ellipseMode(CENTER);
ellipse(mouseX-10,mouseY+10,5,5);
  }
  void keyPressed() {
    background(0);
  }
                                                                
