
float PHI = .55;
int branch = 10;
int SqSize = 100;
int angle;
void setup(){
  size(500,600);
  stroke(0);
  fill(0,100,250);
    /*
  translate(width/2, 100);
  fractal(11,100,15);
    */
}
    
void draw(){
  PHI = .002*(width-mouseX);//the effect of changing mouseX
  //PHI = .002 * (angle+240);
  angle = height-mouseY/10-550;
  background(100,20,250);//dark blue background
  text("Ratio: "+PHI,0,10);
  text("branches: "+branch,0,20);
  text("Angle: "+angle,0,30);
  translate(width,height);//  just
  rotate(PI);             //flipping it
  translate(width/2-SqSize/2, 50);
  fractal(branch,SqSize,angle);//changing mouseY changes the angle
}
    
void fractal(int BRANCH, float LENGTH, int ALPH){
  BRANCH --;
  colorMode(HSB);
  fill(10*(branch-BRANCH),256,256);  //colored from red to green
  colorMode(RGB);
  float PH= LENGTH * PHI;
  float A = PH * tan(radians(ALPH));//the height from the head intersection to the base
  float B = LENGTH * (1-PHI); //the small part of the small triangle
  float C = sqrt(sq(A)+sq(B));//the small square length
  float D = PH *(1/cos(radians(ALPH)));//the bigger square length
  int BET = int(degrees(atan(A/B)));
  rect(0,0,LENGTH,LENGTH); //the one big first square
  if(BRANCH > 0){
    if(BRANCH%2 == 1){
      pushMatrix(); //the first branched square
      translate(0,LENGTH); //located one LENGTH straight up
      rotate(radians(ALPH));
      fractal(BRANCH, D, ALPH);
      popMatrix();
      
      pushMatrix(); //the second branched square
      translate(PH,LENGTH+A); //located (PH forward)and(the square LENGTH + A upward)
      //[ellistrated at the end of the code]
      rotate(radians(-BET));//rotated with the slope created from A and B
      fractal(BRANCH, C,ALPH);
      popMatrix();
    }else{
      pushMatrix();
      translate(0,LENGTH);
      rotate(radians(BET));
      fractal(BRANCH, C, ALPH);
      popMatrix();
      
      pushMatrix();
      translate(B,LENGTH+A);
      rotate(radians(-ALPH));
      fractal(BRANCH, D, ALPH);
      popMatrix();
    }
  }
 
}
/*PH    B
----- ----
 \   |   /
  \  |A /
  D\ | / C
    \|/
 
       just a small illistration for A, B, C, D
*/
