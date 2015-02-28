
PImage w;
int position = 0;
int start_time = 0;
int cercles =10000;

int[] x;
int[] y;

void setup() {
  size(600,600);
  smooth();
  stroke(50,50,150);
  fill(200,200,255);
    w = loadImage("w.jpg");
     x = new int[cercles];
  y = new int[cercles];  

}

void keyPressed() {
  position= position -10;
}


void draw() {

  background(255);
fill(0,0,0,25);
noStroke();
    image(w,position,0);
ellipse(mouseX,position,100,100);

if ( mousePressed ) {
    x[position] = mouseX;
    y[position] = mouseY;
    position = position + 10;
    if ( position >= cercles ) {
      position = 0;
    }

 }
  
    

  int i = 0; 
  while ( i < position ) {
    ellipse( x[i], y[i], 200,200 );
    i = i + 1;
  }

  if ( millis() > 1000 + start_time && millis() < 2000 + start_time ) {
    position = position + 1;  
  }

  if ( millis() > 2000 + start_time ) {
    start_time = millis();
  }

}


