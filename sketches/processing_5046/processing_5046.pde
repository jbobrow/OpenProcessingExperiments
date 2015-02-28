
/*
Radar
Oct 06, 2009
*/

float turn = 0; 
float noiseNum = 0; //have to assign value to variable

void setup() {
  size(500,500);
  background(245,205,0);
  smooth();  
}

void draw() {
  translate(width/2+20, height/2+80);//translate the origin
  rotate(turn);
  stroke(240,230-10*turn,130+10*turn);
  line(100,100, 0, 0);
  turn = turn +0.01; //turn the paper
  for (int i=0; i<20; i++) {
  ellipse(20*i, sin(i/20), 2, 2);
  }
} 


