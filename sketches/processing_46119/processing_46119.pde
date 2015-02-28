
//yi-ting sie
//回家作業：Flowering Flowers
//畫面會隨著每次視窗開啟，呈現由線條所構成的花朵。
//Sheng-Fen Nik Chien (2011), flowers, http://www.openprocessing.org/visuals/?visualID=44803.


void setup() {  
  size(400, 400);     
  smooth();  
  background(200, 255, 250, 250);
}  

float counter =35;//flower counter花朵計數器

void draw() {    
  if (counter > 100) {
  }
  delay(200);   
  drawSpiral();//畫螺旋
}  

//畫螺旋
void drawSpiral () {   
  float x, y;  
  
  float centX = random(width)*2;   
  float centY = random(height)*2;  
  
  float lastx = -999;   
  float lasty = -999;  
  
  float radiusNoise = random(50); //半徑噪音  
  float radius = 10;  
  float startangle = random(180);                                     
  float endangle =  (360*4) +random(720);                              
  float anglestep = 10+random(45);  

  stroke(random(255), random(255), random(255), 50);  
  strokeWeight(random(35)); 

  for (float ang = startangle; ang <= endangle; ang += anglestep) {   
    radiusNoise += 0.1;   
    radius += 0.1; 
    
    float thisRadius = radius + (noise(radiusNoise) * 100);   
    float rad = radians(ang);  
    
    x = centX + (thisRadius * cos(rad))*1.3;   
    y = centY + (thisRadius * sin(rad))*1.3;  
    
    if (lastx > -999) {   
      line(x, y, 1.2*lastx, 1.2*lasty);
    }  
    
    lastx = x;   
    lasty = y;
  }
}  


void mousePressed() {  
  saveFrame("Flowering Flowers.jpg");
} 


