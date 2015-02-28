
float t;
float step;
float v;
float n;
float bonus;
float count3;
float count2;
float count1;
float P1X;
float P1Y;
float P1mouseY;
boolean _P1up;
boolean _P1down;
int score;
int Screen;
PFont font;

void setup()
{
  size(800,480);
  smooth();
  stroke(2);
  fill(2);
  bonus = 0;
  count3 = 0;
  count2 = 0;
  count1 = 0;
  t = 0.0;
  step = 0.005;
  v = 0.0;
  n = 40.0;
  P1X = 570.0;
  P1Y = 225.0;
  P1mouseY = mouseY;
  _P1up = false;
  _P1down = false;
  score = 0;
  font = loadFont("Rockwell-Bold-150.vlw");
  textFont(font);
  Screen = 1;
  colorMode(HSB,360,100,100);
  noCursor();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      _P1up = true;
    }
    if (keyCode == DOWN) {
      _P1down = true;
    }
  }
}  
void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      _P1up = false;
    }
    if (keyCode == DOWN) {
      _P1down = false;
    }
  }
}

void draw()
{
  background(340,30,60);
  if (Screen == 1) {
    textSize(150);
    fill(0,0,100);
    text("t",3,100);
    text("h",350,100);
    text(".",620,100);
    fill(340,30,30);
    textSize(120);
    text("track hero.",8,90);
    textSize(70);
    text("choose your",width/2-183,180);
    text("control style:",width/2-60,250);
    if (mouseX <= 325 && mouseX >= 125 && mouseY >=320 && mouseY <= 450) {
      fill(0,0,100);
      rect(120,315,210,140);
    }
    if (mouseX <= 675 && mouseX >= 475 && mouseY >=320 && mouseY <= 450) {
      fill(0,0,100);
      rect(470,315,210,140);
    }
    noStroke();
    fill(340,30,30);
    rect(125,320,200,130);
    rect(475,320,200,130);
    textSize(35);
    fill(340,30,60);
    text("arrow keys", 128, 348);
    text("better", 130, 388);
    text("control,", 160, 413);
    text("but slower", 130, 442);
    text("mouse", 519, 348);
    text("worse", 480, 388);
    text("control,", 510, 413);
    text("but faster", 480, 442);
    fill(0,0,0);
    textSize(30);
    text("+", mouseX-10,mouseY+10);
  }
  if (Screen == 21){
    fill(0,0,100);
    noStroke();
    ellipse(P1X,P1Y,30,30);
    fill(340,30,30);
        textSize(30);
    text("you",542,205);
    textSize(100);
    text("3",370,height/2);
    textSize(60);
    text("stay on track!",193,400);
    count3++;
    if(count3 == 60){
      Screen = 22;
    }
  }
  if (Screen == 22){
    fill(0,0,100);
    noStroke();
    ellipse(P1X,P1Y,30,30);
    fill(340,30,30);
        textSize(30);
    text("you",542,205);
    textSize(100);
    text("2",370,height/2);
    textSize(60);
    text("stay on track!",193,400);
    count2++;
    if(count2 == 60){
      Screen = 23;
    }
  }
  if (Screen == 23){
    fill(0,0,100);
    noStroke();
    ellipse(P1X,P1Y,30,30);
    fill(340,30,30);
        textSize(30);
    text("you",542,205);
    textSize(100);
    text("1",370,height/2);
    textSize(60);
    text("stay on track!",193,400);
    count1++;
    if(count1 == 60){
      Screen = 2;
    }
  }
  if (Screen == 2) {
    textSize(30);
    fill(0,0,0);
    text("+", mouseX-10,mouseY+10);
    fill(340,30,30);
    textSize(80);
    if(bonus < 120){
    score++;
    }
    else if(bonus >= 120 && bonus < 300){
      score = score + 2;
      text("X2",8,470);
    }
    else if(bonus >= 300 && bonus < 540){
      score = score +3;
      text("X3",8,470);
    }
    else if(bonus >= 540 && bonus < 840){
      score = score +4;
      text("X4",8,470);
    }
    else if(bonus >= 840){
      score = score +5;
      text("X5",8,470);
    }
    text (nf(score,5),580,470);
    
    for(int i=0; i<width; i++) {
      t = t+step;
      n = noise((i+t)/(500.0-(t/100))) *height/2;
      line(i,n+100,i,n+140);
      if(P1X == i) {
        if ( P1Y < n+100 || P1Y > n+140) {
          fill(0,100,100);
          P1X = P1X - 1;
          bonus=0;
        }
        else if(P1Y > n+100 && P1Y < n+140) {  
          fill(0,0,100);
          bonus++;
        }
      }
    }
    if(P1X <= 0.0) {
      Screen = 4;
    }
    if(_P1up) {
      P1Y = P1Y - 3;
    }
    if(_P1down) {
      P1Y = P1Y + 3;
    }
    noStroke();
    ellipse(P1X,P1Y,30,30);
    stroke(340,30,30);

  }
  if (Screen == 31){
    fill(0,0,100);
    noStroke();
    ellipse(P1X,P1Y,30,30);
    fill(340,30,30);
        textSize(30);
    text("you",542,205);
    textSize(100);
    text("3",370,height/2);
    textSize(60);
    text("stay on track!",193,400);
    count3++;
    if(count3 == 60){
      Screen = 32;
    }
  }
  if (Screen == 32){
    fill(0,0,100);
    noStroke();
    ellipse(P1X,P1Y,30,30);
    fill(340,30,30);
        textSize(30);
    text("you",542,205);
    textSize(100);
    text("2",370,height/2);
    textSize(60);
    text("stay on track!",193,400);
    count2++;
    if(count2 == 60){
      Screen = 33;
    }
  }
  if (Screen == 33){
    fill(0,0,100);
    noStroke();
    ellipse(P1X,P1Y,30,30);
    fill(340,30,30);
        textSize(30);
    text("you",542,205);
    textSize(100);
    text("1",370,height/2);
    textSize(60);
    text("stay on track!",193,400);
    count1++;
    if(count1 == 60){
      Screen = 3;
    }
  }
  if (Screen == 3) {
    fill(0,0,0);
    textSize(80);
    fill(340,30,30);
    if(bonus < 120){
    score++;
    }
    else if(bonus >= 120 && bonus < 300){
      score = score + 2;
      text("X2",8,470);
    }
    else if(bonus >= 300 && bonus < 540){
      score = score +3;
      text("X3",8,470);
    }
    else if(bonus >= 540 && bonus < 840){
      score = score +4;
      text("X4",8,470);
    }
    else if(bonus >= 840){
      score = score +5;
      text("X5",8,470);
    }
    text (nf(score,5),580,470);
    for(int i=0; i<width; i++) {
      t = t+step;
      n = noise((i+t)/(500.0-(t/100))) *height/2;
      line(i,n+100,i,n+140);
      if(P1X == i) {
        if ( P1mouseY < n+100 || P1mouseY > n+140) {
          fill(0,100,100);
          P1X = P1X - 1;
          bonus = 0;
        }
        else if(P1mouseY > n+100 && P1mouseY < n+140) {  
          fill(0,0,100);
          bonus++;
        }
      }
    }
    if(P1X <= 0.0) {
      Screen = 4;
    }
    noStroke();
    P1mouseY = mouseY;
    ellipse(P1X,P1mouseY,30,30);
    stroke(340,30,30);
  }

  if (Screen == 4) {
    noStroke();
    textSize(180);
    fill(0,0,100);
    text("e", 470,120);
    textSize(150);
    fill(340,30,30);
    text("end.", 479,112);
    textSize(70);
    text("final score: ", 100,height/2+20);
    textSize(100);
    text(nf(score,5), 510,height/2+35);
    if (mouseX <= 500 && mouseX >= 300 && mouseY >=320 && mouseY <= 450) {
      fill(0,0,100);
      rect(295,315,210,140);
    }
    fill(340,30,30);
    rect(300,320,200,130);
    textSize(35);
    fill(340,30,60);
    text("again?", 344, 392);
    fill(0,0,0);
    textSize(30);
    text("+", mouseX-10,mouseY+10);
  }
}

void mousePressed() {
  if (Screen == 1) {
    if (mouseX <= 325 && mouseX >= 125 && mouseY >=320 && mouseY <= 450) {
      Screen = 21;
    }
    if (mouseX <= 675 && mouseX >= 475 && mouseY >=320 && mouseY <= 450) {
      Screen = 31;
    }
  }
  if (Screen == 4) {
    setup();
  }
}


