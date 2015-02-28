
int x = 0;
int y = 0;

void setup(){
  size(400, 400);
  noLoop();
  frameRate(60);
}

void draw(){
  x = 15;
  y = 80;
//  x = mouseX;
//  y = mouseY;
  smooth();
  noStroke();
  background(60);
  
//========================================================

// A (outer shape)
  fill(random(200, 280), random(40, 120), 0);

  beginShape();
  vertex(x+40,  y+160);
  vertex(x+120, y+40);
  vertex(x+155, y+40);
  vertex(x+155, y+160);
  vertex(x+130, y+160);
  vertex(x+130, y+145);
  vertex(x+80, y+145);
  vertex(x+70, y+160);
  vertex(x+40,  y+160);
  endShape();

// A (inner shape)
  fill(60);
  
  beginShape();
  vertex(x+100, y+115);
  vertex(x+130, y+70);
  vertex(x+130, y+115);
  vertex(x+100, y+115);
  endShape();

//=========================================================

// B (outer shape)
  fill(random(200, 280), random(40, 120), 80);

  beginShape();
  vertex(x+160, y+40);
  vertex(x+185, y+40);
  bezierVertex(x+185, y+40,  x+220, y+40,  x+220, y+70);
  bezierVertex(x+220, y+75,  x+220, y+80,  x+215, y+85);
  bezierVertex(x+225, y+90,  x+235, y+100, x+235, y+120);
  bezierVertex(x+235, y+160, x+195, y+160, x+195, y+160);
  vertex(x+160, y+160);
  vertex(x+160, y+40);
  endShape();
  
// B (top inner shape)  
  fill(60);

  beginShape();
  vertex(x+185, y+80);
  vertex(x+185, y+60); 
  vertex(x+190, y+60);
  bezierVertex(x+190, y+60,  x+200, y+60,  x+200, y+70);
  bezierVertex(x+200, y+80,  x+190, y+80,  x+190, y+80);
  vertex(x+190, y+80);
  endShape();
  
// B (bottom inner shape)  
  fill(60);

  beginShape();
  vertex(x+185, y+130);
  vertex(x+185, y+100);
  vertex(x+190, y+100);
  bezierVertex(x+195, y+100, x+210, y+100, x+210, y+115);
  bezierVertex(x+210, y+130, x+195, y+130, x+195, y+130);
  vertex(x+185, y+130);
  endShape();

//=========================================================

// F
  fill(random(200, 280), random(40, 120), 160);

  beginShape();
  vertex(x+240, y+160);
  vertex(x+240, y+40);
  vertex(x+305, y+40);
  vertex(x+305, y+65);
  vertex(x+265, y+65);
  vertex(x+265, y+115);
  vertex(x+285, y+115);
  vertex(x+285, y+145);
  vertex(x+265, y+145);
  vertex(x+265, y+160);
  vertex(x+240, y+160);
  endShape();  
  
//=========================================================
/*
// III (outer shape)
  fill(random(200, 280), random(40, 120), 240);

  beginShape();
  vertex(x+317.5, y+40);
  vertex(x+490,   y+40);
  vertex(x+482.5, y+65);
  vertex(x+465,   y+65);
  vertex(x+465,   y+135);
  vertex(x+490,   y+135);
  vertex(x+482.5, y+160);
  vertex(x+310,   y+160);
  vertex(x+317.5, y+135);
  vertex(x+335,   y+135);
  vertex(x+335,   y+65);
  vertex(x+310,   y+65);
  vertex(x+317.5, y+40);
  endShape();  
 
// III (left inner shape)
  fill(60);

  beginShape();
  rect(x+320, y+65, 20, 70);
  endShape();  
  
// III (right inner shape)
  fill(60);

  beginShape();
  vertex(x+830, y+130);
  vertex(x+870, y+130);
  vertex(x+870, y+270);
  vertex(x+830, y+270);
  vertex(x+830, y+130);
  endShape();  
*/
} 
void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}

