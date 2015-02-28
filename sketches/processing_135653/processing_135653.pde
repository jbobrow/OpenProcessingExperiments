


float ellipseSize = 200;
float cake = 20;
String word = "30";
float fire = 12;
float rectX =80;
float rectY =30;
color Mouth = color(236, 163, 173);
color hair = color(72, 60, 49);

void setup() {
  //canvas size and color
  size (500, 500);
}


void draw() {
  background( #924f42 );


  //FEDERICO

  //hair
  fill(hair);
  noStroke();
  rectMode(CENTER);
  rect (250, 215, 170, 200, 50, 0, 60, 60);

  //face
  fill (236, 163, 173);
  noStroke();
  rectMode(CENTER);
  rect (250, 250, 160, 180, 50, 50, 60, 60);
  rectMode(CORNER);
  //rect (165, 250, 170, 100, 0, 0, 60, 60);
  //ellipse (250, 330, 120, 80);

  beginShape();
  vertex(280, 350);
  vertex(220, 350);
  vertex(180, 320);
  vertex(320, 320);
  endShape(CLOSE);
  ellipse(250, 340, 75, 42);

  // eyes
  stroke(#000000);
  strokeWeight(4);
  noFill();
  arc(225, 230, 25, 20, 0, PI );
  arc(275, 230, 25, 20, 0, PI );
  stroke(184, 132, 135);
  strokeWeight(2);
  line(195, 233, 185, 238);
  line(195, 225, 185, 220);
  line(305, 233, 315, 238);
  line(305, 225, 315, 220);

  //eyebrown
  stroke(#483c32);
  strokeWeight(9);
  line(265, 210, 295, 210);
  line(235, 210, 205, 210);

  //mouth
  fill(Mouth);
  strokeWeight(3);
  stroke(#8b0a50);
  ellipse(250,307,50,40);
  fill(236, 163, 173);
  noStroke();
  rectMode(CENTER);
  rect(250,290,rectX,rectY);
  //arc(250, 300, 50, 40, 0, PI);
  stroke (330, 200, 190);
  strokeWeight(3);
  stroke(184, 132, 135);
  line(255, 275, 258, 280);
  line(245, 275, 242, 280);


  //Mouse
  noStroke();
  fill(219, 219, 210);
  ellipse(mouseX, mouseY, ellipseSize, ellipseSize/3);
  fill(255, 206, 0);
  rectMode(CENTER);
  rect(mouseX, mouseY-20, ellipseSize -cake, ellipseSize/3 - cake);
  ellipse(mouseX, mouseY, ellipseSize-cake, ellipseSize/3-cake);
  fill(246, 172, 14);
  ellipse(mouseX, mouseY-45, ellipseSize-cake, ellipseSize/3-cake);
  textSize(50);
  fill(148, 32, 15);
  textAlign(CENTER);
  text(word, mouseX, mouseY-40);
  fill(235, 87, 89);
  text(word, mouseX-1, mouseY-39);
  fill(255, 0, 0);
  ellipse(mouseX + 15 + random(-1, 1), mouseY - 88 + random(-1, 2), fire, fire);
  ellipse(mouseX -15 + random(-1, 1), mouseY - 88 + random(-1, 2), fire, fire);
}

 void mouseClicked() {
  if (fire == 12 && rectX==80 && rectY==30) {
    fire = 0;
    rectX = 0;
    rectY = 0;
    Mouth = color (255,0,0,20);
    hair = color(129);
  } else {
    fire = 12;
    rectX=80;
    rectY=30;
    Mouth = color (236, 163, 173);
    hair = color(72, 60, 49);
  }
 }
 

 
