
void setup() {
  size(320, 480);
}



// variables
float w, targetW, easingW = 0.02;
float h, targetH, easingH = 0.03;
float e, targetE, easingE = 0.034;
float a, targetA, easingA = 0.027;
float s, targetS, easingS = 0.01;
float sh = 0.0;
int y = 338;


// button colors
color clear = color (200, 255, 255, 100);
color red = color (237, 34, 36);
color yellow = color (246, 235, 22); 
color purple = color (143, 80, 160); 
color green = color (113, 192, 91); 
color blue = color (69, 85, 165); 
color orange = color (249, 159, 27); 
color white = color (255); 
color magenta = color (206, 76, 140); 
color teal = color (68, 195, 211); 



void draw() {
  
  // background & tile
  background(211, 226, 229);
  noStroke();
  fill(229, 217, 194);
  rect(0, 350, 50, 50);
  fill(240);
  rect(50, 350, 50, 50);
  fill(229, 217, 194);
  rect(100, 350, 50, 50);
  fill(240);
  rect(150, 350, 50, 50);
  fill(229, 217, 194);
  rect(200, 350, 50, 50);
  fill(240);
  rect(250, 350, 50, 50);
  fill(229, 217, 194);
  rect(300, 350, 50, 50);

  fill(240);
  rect(0, 400, 50, 50);
  fill(229, 217, 194);
  rect(50, 400, 50, 50);
  fill(240);
  rect(100, 400, 50, 50);
  fill(229, 217, 194);
  rect(150, 400, 50, 50);
  fill(240);
  rect(200, 400, 50, 50);
  fill(229, 217, 194);
  rect(250, 400, 50, 50);
  fill(240);
  rect(300, 400, 50, 50);

  fill(229, 217, 194);
  rect(0, 450, 50, 50);
  fill(240);
  rect(50, 450, 50, 50);
  fill(229, 217, 194);
  rect(100, 450, 50, 50);
  fill(240);
  rect(150, 450, 50, 50);
  fill(229, 217, 194);
  rect(200, 450, 50, 50);
  fill(240);
  rect(250, 450, 50, 50);
  fill(229, 217, 194);
  rect(300, 450, 50, 50);

  smooth();
  strokeCap(ROUND);
  stroke(0);



  // variables & easing
  targetW = mouseX;
  w = w + ((targetW - w) * easingW);
  targetH = mouseX;
  h = h + ((targetH - h) * easingH);
  targetE = mouseX;
  e = e + ((targetE - e) * easingE);
  targetA = mouseX;
  a = a + ((targetA - a) * easingA);
  targetS = mouseX;
  s = targetS * easingS;



  // ROBOT BODY

  // NECK
  strokeWeight(14);
  stroke(80);
  //rect(153, 250, 14, 47);
  line(h, 202, w, y);
  strokeWeight(4);
  stroke(0);
  line(h+7, 202, w+7, y);
  line(h-7, 202, w-7, y);



  // HEAD
  fill(80);
  noStroke();
  beginShape();
  vertex(h-2, 144);
  bezierVertex(h+76, 146, h+77, 201, h+66, 233);
  bezierVertex(h+54, 266, h-47, 267, h-64, 233);
  bezierVertex(h-77, 206, h-80, 139, h-2, 144);
  endShape(CLOSE);

  // shade
  fill(95);
  beginShape();
  vertex(h-2, 144);
  bezierVertex(h+76, 146, h+77, 201, h+66, 233);
  bezierVertex(h+62, 245, h+46, 253, h+26, 256);
  bezierVertex(h-8, 263, h-78, 192, h-64, 172);
  bezierVertex(h-55, 153, h-37, 142, h-2, 144);
  endShape(CLOSE);

  strokeWeight(4);
  stroke(0);
  noFill();
  beginShape();
  vertex(h-2, 144);
  bezierVertex(h+76, 146, h+77, 201, h+66, 233);
  bezierVertex(h+54, 266, h-47, 267, h-64, 233);
  bezierVertex(h-77, 206, h-80, 139, h-2, 144);
  endShape(CLOSE);



  // ANTENNA
  strokeWeight(5);
  line(a+42, 100, h+27, 161);

  strokeWeight(2);
  fill(237, 28, 36);
  ellipse(a+42, 100, 10, 10);



  // EYES
  fill(246, 235, 22);
  ellipse(e-42, 220, 17, 17);
  ellipse(e+45, 220, 17, 17);

  // shade
  noStroke();
  fill(254, 251, 237);
  ellipse(e-39, 219, 7, 7);
  ellipse(e+48, 219, 7, 7);
  stroke(0);



  // CUP HOLDER
  strokeWeight(2);
  fill(55);
  ellipse(h, 157, 40, 14);

  fill(30);
  beginShape();
  vertex(h-12, 162);
  bezierVertex(h-8, 160, h+3, 157, h+13, 162);
  bezierVertex(h+3, 165, h-10, 163, h-12, 162);
  endShape();

  noStroke();
  fill(255, 50);
  beginShape();
  vertex(h-19, 128);
  bezierVertex(h-19, 128, h-8, 124, h-1, 125);
  bezierVertex(h+6, 126, h+8, 128, h+12, 126);
  bezierVertex(h+16, 125, h+20, 126, h+19, 128);
  bezierVertex(h+19, 128, h+14, 162, h+14, 162);
  bezierVertex(h+10, 163, h-5, 164, h-14, 162);
  bezierVertex(h-14, 162, h-19, 128, h-19, 128);
  endShape();



  // DRINK
  stroke(0);
  strokeWeight(1);

  fill(clear);
  noStroke();
  beginShape();
  vertex(h-19, 128);
  bezierVertex(h-19, 128, h-8, 124, h-1, 125);
  bezierVertex(h+6, 126, h+8, 128, h+12, 126);
  bezierVertex(h+16, 125, h+20, 126, h+19, 128);
  bezierVertex(h+19, 128, h+14, 162, h+14, 162);
  bezierVertex(h+10, 163, h-5, 164, h-14, 162);
  bezierVertex(h-14, 162, h-19, 128, h-19, 128);
  endShape();

  beginShape();
  vertex(h-19, 128);
  bezierVertex(h-19, 128, h-8, 124, h-1, 125);
  bezierVertex(h+6, 126, h+8, 128, h+12, 126);
  bezierVertex(h+16, 125, h+20, 126, h+19, 128);
  bezierVertex(h+19, 128, h+20, 131, h+12, 131);
  bezierVertex(h+4, 131, h-1, 130, h-7, 132);
  bezierVertex(h-14, 134, h-19, 128, h-19, 128);
  endShape();
  stroke(0);



  // BUTTONS
  fill(red);
  rect(e-12, 221, 7, 7);

  fill(yellow);
  rect(e-3, 221, 7, 7);

  fill(purple);
  rect(e+6, 221, 7, 7);

  fill(green);
  rect(e-12, 230, 7, 7);

  fill(blue);
  rect(e-3, 230, 7, 7);

  fill(orange);
  rect(e+6, 230, 7, 7);

  fill(white);
  rect(e-12, 239, 7, 7);

  fill(magenta);
  rect(e-3, 239, 7, 7);

  fill(teal);
  rect(e+6, 239, 7, 7);



  // CUP
  stroke(0);
  strokeWeight(2);
  noFill();
  ellipse(h, 114, 42, 14);
  line(h-21, 114, h-14, 161);
  line(h+21, 114, h+14, 161);



  // WHEEL
  strokeWeight(4);

  // outside
  fill(171);
  ellipse(w, y, 93, 93);

  // middle
  fill(80);
  ellipse(w, y, 79, 79);

  //shade
  noStroke();
  fill(65);
  ellipse(w, y, 38, 38);
  stroke(0);

  // spokes
  s = s + -200;
  translate(w, y);
  rotate(s);

  line(0, 299-y, 0, 377-y);
  line(-19, 304-y, 19, 371-y);
  line(-33, 318-y, 33, 359-y);
  line(-39, 0, 39, 0);
  line(-32, 359-y, 34, 318-y);
  line(-19, 372-y, 20, 305-y);

  // inside
  fill(255);
  ellipse(0, 0, 15, 15);

}



// DRINK CHANGE

  // TOP ROW
 void keyPressed() {
  if (key == '1' || key =='r') {
    clear = color (237, 34, 36, 190); 
  }
  else if (key == '2' || key =='y') {
    clear = color (246, 235, 22, 190); 
  } 
  else if (key == '3' || key =='p') {
    clear = color (143, 80, 160, 190); 
  } 

  // MIDDLE ROW
  else if (key == '4' || key =='g') {
    clear = color (113, 192, 91, 190); 
  }
  else if (key == '5' || key =='b') {
    clear = color (69, 85, 165, 190); 
  }
  else if (key == '6' || key =='o') {
    clear = color (249, 159, 27, 190); 
  }

  // BOTTOM ROW
  else if (key == '7' || key =='w') {
    clear = color (255, 190); 
  }
  else if (key == '8' || key =='m') {
    clear = color (206, 76, 140, 190); 
  }
  else if (key == '9' || key =='t') {
    clear = color (68, 195, 211, 190); 
  } 
  else {
    clear = color (200, 255, 255, 100);
  }
}

