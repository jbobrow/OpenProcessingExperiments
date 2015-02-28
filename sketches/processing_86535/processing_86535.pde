
int RED = 50;
int BLUE = 60;
int GREEN = 20;
int ellipsesize = 120;

void setup(){
 size(600,500);
 background (RED, GREEN, BLUE);
}

void draw(){
  fill(99, 183, 72);
  noStroke ();
rect(50, 100, 65, 300);
ellipse(150, 150, ellipsesize, ellipsesize);

strokeWeight (5);
stroke(140, 140, 50);
line(200, 50, 260, 100);
  
}




