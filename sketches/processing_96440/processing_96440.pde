
float theta=radians(random(40, 65));
//float xa=0.0;
void setup() {
  size(600, 600);
  background(0);
  //theta=map(sin(frameCount*0.05), 0,100, 0, 2*PI);
  translate(width/2, height);
  branch(90);
}


void branch(float len) {
  stroke(255, 255, 255,100);
  strokeWeight(len/30);
  organicLine(0, 0, 0, -len, 2, 0);
  translate(0, -len);
  if (len<=50) {
    stroke(255, 10);
    fill(26, 104, 255, 100);
     ellipse(0, 0, 13, 13);
  }
 
  if (len >10) { // no inf. loop
    pushMatrix();
    rotate(-theta*.8);
    branch(len*.75);
    popMatrix();
   
    pushMatrix();
    rotate(-theta*.5);
    branch(len*.5);
    popMatrix();
    
    pushMatrix();
    rotate(theta*.8);
    branch(len*.75);
    popMatrix();
  }
}


void organicLine(float x1, float y1, float x2, float y2, float strokeW, float howTwisty)
{
  strokeWeight(strokeW);
 
  float numSections = 6;
  
  if(y2>=-80)
  numSections = 5;
  else
  numSections = 8;
  
  
  
  float cx = x2-x1; // change in x
  float cy = y2-y1; // change in y
  float nx1 = x1; // first x
  float ny1 = y1; // first y
  
  for (int i = 1; i <= numSections; i++) {
    float nx2 = x1 + i/numSections * cx+random(-3, 3); //add variation here
    float ny2 = y1 + i/numSections * cy+random(-3, 3); //and here
    line(nx1, ny1, nx2, ny2);
    nx1 = nx2;
    ny1 = ny2;
  }
}



