
// rain by jared kant
// based on code from paper fountain 
// 

float sl, hl, x = 0;
float csize, g, fs, splish;
int wv, toggle, ryaxis, tload, jj  = 0;
int i, b=255;
int sqx, sqy, sqr = 100;
int splashcount = 100;
float [] splashx = new float[splashcount];
float [] splashy = new float[splashcount]; 
int rainsize = width;

void setup()
{ 
  size(800, 600);  //   size(displayWidth, displayHeight);
  background(255);
}

void draw() {
  // key events
  if (keyPressed) {
    if (keyCode==UP) {
      tload++;
    }
    if (keyCode==DOWN) {
      tload--;
    }
  }
  // end key events
  pushMatrix();
  noStroke();
  translate(width/2, height/2);
  rectMode(CENTER );
  ellipseMode(CENTER );

  float angle=random(10);
  if (second() % 2 == 1) {
    float howrotate = cos(angle);
    rotate(howrotate);
  } else {
    float howrotate = sin(angle);
    rotate(howrotate);
  } 
  for (hl=0; hl<360; hl++) {
    float angle2=random(10);
    translate(width/2, height/2);
    float howrotate2 = cos(angle2);
    rotate(howrotate2+hl);
    ellipseMode(CENTER );
    csize = random(1, 20);
    if (csize > 10) { 
      csize = random(1, 20);
      float feffect=random(1, 100);
      fill(200, feffect+tload);
      ellipse(0, 0, csize, csize);
    } else { 
      fill(200, 10);
      ellipse(0, 0, csize, csize);
      if (second() % 2 == 2) {
        fill(0, 0, 100, 10+tload);
      } 
      fill(0, 0, 100, 10);
      ellipse(0, ryaxis, csize, csize);
    }
  }
  popMatrix();

  // every 9 frames, adds transparent layer of white
  // causing fade effect 

  stroke(255); 
  fill(255, 50); 
  rectMode(CORNER); 
  if (g>9) {
    rect(0, 0, width, height);     
    g=0;
  } else {
    g++;
  }

  // end fade 
  // begin rain down

  pushMatrix();
  noStroke();
  smooth();
  for (jj=0; jj<splashcount; jj++) {
    splashx[jj]= random(0, 1000);
    splashy[jj]= random(0, 800);
    for (int splish=0; splish<10; splish++) {
      noStroke();
      fill(100, 100, 100, 5);
      ellipse(splashx[splish], splashy[splish], 2, 2);
      splashy[splish]+=1;
      splashx[splish]+=0.1;
    }
  }
  popMatrix();
  // end raindown
}

