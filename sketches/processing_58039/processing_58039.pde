
// Created by Rachel Ho-Jung Tseng
// ARCH 2503 Digital Media, Department of Architecture, Cornell AAP
// Can Lis by John Utzon

void setup() {

  size(975, 400);
  background(245);
  smooth();
  stroke(200);
  frameRate(2);
}

void draw() {

  background(245);
  fill(255);
  rect(25, 75, 100, 100);
  rect(150, 75, 240, 200);
  rect(415, 75, 180, 200);
  rect(620, 75, 180, 144);
  rect(825, 75, 125, 100); //original blocks

  rect(50, 315, 400, 10);
  rect(385, 350, 275, 10);
  rect(625, 315, 300, 10);

  pushMatrix();
  translate(75, 115);
  rotate(radians(random(-20, 10)));
  fill(235, mouseX/5, mouseY/2); 
  rect(-50, -40, 100, 100); //rect one
  popMatrix();

  pushMatrix();
  translate(270, 115);
  rotate(radians(random(-20, 15)));
  fill(25, mouseX/5, mouseY/2); 
  rect(-120, -40, 40, 40); 
  fill(25, mouseX/5+10, mouseY/2+10); 
  rect(-80, -40, 40, 40);
  fill(25, mouseX/5+20, mouseY/2+20); 
  rect(-40, -40, 40, 40);
  fill(25, mouseX/5+30, mouseY/2+30); 
  rect(0, -40, 40, 40); 
  fill(25, mouseX/5+40, mouseY/2+40); 
  rect(40, -40, 40, 40); 
  fill(155, mouseX/5+50, mouseY/2+50); 
  rect(80, -40, 40, 40); //1

  fill(155, mouseX/5+10, mouseY/2+10); 
  rect(-120, 0, 40, 40);
  fill(155, mouseX/5+20, mouseY/2+20); 
  rect(-80, 0, 40, 40);
  fill(155, mouseX/5+30, mouseY/2+30); 
  rect(-40, 0, 40, 40);
  fill(155, mouseX/5+40, mouseY/2+40); 
  rect(0, 0, 40, 40);
  fill(155, mouseX/5+50, mouseY/2+50); 
  rect(40, 0, 40, 40);
  fill(155, mouseX/5+60, mouseY/2+60); 
  rect(80, 0, 40, 40); //2

  fill(155, mouseX/5+20, mouseY/2+20); 
  rect(-120, 40, 40, 40);
  fill(215, mouseX/5+30, mouseY/2+30); 
  rect(-80, 40, 40, 40);
  fill(215, mouseX/5+40, mouseY/2+40); 
  rect(-40, 40, 40, 40);
  fill(215, mouseX/5+50, mouseY/2+50); 
  rect(0, 40, 40, 40);
  fill(155, mouseX/5+60, mouseY/2+60); 
  rect(40, 40, 40, 40);
  noFill(); 
  rect(80, 40, 40, 40); //3

  fill(155, mouseX/5+30, mouseY/2+30); 
  rect(-120, 80, 40, 40);
  fill(235, mouseX/5+40, mouseY/2+40); 
  rect(-80, 80, 40, 40);
  fill(235, mouseX/5+50, mouseY/2+50); 
  rect(-40, 80, 40, 40);
  fill(235, mouseX/5+60, mouseY/2+60); 
  rect(0, 80, 40, 40);
  fill(155, mouseX/5+70, mouseY/2+70); 
  rect(40, 80, 40, 40);
  noFill(); 
  rect(80, 80, 40, 40); //4

  fill(155, mouseX/5+40, mouseY/2+40); 
  rect(-120, 120, 40, 40);
  fill(255, mouseX/5+50, mouseY/2+50); 
  rect(-80, 120, 40, 40);
  fill(255, mouseX/5+60, mouseY/2+60); 
  rect(-40, 120, 40, 40);
  fill(255, mouseX/5+70, mouseY/2+70); 
  rect(0, 120, 40, 40);
  fill(155, mouseX/5+80, mouseY/2+80); 
  rect(40, 120, 40, 40);
  noFill(); 
  rect(80, 120, 40, 40); //5
  popMatrix(); //rect two

  pushMatrix();
  translate(505, 115);
  rotate(radians(random(-35, 10)));
  fill(255, mouseX/5, mouseY/2); 
  rect(-90, -40, 30, 60);
  fill(255, mouseX/5+10, mouseY/2+10); 
  rect(-60, -40, 30, 60);
  fill(255, mouseX/5+20, mouseY/2+20); 
  rect(-30, -40, 30, 60);
  fill(255, mouseX/5+30, mouseY/2+30); 
  rect(0, -40, 30, 60);
  fill(255, mouseX/5+40, mouseY/2+40); 
  rect(30, -40, 30, 60);
  noFill(); 
  rect(60, -40, 30, 60);

  noFill(); 
  rect(-90, 20, 30, 28);
  fill(155, mouseX/5+20, mouseY/2+20); 
  rect(-60, 20, 30, 28);
  fill(155, mouseX/5+30, mouseY/2+30); 
  rect(-30, 20, 30, 28);
  fill(155, mouseX/5+40, mouseY/2+40); 
  rect(0, 20, 30, 28);
  fill(155, mouseX/5+50, mouseY/2+50); 
  rect(30, 20, 30, 28);
  noFill(); 
  rect(60, 20, 30, 28);

  noFill(); 
  rect(-90, 48, 30, 28);
  fill(155, mouseX/5+30, mouseY/2+30); 
  rect(-60, 48, 30, 28);
  fill(155, mouseX/5+40, mouseY/2+40); 
  rect(-30, 48, 30, 28);
  fill(155, mouseX/5+50, mouseY/2+50); 
  rect(0, 48, 30, 28);
  fill(155, mouseX/5+60, mouseY/2+60); 
  rect(30, 48, 30, 28);
  noFill(); 
  rect(60, 48, 30, 28);

  fill(25, mouseX/5+30, mouseY/2+30); 
  rect(-90, 76, 30, 28);
  fill(25, mouseX/5+40, mouseY/2+40); 
  rect(-60, 76, 30, 28);
  fill(25, mouseX/5+50, mouseY/2+50); 
  rect(-30, 76, 30, 28);
  fill(25, mouseX/5+60, mouseY/2+60); 
  rect(0, 76, 30, 28);
  fill(25, mouseX/5+70, mouseY/2+70); 
  rect(30, 76, 30, 28);
  noFill(); 
  rect(60, 76, 30, 28);

  fill(155, mouseX/5+40, mouseY/2+40); 
  rect(-90, 104, 30, 28);
  fill(25, mouseX/5+50, mouseY/2+50); 
  rect(-60, 104, 30, 28);
  fill(25, mouseX/5+60, mouseY/2+60); 
  rect(-30, 104, 30, 28);
  fill(25, mouseX/5+70, mouseY/2+70); 
  rect(0, 104, 30, 28);
  fill(25, mouseX/5+80, mouseY/2+80); 
  rect(30, 104, 30, 28);
  fill(155, mouseX/5+90, mouseY/2+90); 
  rect(60, 104, 30, 28);

  fill(25, mouseX/5+50, mouseY/2+50); 
  rect(-90, 132, 30, 28);
  fill(155, mouseX/5+60, mouseY/2+60); 
  rect(-60, 132, 30, 28);
  fill(155, mouseX/5+70, mouseY/2+70); 
  rect(-30, 132, 30, 28);
  fill(155, mouseX/5+80, mouseY/2+80); 
  rect(0, 132, 30, 28);
  fill(155, mouseX/5+90, mouseY/2+90); 
  rect(30, 132, 30, 28);
  fill(25, mouseX/5+100, mouseY/2+100); 
  rect(60, 132, 30, 28);//rect three
  popMatrix();

  pushMatrix();
  translate(710, 115);
  rotate(radians(random(-5, 20)));
  fill(255, mouseX/5+10, mouseY/2+10); 
  rect(-90, -40, 60, 48);
  fill(255, mouseX/5+30, mouseY/2+30); 
  rect(-30, -40, 60, 48);
  fill(255, mouseX/5+50, mouseY/2+50); 
  rect(30, -40, 60, 48);

  fill(25, mouseX/5+10, mouseY/2+10); 
  rect(-90, 8, 60, 40);
  fill(25, mouseX/5+30, mouseY/2+30); 
  rect(-30, 8, 60, 40);
  fill(25, mouseX/5+50, mouseY/2+50); 
  rect(30, 8, 60, 40);

  fill(155, mouseX/5+10, mouseY/2+10); 
  rect(-90, 48, 60, 40);
  fill(155, mouseX/5+30, mouseY/2+30); 
  rect(-30, 48, 60, 40);
  fill(155, mouseX/5+50, mouseY/2+50); 
  rect(30, 48, 60, 40);

  fill(155, mouseX/5+30, mouseY/2+30); 
  rect(-90, 88, 60, 40);
  fill(25, mouseX/5+50, mouseY/2+50); 
  rect(-30, 88, 60, 40);
  fill(155, mouseX/5+70, mouseY/2+70); 
  rect(30, 88, 60, 40); //rect four
  popMatrix();

  pushMatrix();
  translate(887.5, 115);
  rotate(radians(random(-10, 10)));
  fill(25, mouseX/5+10, mouseY/2+10); 
  rect(-62.5, -40, 50, 50);
  fill(25, mouseX/5+30, mouseY/2+30); 
  rect(-12.5, -40, 25, 50);
  fill(25, mouseX/5+50, mouseY/2+50); 
  rect(12.5, -40, 50, 50);

  fill(25, mouseX/5+30, mouseY/2+30); 
  rect(-62.5, 10, 50, 50);
  fill(155, mouseX/5+50, mouseY/2+50); 
  rect(-12.5, 10, 25, 50);
  fill(155, mouseX/5+70, mouseY/2+70); 
  rect(12.5, 10, 50, 50);//rect five
  popMatrix();
}


