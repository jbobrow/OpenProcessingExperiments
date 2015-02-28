
//2013.10.30 InclassPractice
//TePangChiang
//move mouse to change color

int counter = 0;
float s = second;

void setup() {
size(500, 300);
background(255);
frameRate(2);
Clear();

}

void draw() {
  
if (counter > 10) {
    Clear();
    counter = 0;
  }  
 
 DrawFlower(); 
 counter++;
 scale(random(0.3,0.8));
 DrawFlower();
  counter++;

}

void DrawFlower(){
  strokeWeight(3);
  float radius = 80;
  int centX = mouseX;
  int centY = mouseY;

 stroke(20, mouseX*0.8, mouseY*0.8,random(50,100));
  float x, y;
  float noiseval = random(10);
  float radVariance, thisRadius, rad;
 beginShape();
 fill(20, mouseX*0.5, mouseY*0.5, random(30,80));
  for (float ang=0; ang<=360; ang+=1) {
  noiseval += 0.3;
  radVariance=60*customNoise(noiseval);
  thisRadius = radius+radVariance;
  rad = radians(ang);
  x = centX + (thisRadius * cos(rad));
  y = centY + (thisRadius * sin(rad));
  curveVertex(x,y);
}
 endShape();
}

void Clear() {
  background(61);
}

float customNoise(float value) {
float retValue=pow(sin(value),3);
return retValue;
}


