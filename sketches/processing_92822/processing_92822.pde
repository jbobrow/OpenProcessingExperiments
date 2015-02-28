
float ladybugX = 0;
float ladybugY = 0;
float wingX = 0;
float wingY = 0;
float leaveX = 0;
float leaveY = 0;

void setup() {
  size(800, 600);
  background(210, 250, 255);
  smooth();
}

void draw() {
 
 background(mouseY / 2, mouseY - 10, mouseY);
 
  float pm = mouseY * 5;
  float pmw = mouseY * 5;
  float pml = mouseY * 5;
 
  if(pm < 500) {
    ladybugX = 80;
    ladybugY = pm;
  }
  else if(pm < 580) {
    ladybugX = pm - 500 + 80;
    ladybugY= 500;
  }
  else if(pm < 980) {
    ladybugX = 160;
    ladybugY = 500 - (pm - 580);
  }
  else if(pm < 1060) {
    ladybugX = 160 + (pm - 980);
    ladybugY = 100;
  }
  else if(pm < 1460) {
    ladybugX = 240;
    ladybugY = 100 + (pm - 1060);
  }
  else if(pm < 1540) {
    ladybugX = 240 + (pm - 1460);
    ladybugY = 500;
  }
  else if(pm < 1840) {
    ladybugX = 320;
    ladybugY = 500 - (pm - 1540);
  }
  else if(pm < 1920) {
    ladybugX = 320 + (pm - 1840);
    ladybugY = 200;
  }
  else if(pm < 2220) {
    ladybugX = 400;
    ladybugY = 200 + (pm - 1920);
  }
  else if(pm < 2300) {
    ladybugX = 400 + (pm - 2220);
    ladybugY = 500;
  }
  else if(pm < 2500) {
    ladybugX = 480;
    ladybugY = 500 - (pm - 2300);
  }
  else if(pm < 2600) {
    ladybugX = 480 - random(3);
    ladybugY = 300 - random(3);
  }
  else if(pm < 3000) {
    ladybugX = 480 + 380 * (pm - 2500) / 500;
    ladybugY = 300 - 200 * (pm - 2500) / 500;
  }

  if(pmw > 2600 & pmw < 3000) {
    wingX = 480 + 380 * (pmw - 2500) / 500;
    wingY = 300 - 200 * (pmw - 2500) / 500;
  }
   
  else if(pmw < 2600) {
    wingX = -50;
    wingY = -50;
  }

  if(pml > 2600 & pml < 3000) {
    leaveX = 480 + 380 * (pml - 2500) / 500;
    leaveY = 300 - 200 * (pml - 2500) / 500;
  }
   
  else if(pml < 2600) {
    leaveX = -50;
    leaveY = -50;
  }

  //Trunk of trees
  fill(130, 100, 70);
  stroke(130, 100, 70);
  rect(60, -10, 20, 700);
  rect(140, 100, 20, 500);
  rect(220, -10, 20, 700);
  rect(300, 200, 20, 400);
  rect(380, -10, 20, 700);
  rect(460, 300, 20, 300);

  //Leaves
 
  color from = color(mouseY + 120, 120, 60);
  color to = color(255, 200, mouseY + 40);
  color interA = lerpColor(from, to, .20);
  color interB = lerpColor(from, to, .40);
  color interC = lerpColor(from, to, .60);
  color interD = lerpColor(from, to, .80);
 
  fill(from);
  stroke(from);
  triangle(60, 500, 30, 480, 30, 520);
  triangle(60, 400, 30, 380, 30, 420);
  triangle(60, 300, 30, 280, 30, 320);
  triangle(60, 200, 30, 180, 30, 220);
  triangle(60, 100, 30, 80, 30, 120);
  triangle(60, 0, 30, -20, 30, 20);
  triangle(80, 450, 110, 430, 110, 470);
  triangle(80, 350, 110, 330, 110, 370);
  triangle(80, 250, 110, 230, 110, 270);
  triangle(80, 150, 110, 130, 110, 170);
  triangle(80, 50, 110, 30, 110, 70);

  fill(interA);
  stroke(interA);
  triangle(140, 500, 110, 480, 110, 520);
  triangle(140, 400, 110, 380, 110, 420);
  triangle(140, 300, 110, 280, 110, 320);
  triangle(140, 200, 110, 180, 110, 220);
  triangle(140, 100, 110, 80, 110, 120);
  triangle(160, 450, 190, 430, 190, 470);
  triangle(160, 350, 190, 330, 190, 370);
  triangle(160, 250, 190, 230, 190, 270);
  triangle(160, 150, 190, 130, 190, 170);
 
  fill(interB);
  stroke(interB);
  triangle(220, 500, 190, 480, 190, 520);
  triangle(220, 400, 190, 380, 190, 420);
  triangle(220, 300, 190, 280, 190, 320);
  triangle(220, 200, 190, 180, 190, 220);
  triangle(220, 100, 190, 80, 190, 120);
  triangle(220, 0, 190, -20, 190, 20);
  triangle(240, 450, 270, 430, 270, 470);
  triangle(240, 350, 270, 330, 270, 370);
  triangle(240, 250, 270, 230, 270, 270);
  triangle(240, 150, 270, 130, 270, 170);
  triangle(240, 50, 270, 30, 270, 70);

  fill(interC);
  stroke(interC);
  triangle(300, 500, 270, 480, 270, 520);
  triangle(300, 400, 270, 380, 270, 420);
  triangle(300, 300, 270, 280, 270, 320);
  triangle(300, 200, 270, 180, 270, 220);
  triangle(320, 450, 350, 430, 350, 470);
  triangle(320, 350, 350, 330, 350, 370);
  triangle(320, 250, 350, 230, 350, 270);

  fill(interD);
  stroke(interD);
  triangle(380, 500, 350, 480, 350, 520);
  triangle(380, 400, 350, 380, 350, 420);
  triangle(380, 300, 350, 280, 350, 320);
  triangle(380, 200, 350, 180, 350, 220);
  triangle(380, 100, 350, 80, 350, 120);
  triangle(380, 0, 350, -20, 350, 20);
  triangle(400, 450, 430, 430, 430, 470);
  triangle(400, 350, 430, 330, 430, 370);
  triangle(400, 250, 430, 230, 430, 270);
  triangle(400, 150, 430, 130, 430, 170);
  triangle(400, 50, 430, 30, 430, 70);

  fill(to);
  stroke(to);
  triangle(460, 500, 430, 480, 430, 520);
  triangle(460, 400, 430, 380, 430, 420);
  triangle(460, 300, 430, 280, 430, 320);
  triangle(480, 450, 510, 430, 510, 470);
  triangle(480, 350, 510, 330, 510, 370);
  
  //Flying leaves
  fill(255, 200, 255);
  stroke(255, 200, 255);
  triangle(leaveX - 100, leaveY + 5, leaveX - 100, leaveY, leaveX - 105, leaveY - 5);
  triangle(leaveX - 130, leaveY + 5, leaveX - 130, leaveY + 15, leaveX - 120, leaveY + 10);
  triangle(leaveX - 130, leaveY + 5, leaveX - 130, leaveY + 15, leaveX - 120, leaveY + 10);

  //A bug's wings
  fill(200, 240, 255);
  stroke(255);
  rect(wingX + 6, wingY + 6, 15, 15);
  rect(wingX - 20, wingY - 20, 15, 15);
 
  //A bug's body
  fill(250, 10, 10);
  stroke(250, 10, 10);
  ellipse(ladybugX, ladybugY, 25, 25);
 
  //A bug's dots
  fill(50);
  stroke(50);
  ellipse(ladybugX - 10,ladybugY + 2, 5, 5);
  ellipse(ladybugX + 10, ladybugY, 5, 5);
  ellipse(ladybugX + 3, ladybugY - 3, 5, 5);
  ellipse(ladybugX, ladybugY + 7, 5, 5);
  ellipse(ladybugX + 5, ladybugY - 7, 5, 5);

  //A bug's eyes
  fill(50);
  stroke(255);
  ellipse(ladybugX + 13, ladybugY - 10, 5, 5);
  ellipse(ladybugX + 8, ladybugY - 15, 5, 5);
}
