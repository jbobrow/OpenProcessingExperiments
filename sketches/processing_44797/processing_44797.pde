
//yi-ting sie
//課程練習 circle
//用點構成螺旋的圓
//Sheng-Fen Nik Chien (2011), rational circles, http://www.openprocessing.org/visuals/?visualID=44622

void setup() {  
  size(500, 300);   
  background(255);   
  strokeWeight(5);   
  smooth();
}  

void draw() {  
  // refresh  
  background(255);  
  
  // set the radius and center point  
  float radius = 100;   
  int centX = 250;   
  int centY = 150;   
  
  // draw the circle the easy way  
  stroke(0, 30);   
  noFill();   
  //ellipse(centX, centY, radius*2, radius*2); 
  
  // draw the circle in steps  
  stroke(120, 50, 70); 
radius=5;  

  float x, y;   
  float lastx = -999;   
  float lasty = -999;   
  for (float ang=0; ang<=360*10; ang+=40) {
// ang<=360*10在說明六圈
//ang+=40在說明40度


    radius+=1; 
    float rad = radians(ang);                                     
    x = centX + (radius * cos(rad));   
    y = centY + (radius * sin(rad)); 
  if(lastx>-999){
    line(x,y,lastx,lasty);
  }
lastx=x;
lasty=y;
  }
}  

void mousePressed() {  
  saveFrame("circle1.png");
}

