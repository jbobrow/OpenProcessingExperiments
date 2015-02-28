
//yi-ting sie
//課程練習:草的變化
//視窗中的線條，會隨著每次開啟時，呈現不同的擺動
//Sheng-Fen Nik Chien (2011), a row of grasses, http://www.openprocessing.org/visuals/?visualID=44045

void setup() {  
  size(500, 500);  
  background(255);  
  smooth();  
  noLoop();
}  

void draw() { 

  float xstep1 = 5;//第一排點的間距
  float xstep2 = 15;//第二排點的間距
  float border = 50;//左右邊框距離
  float x = 50; //X軸位置
  float y1 = 100;//第一排Y軸位置 
  float y2 = 150;//第二排Y軸位置
  float y3 = 200;//第三排Y軸位置
  float y4 = 330;//第四排Y軸位置
  float y5 =random(400,height-border);//第五排Y軸位置
  float y6 =random(420,height-border);//第五排Y軸位置
  float y7 =random(440,height-border);//第五排Y軸位置
  float y8 =random(460,height-border);//第五排Y軸位置

  stroke(255,100,50); 

  // draw grass positions畫第一排點   
  for (x=border; x<=width-border; x+=xstep1) {  
    point(x, y1);
  }  

  // draw grasses畫第一排草
  stroke(220, 120, 50);  
  strokeWeight(1);  
  for (x=border; x<=width-border; x+=xstep1) {  
    float tipx1 = x-10 + random(20);
    float tipy1 = y1-10- random(40);    
    line(x, y1, tipx1, tipy1);
  }  

  // draw grass positions畫第二排點
  for (x=border; x<=width-border; x+=xstep2) {  
    point(x, y2);
  }  

  // draw grasses畫第二排草
  stroke(220, 120, 50);  
  strokeWeight(1);  
  for (x=border; x<=width-border; x+=xstep2) {  
    float tipx2 = x+random(10);
    float tipy2 = y2-random(20);    
    line(x, y2, tipx2, tipy2);
  }  

  // draw grass positions畫第三排點
  for (x=border; x<=width-border; x+=xstep1) {  
    point(x, y3);
  }  

  // draw grasses畫第三排草
  stroke(220, 120, 50);  
  strokeWeight(1);  
  for (x=border; x<=width-border; x+=xstep1) {  
    float tipx3 = x-5+random(-20,40);
    float tipy3 = y3-5-random(-40,20);
    line(x, y3, tipx3, tipy3);
  }
  
   // draw grass positions畫第四排點
  for (x=border; x<=width-border; x+=xstep1) {  
    point(x, y4);
  }  

  // draw grasses畫第四排草
  stroke(220, 120, 50);  
  strokeWeight(1);  
  for (x=border; x<=width-border; x+=xstep1) {  
    float tipx4 = x;
    float tipy4 = y4-random(30);
    float tipx41 = x+random(20);
    float tipy41 = y4-random(70);
    line(x, y4, tipx4, tipy4);
    line(tipx4, tipy4, tipx41, tipy41);
  }
  
    // draw grass positions畫第五排點
  for (x=border; x<=width-border; x+=xstep1) {  
    point(x, y5);
     point(x, y6);
      point(x, y7);
       point(x, y8);
  }  

  // draw grasses畫第五排草
  stroke(220, 120, 50);  
  strokeWeight(1);  
  for (x=border; x<=width-border; x+=xstep1) {  
    float tipx5 = x+random(20);
    float tipy5 = y5-random(50);
    float tipx6 = x+random(30);
    float tipy6 = y6-random(60);
    float tipx7 = x+random(60);
    float tipy7 = y7-random(50);
    float tipx8 = x+random(40);
    float tipy8 = y8-random(40);
    line(x, y5, tipx5, tipy5);
    line(x, y6, tipx6, tipy6);
    line(x, y7, tipx7, tipy7);
    line(x, y8, tipx8, tipy8);
  }
  
}  



void keyPressed() {  
 saveFrame("grow grass.jpg");  
 }

