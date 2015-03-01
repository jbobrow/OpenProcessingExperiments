
float PHI = .6;
int a=6;
void setup(){
  size(720,720);
  stroke(0);
  fill(0,100,250);
    /*
  translate(width/2, 100);
  fractal(11,100,15);
    */
}
   
void draw(){
 // PHI = mouseY/10;
  background(200,200,0);
  translate(width/2, 100);
  fractal(10,100,mouseX/10);
}
   
void fractal(int BRANCH, float LENGTH, int ANGLE){
  BRANCH --;
  
  float PH= LENGTH * PHI;
  float A = PH * tan(radians(ANGLE));//the height from the head intersection to the base
  float B = LENGTH * (1-PHI); //the small part of the small triangle
  float C = sqrt(sq(A)+sq(B));//the small square length
  float D = PH *(1/cos(radians(ANGLE)));//the bigger square length
  rect(0,0,LENGTH,LENGTH);
  if(BRANCH >=0){
    pushMatrix();
    translate(0,LENGTH);
    rotate(radians(ANGLE));
    fractal(BRANCH, D, ANGLE);
    popMatrix();
    
    pushMatrix();
    translate(LENGTH*PHI,LENGTH+A);   
    rotate(radians(-degrees(atan(A/B))));
    fractal(BRANCH, C,ANGLE);
    popMatrix();

  }

}
/*void mousePressed(){
  if (key == 'u'){
    a++;
    background(0);
    translate(width/2,0);
    fractal(4,100,a);
  }
}*/
/*PH    B
----- ----
 \   |   /
  \  |A /
  D\ | / C
    \|/

       just a small illistration for A, B, C, D
*/
