
void setup() {
size(500, 500);
background(0, 0, 0);
smooth();
fill(255,255,255);
ellipse(100, 100, 70, 70);
fill(0,0,0);
ellipse(120, 100, 70, 70);
fill(97,97,97);
rect(0,350,500,500);
}

void draw() {
smooth();
//spikes
noStroke();
fill(214,255,48);
triangle(250, 110, 300, 100, 250, 160);
triangle(270, 130, 330, 130, 250, 180);
triangle(285, 155, 350, 155, 250, 200);
  
//teeth
noStroke();
fill(255, 255, 255);
triangle(210, 130, 220, 130, 215, 140);

//dinosaur
//stroke(255, 0, 255);
//noFill();
fill(48,255,79,255);
beginShape();
vertex(290, 335);
vertex(270, 360);
vertex(260, 404);
vertex(217, 404);
vertex(215, 400);
vertex(217, 397);
vertex(237, 395);
vertex(240, 375);
vertex(220, 335);
vertex(225, 325);
vertex(230, 320);
vertex(215, 290);
vertex(210, 270);
vertex(215, 230);
vertex(175, 240);
vertex(180, 230);
vertex(215, 220);
vertex(220, 180);
vertex(210, 160);
vertex(185, 160);
vertex(175, 150);
vertex(210, 130);
vertex(170, 130);
vertex(180, 110);
vertex(200, 90);
vertex(230, 80);
vertex(260, 100);
vertex(300, 200);
vertex(330, 300);
vertex(350, 330);
vertex(370, 340);
vertex(390, 345);
vertex(430, 350);
vertex(360, 360);
vertex(320, 350);
vertex(290, 335);
endShape();


if (mousePressed) {
  smooth();
  background(255, 165, 48);
  fill(97,97,97);
  noStroke();
  rect(0,350,500,500);
  fill(255, 255, 255);
  stroke(0, 255, 0);
  line(180, 200, 180, 250);
  noStroke();
  ellipse(190, 200, 15, 15);
  ellipse(170, 200, 15, 15);
  ellipse(180, 190, 15, 15);
  ellipse(180, 210, 15, 15);
  fill(255, 0, 0);
  ellipse(180, 200, 12, 12);
  fill(255, 231, 48);
  ellipse(100, 100, 70, 70);

  
  //beginShape();
  //noFill();
  //stroke(0, 255, 0);
  //noStroke();
  //fill(255,0,255);
  //vertex(210, 160);
  //vertex(185, 160);
  //vertex(175, 150);
  //vertex(210, 130);
  //endShape();
}


//spikes
noStroke();
fill(214,255,48);
triangle(250, 110, 300, 100, 250, 160);
triangle(270, 130, 330, 130, 250, 180);
triangle(285, 155, 350, 155, 250, 200);

//dinosaur
//stroke(255, 0, 255);
//noFill();
fill(48,255,79,255);
beginShape();
vertex(290, 335);
vertex(270, 360);
vertex(260, 404);
vertex(217, 404);
vertex(215, 400);
vertex(217, 397);
vertex(237, 395);
vertex(240, 375);
vertex(220, 335);
vertex(225, 325);
vertex(230, 320);
vertex(215, 290);
vertex(210, 270);
vertex(215, 230);
vertex(175, 240);
vertex(180, 230);
vertex(215, 220);
vertex(220, 180);
vertex(210, 160);
vertex(185, 160);
vertex(175, 150);
vertex(210, 130);
vertex(170, 130);
vertex(180, 110);
vertex(200, 90);
vertex(230, 80);
vertex(260, 100);
vertex(300, 200);
vertex(330, 300);
vertex(350, 330);
vertex(370, 340);
vertex(390, 345);
vertex(430, 350);
vertex(360, 360);
vertex(320, 350);
vertex(290, 335);
endShape();
noStroke();
fill(255,255,255);
ellipse(205, 110, 10, 10);

fill(0,0,0);
ellipse(203, 110, 5, 5);

//fill(255, 231, 48);
//ellipse(100, 100, 70, 70);

}


