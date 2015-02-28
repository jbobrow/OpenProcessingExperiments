
PImage img;

void setup() {
  size(500,500);
  img = loadImage("gmb-workshop.jpeg");
  smooth();
}

void draw() {
  //workshop background
  background(0);
  image(img, 0, 0);
  //noStroke();
  //Puppet Pieces
  //Head
  fill(205,133,63);
  ellipse(350, 100, 60, 75);
  //body
  fill(205, 133, 63);
  rect(335, 140, 30, 135);
  //shoulder joints
  ellipse(330, 145, 10, 10);
  ellipse(370, 145, 10, 10);
  //upper arms 
  rect(265, 143, 60, 5);
  rect(375, 143, 60, 5);
  //elbow joints
  ellipse(268, 153, 9, 9);
  ellipse(432, 153, 9, 9);
  //lower arms
  rect(265, 158, 5, 60);
  rect(429, 158, 5, 60);
  //hip joints
  ellipse(330, 270, 9, 9);
  ellipse(370, 270, 9, 9);
  //thighs
  rect(327, 275, 5, 60);
  rect(367, 275, 5, 60);
  //knee joints
  ellipse(330, 340, 8, 8);
  ellipse(370, 340, 8, 8);
  //shins
  rect(327, 345, 5, 50);
  rect(367, 345, 5, 50);
  //Movement
  if (mousePressed == true) {
    //New Puppet
    //Head
    fill(205,92,92);
    ellipse(150, 100, 60, 75);
    //body
    rect(135, 140, 30, 135);
    //shoulder joints
    ellipse(130, 145, 10, 10);
    ellipse(170, 145, 10, 10);
    //upper arms 
    rect(65, 143, 60, 5);
    rect(175, 143, 60, 5);
    //elbow joints
    ellipse(68, 153, 9, 9);
    ellipse(232, 153, 9, 9);
    //lower arms
    rect(65, 158, 5, 60);
    rect(229, 158, 5, 60);
    //hip joints
    ellipse(130, 270, 9, 9);
    ellipse(170, 270, 9, 9);
    //thighs
    rect(127, 275, 5, 60);
    rect(167, 275, 5, 60);
    //knee joints
    ellipse(130, 340, 8, 8);
    ellipse(170, 340, 8, 8);
    //shins
    rect(127, 345, 5, 50);
    rect(167, 345, 5, 50);
    //Heart
    smooth();
    noStroke();
    fill(255,0,0);
    beginShape();
    vertex(50, 15);
    bezierVertex(50, -5, 90, 5, 50, 40);
    vertex(50, 15);
    bezierVertex(50, -5, 10, 5, 50, 40);
    endShape();
    strokeWeight(10);
    stroke(255, 0, 0);
    line(50, 50, 100, 100);
  } else {
    strokeWeight(1);
    stroke(0);
  }
}


