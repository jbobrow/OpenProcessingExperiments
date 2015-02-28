
float radius =2;

int centX;

int centY;

float noiseval = random(200);

float radVariance, thisRadius, rad;

float x,y;



void setup(){

  size(800,600);
  background(255);
 
 
  smooth();

 
 stroke(100,50,70);
strokeWeight( 0.1);
frameRate(12);
}

void draw(){
  
  if  (mousePressed){
beginShape();
//fill(thisRadius,random(70,250),random(100,250),70);
fill(thisRadius,random(80),random(100),70);
stroke(thisRadius,random(80,180),random(100,250),70);
//stroke(255);
//stroke(thisRadius,random(70,250),random(100,250),70);

for( float ang=0; ang<=360;ang+=1){
  
  
  
   radVariance=20*(mouseY/50)*customNoise(noiseval);
   
  thisRadius = radius + radVariance;

  noiseval +=0.72;
  
 

  rad=radians(ang);
  
 x = mouseX + (thisRadius * cos(rad)); 
 y = mouseY + (thisRadius * sin(rad));
curveVertex(x,y);

}
endShape();
}


}


float customNoise(float value) { 
  float retValue = pow(cos(sqrt(pow (sin(value),3))),random(1,8));
 return retValue;
}



 

void keyPressed(){
if (keyCode==32) {
saveFrame("periodicNoise-#####.jpg");
}
}

