
//yi-ting sie
//課堂練習
//視窗中的線條，會隨著每次開啟時，呈現不同的擺動
//Sheng-Fen Nik Chien (2011), a row of grasses, http://www.openprocessing.org/visuals/?visualID=44045
//Dominik Schmid (2011) ,Gradient Template, http://www.openprocessing.org/visuals/?visualID=23529


void setup() {  
  size(300, 300);  
  background(255);  
  smooth();  
  noLoop();
}  

void draw() {  
  float xstep =10;  //步驟
  float border=50;  //邊界
  float x = 100;  
  float y = 150; //草根部的位置    

  // 畫草 
  stroke(RGB,TWO_PI, 90, 89);  
  strokeWeight(3);  
  for (x=border; x<=width-border; x+=xstep) {  
    float tipy = y - 20 - random(40);  
    float tipx = x + random(20) - 10;  
    line(x, y*1.5, tipx, tipy);
  }
  
  stroke(RGB,200, 150,100);  
  strokeWeight(6);  
  for (x=border; x<=width-border; x+=xstep) {  
    float tipy = y -10 - random(5);  
    float tipx = x + random(50) - 10;  
    line(x, 1.5*y, tipx, tipy);
  }
  
}  

void mousePressed() {  
  saveFrame("grass_###.png");
} 

