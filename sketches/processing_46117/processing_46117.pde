
//yi-ting sie
//課程練習:noisy cicles
//隨機產生圓的邊緣線，呈現花朵的樣貌
//Sheng-Fen Nik Chien (2011), noisy circles, http://www.openprocessing.org/visuals/?visualID=44778

float radius = 20;   
float X = 200;   
float Y = 200;

void setup() { 
  size(400, 400);   
  background(0);   
  strokeWeight(3);   
  smooth();
  noLoop();
}  

void draw() {    
  background(0);  
  strokeWeight(3);
  float layer = random(25, 25); 
  for (int i=10; i<layer-1;i++) {
    radius = random(160);//範圍
    stroke(200, 40, 50);
    float x, y;   
    float noiseval = random(50);  
    float rrr, ttt, rad;  
    beginShape(); 

    fill(200, 120, 120, 50);  
    for (float ang=0; ang<=360; ang+=0.2) {   
      noiseval += 0.1; 
      rrr = 30*customNoiseB(noiseval);  
      ttt = radius+rrr;   
      rad = radians(ang);                                     
      x = X + (ttt * cos(rad));   
      y = Y + (ttt * sin(rad));   
      curveVertex(x, y);
    }  
    endShape();
  }
}  

float customNoise(float value) {  
  float rrr = pow(sin(value), 3);  
  return rrr;
}  
float customNoiseB(float value) {  
  int count = int(value%12);  
  float rrr = pow(sin(value), count);  
  return rrr;
}  

void mousePressed() {  
  saveFrame("noisy circle.jpg");
}


