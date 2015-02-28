
void setup() {
  size(300, 300);
  smooth();

}

void draw() {
  strokeWeight(4);
  background(0);
  line(0, 200, 300, 200);
  line(0, 100, 300, 100);
  line(0, 0, 300, 0);
  line(100, 300, 100, 0);
  line(200, 300, 200, 0);
  

  
  //face
  fill(255, 211, 176);
  ellipse(150, 150, 250, 250);
  //eyes
  fill(189);
  ellipse(90, 90, 50, 50);
  ellipse(210, 90, 50, 50);
  //pupils
  fill(25);
  ellipse(90,90,20,20);
  ellipse(210,90,20,20);

  //mouth
  fill(255,36,36);

  fill(241,95,95);
  arc(150,210,85,50,0,PI,OPEN);

  //nose
  fill(255, 0, 0);
  ellipse(150, 150, mouseX, 90);
  


}
