
//based on code by Daniel Shiffman

float startTheta = 0;
float thetaVel = .25;
float amplitude = 100;
float startVal = 400;
float valVel = .25;

void setup() {
  size(400,400);
  smooth();
}

void draw() {
  background(255);

  startTheta += 0.02;
  float theta = startTheta;
  


for (int y2 = 0; y2<= height; y2+=20){
  
 for (int x2 = 0; x2 <= width; x2 +=20) {
   
   
    //float y = map(sin(theta),-1,1,0,height);
    //float x = map(cos(theta),-1,1,0,width);
    float x = amplitude * cos(theta);
    float y = amplitude * sin(theta);  
    stroke(0);
  
    line(x2,y2, x,y);
   
    theta += thetaVel;
  } 
  
  
  
}

/*
if (startVal>=5){
startVal-=valVel;

}

else 
  startVal=400;
*/
}




