
PFont f;
int num = 12;
int radiusKreis = -140;
int m = minute();
int i = 0;



void setup() {
  size(400, 400);
  rectMode(CENTER);
  //textMode(CENTER);
  smooth();
  f = loadFont("AgencyFB-Reg-20.vlw");
  
}

void draw() {  
  
  background(255);
  translate(width/2,height/2);
  for(int i = 0; i < num; i++) {
    pushMatrix();
    rotate(TWO_PI / num * i);
    translate(0, radiusKreis);
    strokeWeight(1);
    fill(random(255),random(255),random(255));
    rect(0,0,10,10);
    translate(0,-20);
    String[] zahl = {"12","1","2","3","4","5","6","7","8","9","10","11"};
    fill(0);
    textFont(f,20);
    textAlign(CENTER,CENTER);
    text(zahl [i], 0, 0);
        
    popMatrix();
  }
  
  int s = second();
  
  pushMatrix();
    rotate(TWO_PI/60*s);
    strokeWeight(1);
    line(0,0,0,-120);
  popMatrix();
  
  int h = hour();
  
    pushMatrix();
    rotate(TWO_PI/12*h);
    rotate(TWO_PI/12/60*m);
    strokeWeight(3);
    line(0,0,0,-50);
  popMatrix();
  

  
    pushMatrix();
    rotate(TWO_PI/60*m);
    strokeWeight(3);
    line(0,0,0,-100);
  popMatrix();

  
}


