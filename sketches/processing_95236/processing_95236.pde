
int blink = -120;
int w = 30;
int h = 30;
float x = map (mouseX, 0, width, 117, 185);
float y = map (mouseY, 0, width, 55, 150);


void setup () {
 size(600,200); 
 smooth();
}

void draw() {
 background(#F0CFB1);
 ellipseMode(CENTER);
 
 //eyeball
 fill(255);
 noStroke(); 
 ellipse(150, 75, 175, 110);
 ellipse(450, 75, 175, 110);

//pupil left

  float x = map (mouseX, 0, width, 117, 185);
  float y = map (mouseY, 0, width, 55, 150);
  fill (#5A2705);
  ellipse (x, y, 90, 90);
  fill (#7C3607, 95);
  ellipse (x, y, 70, 70);
  fill (0, 0, 0, 180);
  ellipse (x, y, w, h);
  fill (230, 230, 255);
  ellipse (x+5, y -15, 15, 15);
  
//pupil right
  fill (#5A2705);
  ellipse (x+300, y, 90, 90);
  fill (#7C3607, 95);
  ellipse (x+300, y, 70, 70);
  fill (0, 0, 0, 180);
  ellipse (x+300, y, w, h);
  fill (230, 230, 255);
  ellipse (x+305, y-15, 15, 15);

  //blink
  fill(#F0CFB1);
  rectMode(CORNER);
  rect (0, blink, 600, 255);
  if ((mousePressed == true) && (blink<20)) {
    blink+=10;
  }
  else if (blink>-200)
  {
    blink-=20;
  }
}

void mousePressed() {
  if (w>10) {
    w = w + 5;
    h = h + 5;
  }
    if (w>60)  {
    w = 30;
    h = 30;
  }
  }


