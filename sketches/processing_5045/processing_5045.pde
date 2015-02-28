
/*
Traveling wave demo
October 6, 2009
*/
float turn = 0; 

void setup() {
  size(500,500);
  background(245,205,0);
  smooth();  
}

void draw() {
  translate(100, height/2+40);
  background(245,205,0);

  
  noStroke();
  fill(245,225,10);float amp=0;
  for (int i=0; i<20; i++) {
    amp = 100*cos(PI*i/10-turn);
    ellipse(mouseX*0.1*i, 100*cos(PI*i/10-turn), 5, 5);
  }
  fill(245,235,10);
    for (int i=0; i<20; i++) {
    ellipse(mouseX*0.1*i+50, 100*cos(PI*i/10-turn)+50, 20, 20);
  }
  fill(255,255,255);
    for (int i=0; i<20; i++) {
    ellipse(mouseX*0.1*i+150, 100*cos(PI*i/10-turn)+150, 30, 30);
  }   
  turn=turn+0.001*mouseY;
} 


