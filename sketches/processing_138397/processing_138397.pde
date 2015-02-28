
/*shamelessly stolen from mwachowski and from Laura Rodriguez
//Rafa Salcedo 
http://www.openprocessing.org/sketch/134305*/

float radius, t, cent, myCircleSize;
  
void setup() {
  background(0);
  size(1000, 600);
  smooth();
  cent = (width+height)/90;
  myCircleSize = 2;
 
}
 
void draw(){
 strokeWeight(0.02);
 noFill();
 pushMatrix();
 scale(10);
 for (int n = 1; n<380; n++){
    radius = sqrt(n);
    t = 167.5 * (PI/380) * n;
    colorMode(HSB);
    stroke(245,191,255);
    ellipse(radius*cos(t)+cent, radius*sin(t)+cent, myCircleSize, myCircleSize); 
    myCircleSize = myCircleSize + 0.1;
     
  }
 popMatrix();

pushMatrix();
 scale(10);
 for (int n = 1; n<380; n++){
    radius = sqrt(n);
    t = 167.5 * (PI/180) * n;
    colorMode(HSB);
    stroke(133,107,138);
    ellipse(radius*cos(t)+cent, radius*sin(t)+cent, myCircleSize, myCircleSize); 
    myCircleSize = myCircleSize + 0.1;
     
  }
 popMatrix(); 
}

