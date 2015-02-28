
/*shamelessly stolen from mwachowski 
http://www.openprocessing.org/sketch/134305*/
float radius, t, cent, myCircleSize;
 
void setup() {
  background(255);
  size(300, 300);
  smooth();
  cent = (width+height)/40;
  myCircleSize = 2;

}

void draw(){
 strokeWeight(0.01);
 noFill();
 pushMatrix();
 scale(10);
 for (int n = 1; n<380; n++){
    radius = sqrt(n);
    t = 137.5 * (PI/180) * n;
    colorMode(HSB);
    stroke(346,35,60);
    ellipse(radius*cos(t)+cent, radius*sin(t)+cent, myCircleSize, myCircleSize);  
    myCircleSize = myCircleSize + 0.1;
    
  }
 popMatrix();   
}
