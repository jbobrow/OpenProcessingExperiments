
/**
 // Assignment -Algorithmic Tree
 // In this assignment you should create a Algorithmic Tree that utilizes recursive methods.\
 // author-Lee Shan-Yu 
 // reference-Processing tutorial: tree, Simple tree by Jean-no
 // 主題-雲霧中的樹群
 // 操作說明-利用滑鼠決定第一位置 並利用遞迴及random範圍 使碎形(分支長短顏色)產生變化
 // 問題-不知如何將array用於此設計的manage information
 */
 
float a;   

void setup(){ 
  size(600,500); 
  smooth();
  background(255); 
  frameRate(30); 
//  fill(255,10);  //透明度 漸漸覆蓋消失
} 

void draw(){ 
 rect(0,0,width,height); 
 fill(255,10);//透明度 漸漸覆蓋消失
} 

// float[][] myPoints = new float[][];

void branch(float x, float y, float s, float a){ 
  strokeWeight(s*0.1); //樹幹粗細變化量
  float newx = x+cos(a)*s; //newx絕對位置以原有+相對長 a角度(新點)
  float newy = y+sin(a)*s; //newy絕對位置以原有+相對長
  line(x,y,newx,newy); //定線的起始位置
  
  if(s>1){ 
  branch(newx, newy, s*(random(0.5,0.7)), a-radians(random(10,15))); //樹 左向分支 s,a變量
  branch(newx, newy, s*(random(0.5,0.7)), a+radians(random(10,15))); //樹 右向分支
  } 
} 

void mousePressed(){ 
  stroke(random(0,20),random(200,255),random(100,120)); //顏色範圍界定 使確定為G色
  branch(mouseX, height, height-mouseY, radians(270)); //滑鼠按下去點為第一線的終點(高) 角度270,重直GL
} 




