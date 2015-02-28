
//yi-ting sie
//課程練習 noisy spiral
//隨機的線條好像小朋友亂畫一般
//Sheng-Fen Nik Chien (2011), rational circles, http://www.openprocessing.org/visuals/?visualID=44622
//Sheng-Fen Nik Chien (2011), Randomness & Noise, 

void setup() {  
  size(500, 400);   
  background(255);   
  strokeWeight(1);   
  smooth();
  noLoop();
}  

void draw() {  
  
  // refresh  
  background(255);  
  
  // set the radius and center point  
  float radius = 500; //半徑  
  int centX = 250;   
  int centY = 200;   

  // draw the circle in steps  
  stroke(220, 50, 255, 60); 
  radius=10;  
  float x, y;   
  float lastx = -999;   
  float lasty = -999; 
  float radiusNoise = random(4); 
  
  for (float ang=0; ang<=360*5; ang+=4) {//angle角度
    radiusNoise +=0.1;//噪音半徑
    radius+=0.5;//半徑
    float thisRadius = radius + (noise(radiusNoise)*100) - 100; //noise噪音
    float rad = radians(ang);                                     
    x = centX + (thisRadius * cos(rad));   
    y = centY + (thisRadius * sin(rad)); 
    
    if (lastx>-999) {
      line(x, y, lastx, lasty);
      stroke(250, 130, 100);  
      strokeWeight(1); 
   
      fill(250,50,100); 
      line(x, y, centX, centY);
      
     
    }
    lastx=x;
    lasty=y;
  }
}  


void mousePressed() {  
  saveFrame("noisy spiral.png");
}


