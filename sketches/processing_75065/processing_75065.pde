
boolean overbutton1 = false;
boolean overbutton2 = false;
boolean overbutton3 = false;
boolean click3 = false;
boolean overbutton4 = false;
boolean click4 = false;
boolean overbutton5 = false;
boolean click5 = false;
boolean overbutton6 = false;
boolean click6 = false;
boolean overbutton7 = false;
boolean click7 = false;
boolean overbutton8 = false;
boolean click8 = false;
int fillone = 255;
int fill2 = 0;
int fill3 = 255;
int fill4 = 0;
int fill5 = 255;
int fill6 = 0;
int fill7 = 255;
int fill8 = 0;

void setup() {
  size(800, 100);
}

void draw() {
  strokeWeight (10);
  stroke(150);
  line(80, 0, 80, 600);
  line(160, 0, 160, 600);
  line(240, 0, 240, 600);
  line(320, 0, 320, 600);
  line(400, 0, 400, 600);
  line(480, 0, 480, 600);
  line(560, 0, 560, 600);
  line(640, 0, 640, 600);
  line(720, 0, 720, 600);
  fill(0);
  rect(0, 0, 80, 100);
  fill(255);
  rect(80, 0, 80, 100);

  if (mouseX >= 160 && mouseX <= 240) {
    overbutton1 = true;
  }
  else { 
    overbutton1 = false;
  };

  if ((mousePressed == true) && (overbutton1 == true)) {
    fillone = (0);
  }
  else { 
    fillone = (255);
  };

  fill(fillone);
  rect(160, 0, 80, 100);
  arrow1();

  if (mouseX >= 240 && mouseX <= 320) {
    overbutton2 = true;
  }
  else { 
    overbutton2 = false;
  };

  if ((mousePressed == true) && (overbutton2 == true)) {
    fill2 = (255);
  }
  else { 
    fill2 = (0);
  };

  fill (fill2);
  rect(240, 0, 80, 100);
  arrow2();

  if (mouseX >= 320 && mouseX <= 400) {
    overbutton3 = true;
  }
  else { 
    overbutton3 = false;
  };

  if ((click3 == true) && (overbutton3 == true)) {
    fill3 = (0);
  }
  else { 
    fill3 = (255);
  };

  fill(fill3);
  rect(320, 0, 80, 100);
  arrow3();

  if (mouseX >= 400 && mouseX <= 480) {
    overbutton4 = true;
  }
  else { 
    overbutton4 = false;
  };

  if ((click4 == true) && (overbutton4 == true)) {
    fill4 = (255);
  }
  else { 
    fill4 = (0);
  };

  fill(fill4);
  rect(400, 0, 80, 100);
  arrow4();

  if (mouseX >= 480 && mouseX <= 560) {
    overbutton5 = true;
  }
  else { 
    overbutton5 = false;
  };

  if ((click5 == true) && (overbutton5 == true)) {
    fill5 = (0);
  };
  fill(fill5);
  rect(480, 0, 80, 100);
  arrow5();

  if (mouseX >= 560 && mouseX <= 640) {
    overbutton6 = true;
  }
  else { 
    overbutton6 = false;
  };

  if ((click6 == true) && (overbutton6 == true)) {
    fill6 = (255);
  };
  fill(fill6);
  rect(560, 0, 80, 100);
  arrow6();

  if (mouseX >= 640 && mouseX <= 720) {
    overbutton7 = true;
  }
  else { 
    overbutton7 = false;
  };

  if ((click7 == true) && (overbutton7 == true)) {
    fill7 = (0);
  };
  fill(fill7);
  rect(640, 0, 80, 100);
  arrow7();

  if (mouseX >= 720 && mouseX <= 800) {
    overbutton8 = true;
  }
  else { 
    overbutton8 = false;
  };

  if ((click8 == true) && (overbutton8 == true)) {
    fill8 = (255);
  };
  fill(fill8);
  rect(720, 0, 80, 100);
  arrow8();
}



