
void setup() {
  size(900, 600);
  smooth(8);
  background(225, 225, 225);
}

void mainbrush(){
  pushMatrix();
    noFill();
    stroke(0);
    strokeWeight(20 -dist(mouseX, mouseY, pmouseX, pmouseY)/2);
    line(mouseX, mouseY, pmouseX, pmouseY);
    popMatrix();
}
void blur(){
   pushMatrix();
    noFill();
    stroke(10, random(30,40));
    strokeWeight(20 -dist(mouseX, mouseY, pmouseX, pmouseY)/2 +random(5,10) );
    line(mouseX, mouseY, pmouseX, pmouseY);
    popMatrix();
}
void drawbrush(){
  mainbrush();
  blur();
  blur();
  blur();
  blur();
}
  void draw() { 
  pushMatrix();
  translate(800,500);
  noFill();
  stroke(175,15,15);
  strokeWeight(5);
  rect(0,0,80,80);
  line(35,10,15,25);
  line(15,25,15,60);
  line(15,40,35,40);
  line(15,60,35,60);
  line(45,15,45,70);
  line(45,15,65,15);
  line(65,15,65,55);
  line(65,55,53,50);
  popMatrix();
  if(mousePressed) {
    drawbrush();
  }

}
