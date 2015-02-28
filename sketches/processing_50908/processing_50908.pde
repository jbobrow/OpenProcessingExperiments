
/*
 Ka Kit Cheong 
 Wave Pattern
 01/29/2012
*/

// variables
float step = 0.0;
float theta = PI/18;
int dia = 20;

// setup
size(800, 800);
smooth();
noStroke();

// draw
for (int i=0; i<=height; i+=20) {
  pushMatrix();
  translate(0, i);
  for (int j=0; j<width+dia; j++) {
    float ypos = 0 + (sin(step)*dia);
    if ( j%2 == 0){
      fill(0);
    } else{
      fill(255);
    }
    ellipse(j, ypos, dia, dia);
    step += theta;  // update theta vaule each frame
  }
  popMatrix();
}