void arrow1() {
  int arrow1x=200;
  int arrow1y=50;
  stroke(0);
  strokeWeight(7);
  strokeCap(SQUARE);
  line(arrow1x, arrow1y+10, arrow1x, arrow1y-10);
  strokeWeight(1);
  fill(0);
  triangle(arrow1x-10, arrow1y+10, arrow1x, arrow1y+20, arrow1x+10, arrow1y+10);
  triangle(arrow1x-10, arrow1y-10, arrow1x, arrow1y-20, arrow1x+10, arrow1y-10);
  strokeWeight (10);
  stroke(150);
}

void arrow2() {
  int arrow2x=280;
  int arrow2y=50;
  stroke(255);
  strokeWeight(7);
  line(arrow2x, arrow2y+10, arrow2x, arrow2y-10);
  strokeWeight(1);
  fill(255);
  triangle(arrow2x-10, arrow2y+10, arrow2x, arrow2y+20, arrow2x+10, arrow2y+10);
  triangle(arrow2x-10, arrow2y-10, arrow2x, arrow2y-20, arrow2x+10, arrow2y-10);
  strokeWeight (10);
  stroke(150);
}

void arrow3() {
  strokeWeight(7);
  stroke(0);
  int arrow3x=360;
  line(arrow3x-12, 40, arrow3x-12, 70);
  line(arrow3x+12, 40, arrow3x+12, 70);
  strokeWeight(1);
  fill(0);
  triangle(arrow3x-22, 40, arrow3x-12, 30, arrow3x-2, 40);
  triangle(arrow3x+22, 40, arrow3x+12, 30, arrow3x+2, 40);
  strokeWeight (10);
  stroke(150);
}

void arrow4() {
  strokeWeight(7);
  stroke(255);
  int arrow4x=440;
  line(arrow4x-12, 40, arrow4x-12, 70);
  line(arrow4x+12, 40, arrow4x+12, 70);
  strokeWeight(1);
  fill(255);
  triangle(arrow4x-22, 40, arrow4x-12, 30, arrow4x-2, 40);
  triangle(arrow4x+22, 40, arrow4x+12, 30, arrow4x+2, 40);
  strokeWeight (10);
  stroke(150);
}

void arrow5() {
  int arrow5x=520;
  stroke(0);
  strokeWeight(7);
  line(arrow5x, 40, arrow5x, 70);
  strokeWeight(1);
  fill(0);
  triangle(arrow5x-10, 40, arrow5x, 30, arrow5x+10, 40);
  strokeWeight (10);
  stroke(150);
}

void arrow6() {
  int arrow6x=600;
  stroke(255);
  strokeWeight(7);
  line(arrow6x, 40, arrow6x, 70);
  strokeWeight(1);
  fill(255);
  triangle(arrow6x-10, 40, arrow6x, 30, arrow6x+10, 40);
  strokeWeight (10);
  stroke(150);
}

void arrow7() {
  int arrow7x=680;
  stroke(0);
  strokeWeight(7);
  line(arrow7x, 30, arrow7x, 60);
  strokeWeight(1);
  fill(0);
  triangle(arrow7x-10, 60, arrow7x, 70, arrow7x+10, 60);
  strokeWeight (10);
  stroke(150);
}

void arrow8() {
  int arrow8x=760;
  stroke(255);
  strokeWeight(7);
  line(arrow8x, 30, arrow8x, 60);
  strokeWeight(1);
  fill(255);
  triangle(arrow8x-10, 60, arrow8x, 70, arrow8x+10, 60);
  strokeWeight (10);
  stroke(150);
}

void mousePressed() {
  if (click7 == false && (overbutton7 == true)) {
    click7 = true;
  }
  else {
    click7 = false;
  }

  if (click8 == false && (overbutton8 == true)) {
    click8 = true;
  }
  else {
    click8 = false;
  }
}

void mouseReleased() {
    if (click3 == false && (overbutton3 == true)) {
    click3 = true;
  }
  else {
    click3 = false;
  }
  
  if (click4 == false && (overbutton4 == true)) {
    click4 = true;
  }
  else {
    click4 = false;
  }
  
  if (click5 == false && (overbutton5 == true)) {
    click5 = true;
  }
  else {
    click5 = false;
  }

  if (click6 == false && (overbutton6 == true)) {
    click6 = true;
  }
  else {
    click6 = false;
  }
}