void mouseDragged() {

  background(0);

  pushMatrix();
  translate(270, 115);
  rotate(radians(random(-20, 15)));
  fill(25, mouseX/5, mouseY/2); 
  rect(-120, -40, 40, 40); 
  fill(25, mouseX/5+10, mouseY/2+10); 
  rect(-80, -40, 40, 40);
  fill(25, mouseX/5+20, mouseY/2+20); 
  rect(-40, -40, 40, 40);
  fill(25, mouseX/5+30, mouseY/2+30); 
  rect(0, -40, 40, 40); 
  fill(25, mouseX/5+40, mouseY/2+40); 
  rect(40, -40, 40, 40); 
  fill(155, mouseX/5+50, mouseY/2+50); 
  rect(80, -40, 40, 40); //1

  fill(155, mouseX/5+10, mouseY/2+10); 
  rect(-120, 0, 40, 40);
  fill(155, mouseX/5+20, mouseY/2+20); 
  rect(-80, 0, 40, 40);
  fill(155, mouseX/5+30, mouseY/2+30); 
  rect(-40, 0, 40, 40);
  fill(155, mouseX/5+40, mouseY/2+40); 
  rect(0, 0, 40, 40);
  fill(155, mouseX/5+50, mouseY/2+50); 
  rect(40, 0, 40, 40);
  fill(155, mouseX/5+60, mouseY/2+60); 
  rect(80, 0, 40, 40); //2

  fill(155, mouseX/5+20, mouseY/2+20); 
  rect(-120, 40, 40, 40);
  fill(155, mouseX/5+60, mouseY/2+60); 
  rect(40, 40, 40, 40); //3

  fill(155, mouseX/5+30, mouseY/2+30); 
  rect(-120, 80, 40, 40);
  fill(155, mouseX/5+70, mouseY/2+70); 
  rect(40, 80, 40, 40); //4

  fill(155, mouseX/5+40, mouseY/2+40); 
  rect(-120, 120, 40, 40);
  fill(155, mouseX/5+80, mouseY/2+80); 
  rect(40, 120, 40, 40);//5
  popMatrix(); //rect two

  pushMatrix();
  translate(505, 115);
  rotate(radians(random(-35, 10)));

  fill(155, mouseX/5+20, mouseY/2+20); 
  rect(-60, 20, 30, 28);
  fill(155, mouseX/5+30, mouseY/2+30); 
  rect(-30, 20, 30, 28);
  fill(155, mouseX/5+40, mouseY/2+40); 
  rect(0, 20, 30, 28);
  fill(155, mouseX/5+50, mouseY/2+50); 
  rect(30, 20, 30, 28);

  fill(155, mouseX/5+30, mouseY/2+30); 
  rect(-60, 48, 30, 28);
  fill(155, mouseX/5+40, mouseY/2+40); 
  rect(-30, 48, 30, 28);
  fill(155, mouseX/5+50, mouseY/2+50); 
  rect(0, 48, 30, 28);
  fill(155, mouseX/5+60, mouseY/2+60); 
  rect(30, 48, 30, 28);

  fill(25, mouseX/5+30, mouseY/2+30); 
  rect(-90, 76, 30, 28);
  fill(25, mouseX/5+40, mouseY/2+40); 
  rect(-60, 76, 30, 28);
  fill(25, mouseX/5+50, mouseY/2+50); 
  rect(-30, 76, 30, 28);
  fill(25, mouseX/5+60, mouseY/2+60); 
  rect(0, 76, 30, 28);
  fill(25, mouseX/5+70, mouseY/2+70); 
  rect(30, 76, 30, 28);

  fill(155, mouseX/5+40, mouseY/2+40); 
  rect(-90, 104, 30, 28);
  fill(25, mouseX/5+50, mouseY/2+50); 
  rect(-60, 104, 30, 28);
  fill(25, mouseX/5+60, mouseY/2+60); 
  rect(-30, 104, 30, 28);
  fill(25, mouseX/5+70, mouseY/2+70); 
  rect(0, 104, 30, 28);
  fill(25, mouseX/5+80, mouseY/2+80); 
  rect(30, 104, 30, 28);
  fill(155, mouseX/5+90, mouseY/2+90); 
  rect(60, 104, 30, 28);

  fill(25, mouseX/5+50, mouseY/2+50); 
  rect(-90, 132, 30, 28);
  fill(155, mouseX/5+60, mouseY/2+60); 
  rect(-60, 132, 30, 28);
  fill(155, mouseX/5+70, mouseY/2+70); 
  rect(-30, 132, 30, 28);
  fill(155, mouseX/5+80, mouseY/2+80); 
  rect(0, 132, 30, 28);
  fill(155, mouseX/5+90, mouseY/2+90); 
  rect(30, 132, 30, 28);
  fill(25, mouseX/5+100, mouseY/2+100); 
  rect(60, 132, 30, 28);//rect three
  popMatrix();

  pushMatrix();
  translate(710, 115);
  rotate(radians(random(-5, 20)));
  fill(25, mouseX/5+10, mouseY/2+10); 
  rect(-90, 8, 60, 40);
  fill(25, mouseX/5+30, mouseY/2+30); 
  rect(-30, 8, 60, 40);
  fill(25, mouseX/5+50, mouseY/2+50); 
  rect(30, 8, 60, 40);

  fill(155, mouseX/5+10, mouseY/2+10); 
  rect(-90, 48, 60, 40);
  fill(155, mouseX/5+30, mouseY/2+30); 
  rect(-30, 48, 60, 40);
  fill(155, mouseX/5+50, mouseY/2+50); 
  rect(30, 48, 60, 40);

  fill(155, mouseX/5+30, mouseY/2+30); 
  rect(-90, 88, 60, 40);
  fill(25, mouseX/5+50, mouseY/2+50); 
  rect(-30, 88, 60, 40);
  fill(155, mouseX/5+70, mouseY/2+70); 
  rect(30, 88, 60, 40); //rect four
  popMatrix();

  pushMatrix();
  translate(887.5, 115);
  rotate(radians(random(-10, 10)));
  fill(25, mouseX/5+10, mouseY/2+10); 
  rect(-62.5, -40, 50, 50);
  fill(25, mouseX/5+30, mouseY/2+30); 
  rect(-12.5, -40, 25, 50);
  fill(25, mouseX/5+50, mouseY/2+50); 
  rect(12.5, -40, 50, 50);

  fill(25, mouseX/5+30, mouseY/2+30); 
  rect(-62.5, 10, 50, 50);
  fill(155, mouseX/5+50, mouseY/2+50); 
  rect(-12.5, 10, 25, 50);
  fill(155, mouseX/5+70, mouseY/2+70); 
  rect(12.5, 10, 50, 50);//rect five
  popMatrix();
}



