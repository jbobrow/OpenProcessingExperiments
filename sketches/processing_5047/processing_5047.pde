

/*
stylize vibrating speakers
September 6, 2009
*/

float turn = 0; //
float noiseNum = 0; //have to assign value to variable
float noiseNum2 = 0;
float secondpos = random (-200, 200);
void setup() {
  size(500,500);
  background(255);
  smooth();
}

void draw() {
 
 translate(width/2, height/2);
 rotate(turn);

 float end = noise(noiseNum) * 300;
 noiseNum = noiseNum + 0.01;
 stroke(220,100,20,25);
 ellipse(0,0,end,end);
 
 float end2 =noise(noiseNum2) *200;
 noiseNum2 = noiseNum2 - 0.03;
 stroke(210,200,80,100);
 ellipse(secondpos,secondpos,end2,end2);
} 


