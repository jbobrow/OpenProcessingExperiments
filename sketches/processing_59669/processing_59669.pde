
void setup() {
  size(800, 500);
  background(180, 230, 230); //himmel
  smooth();

  rectMode(CENTER);
  translate(300, 300);

  //stängel
  strokeWeight(10);
  stroke(40, 200, 83);
  line(0, -50, 0, 400);

  //boden
  fill(50, 158, 0);
  noStroke();
  rect(0, 200, 1000, 100);

  //blütenblatt 2
  fill(215, 50, 120);
  ellipse(50, -150, 80, 80);

  //blütenblatt 3
 fill(190, 0, 70);
  ellipse(80, -100, 80, 80);

  //blütenblatt 5
  fill(0, 230, 70);
  ellipse(50, -50, 80, 80);

  //blütenblatt 6
  fill(0, 210, 255);
  ellipse(0, -20, 80, 80);

  //blütenblatt 7
  fill(255, 160, 0);
  ellipse(-50, -50, 80, 80);

  //blütenblatt 9
  fill(215, 230, 70);
  ellipse(-80, -100, 80, 80);

  //blütenblatt 11
  fill(0, 180, 230);
  ellipse(-50, -150, 80, 80);

  //blütenblatt 12
  fill(240, 140, 190);
  ellipse(0, -180, 80, 80);

  //mittelpunkt
  strokeWeight(10);
  stroke(255, 219, 60);
  fill(255, 180, 0);
  ellipse(0, -100, 100, 100);



  //blatt
  translate(10, 80);
  rotate(90);
  ellipseMode(CORNER);
  strokeWeight(0);
  stroke(40, 160, 83);
  fill(40, 200, 83);
  ellipse(0, 0, 30, 80);



rotate(-90);
translate(-35,-200);


//augen
strokeWeight(10);
stroke(0);
line(0, 0, 0, 0);

strokeWeight(10);
stroke(0);
line(50, 0, 50, 0);



//mund von gesicht


noFill();
strokeWeight(5);
stroke(0);
arc(0, 0, 50, 50, 0, PI);

}


