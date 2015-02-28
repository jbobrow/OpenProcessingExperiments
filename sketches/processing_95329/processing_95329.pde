
/* symspirals */
/* A fun exploration with symmtry that reacts to keyboard input */
/* rfboyce@gmail.com */
/* 07 Apr 2013 */

Spiral[] spirals;
int sym = 8;
int maxSym = 20;

void setup(){
  size(600, 600);
  background(0);
  spirals = new Spiral[maxSym];
  for (int i = 0; i < spirals.length; i++){
    spirals[i] = new Spiral(height/2);
  }
}

void draw(){
  background(0);
  for(int i = 0; i < sym; i++) {
    pushMatrix();
    translate(width/2,height/2);
    rotate(i*TWO_PI/sym);
    spirals[i].display(color(random(50, 255), random(50, 255), random(50, 255)));
    popMatrix();
  }
}

void keyPressed(){
  if (keyCode == UP){
    sym++;
    sym = constrain(sym, 1, maxSym);
  }
  else if (keyCode == DOWN){
    sym--;
    sym = constrain(sym, 1, maxSym);
  }
  // print canvas
  else if (key == 'p') {
    save("symspiral.jpg");
  }
}
class Spiral{
  int spSize = 10;
  int seed;
  int[] spiralF;
  float s; // scale
  
  Spiral(int scaledW){
    seed = (scaledW)/(spSize*10);
    s = 1;
    spiralF = new int[spSize];
    // populate the array with the golden spiral
    for (int i = 0; i < spiralF.length; i++){
      if (i < 2){
        spiralF[i] = seed;
      }
      else {
        spiralF[i] = spiralF[i-1] + spiralF[i-2];
      }
    }
  }
  
  void display(color spColor){
      translate(0, spiralF[spSize-1]*s);
      rotate(radians(-90));
      for (int i = spiralF.length-1; i > 0; i--){
        if (i < spiralF.length-1){
         translate(spiralF[i+1]*s, 0);
          rotate(radians(90));
          translate(spiralF[i+1]*s, 0);
        }
        noFill();
        stroke(spColor);
        rect(0, 0, spiralF[i]*s, spiralF[i]*s);
//        fill(0, 255, 0);
//        ellipse(0, 0, 10, 10);
        line(0, 0, spiralF[i], spiralF[i]);
      }
   }
}

