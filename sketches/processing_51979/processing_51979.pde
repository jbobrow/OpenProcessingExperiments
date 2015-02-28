

float b = 0;
color bc = 30;
boolean isDone = true;
float r = random(25);
float s = second();


void setup() {
  size(400, 400);
  background(255);
  smooth();
  frameRate(60);
  colorMode(RGB, 30);
}
void makeBlack() {
  bc--;
}
void makeWhite() {
  bc++;
}


void draw() {
  if (mousePressed == true) {
    colorMode(RGB,255);
    int mo = month();
    int d = day();
    int h = hour();
    int m = minute();
    int s = second();
    background(0);
    PFont font;
    font = loadFont("Serif-24.vlw");
    textFont(font);
    fill(255);
    if(mo == 2){
    text(mo+":"+d+":"+h+":"+m+":"+s, width/2, height/2,width,24);
    }
    
  } 
  else {
    colorMode(RGB,255);
    background(255);
    noStroke();
    int mo = month();
    colorMode(RGB, 12);
    fill(mo);
    ellipse(width/2, height/2, 300, 300);

    if (mo ==2);
    {
      colorMode(RGB, 28);
    }
    if (mo == 1 || mo == 3 || mo == 5 || mo == 7 || mo == 8 || mo == 10 || mo == 12) {
      colorMode(RGB, 31);
    }
    if (mo == 4 || mo == 6 || mo == 9 || mo == 11) {
      colorMode(RGB, 30);
    }

    int d = day();
    fill(d);
    ellipse(width/2, height/2, 270, 270);


    colorMode(RGB, 23);
    int h = hour();
    float hr = random(23);
    fill(h);
    ellipse(width/2, height/2, 10*(24), 10*(24));

    colorMode(RGB, 60);
    int m = minute();
    float mr = random(60);
    fill(m);
    ellipse(width/2, height/2, 3*(60), 3*(60));

    colorMode(RGB, 60);
    int s = second();
    float sr = random(60);
    fill(s);

    ellipse(width/2, height/2, 2*((60)-(s)), 2*((60)-(s)));
    fill(bc);
    colorMode(RGB, 60);
    ellipse(width/2, height/2, 2*((30)-(bc)), 2*((30)-(bc)));
    if (isDone) {
      makeBlack();
      if (bc == 0) {
        isDone = false;
      }
    } 
    else {
      makeWhite();
      if (bc == 30) {
        isDone = true;
      }
    }

    println(h+":"+m+":" + s);
  }
}

