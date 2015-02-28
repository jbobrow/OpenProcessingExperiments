
double[] total = {0.5, 4.5, 12.9,74.3,7.9};
double[] male = {0.4, 3.4, 8.6, 64, 6.3};
double[] female = {0.1, 1, 4.3, 10.3 ,1.6};
String[] race = {"AMI/ALN", "ASIAN", "BLACK", "WHITE", "UNK"};
boolean sep = true;
PImage m;
PImage f;
PFont ariel;
boolean beg = true;

void setup() {
  size(1000,650);
  background(255);
  ariel = createFont("Arial",16,true);
  m = loadImage("male.png");
  f = loadImage("female.png");
}

void setup2() {
  fill(0,0,255,100);
  rect(30, 150, 100, 50);
  rect(30, 300, 100, 50);
  line(140,600,1000,600);
  line(140,600,140,40);
  textFont(ariel, 20);
  fill(0);
  text("Combined", 33,185);
  textFont(ariel, 17);
  text("Male/Female", 32, 333);
  for(int i = 1; i < race.length;i++) {
    text(race[i],(int)i*200+20, 630); 
  }
}

void draw() {
  if (beg) {
    setup2();
    beg = false;
  }
  stroke(255);
  fill(255);
  rect(141, 0, 900, 599);
  textFont(ariel, 30);
  fill(0);
  text("Relative # of People in U.S. Active Service",30,30);
  if (sep) {
    for(int i = 0; i < male.length; i++) {
      image(m, (int)(i*200), 600-(int)male[i]*8, 85, (int)male[i]*8);
      image(f, (int)(i*200 + 70), 600-(int)female[i]*8, 85, (int)female[i]*8);
    }
  }
  else {
    for(int i = 0; i < total.length; i++) {
      stroke(0);
      fill(204,0,255);
      rect((int)i*200, 600-(int)total[i]*8, 85, (int)total[i]*8);
    }
  }
}

void mousePressed() {
  if (overRect(30, 150, 100, 50)) {
    sep = false;
  }
  if (overRect(30, 300, 100, 50)) {
    sep = true;
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}


