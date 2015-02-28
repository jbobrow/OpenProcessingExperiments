
//yi-ting sie
//回家作業:Green, Green Grass of Home
//本次創作是以撲克牌的形式為主，在每次開啟視窗時，上方的雨水與下方的綠草可以隨意變換，並可自行使用滑鼠添加綠草於畫面中。
//Sheng-Fen Nik Chien (2011), a row of grasses, http://www.openprocessing.org/visuals/?visualID=44045
//Hsu Hao=Po (2011), Cherish our Green Green Grass of Home, http://www.openprocessing.org/visuals/?visualID=44647 

float ystep =20; 
float borders=15;  //邊界
float z = 100;  
float q = 120; //雨的位置  

float xstep =10; 
float border=0;  //邊界
float x = 100;  
float y = 400; //草根部的位置

void setup() {  
size(300, 400);  
background(255);  
smooth();  
frameRate(10); 

// 上方的雨 
stroke(46,49,146,150);  
strokeWeight(1);  
for (z=borders; z<=width-borders; z+=ystep) {  
float tipy = q -30 - random(10);  
float tipx = z + random(50); 
line(z, q, tipx, tipy);
  }

//藍天
noStroke();
fill(41,171,226,70);
ellipse(200,30,245,170);

fill(182,182,224);
ellipse(255,50,245,80);
ellipse(50,25,245,100);
ellipse(120,80,140,50);

fill(0,113,188,80);
ellipse(250,20,145,70);
ellipse(50,70,135,50);

//綠地
fill(57,181,74,80);
ellipse(50,360,245,170);
ellipse(250,350,230,120);

fill(180,211,129);
ellipse(90,370,245,170);
ellipse(250,360,230,100);

fill(140,198,63);
ellipse(20,400,205,80);

// 下方的草 
stroke(57,181,74);  
strokeWeight(3);  
for (x=border; x<=width-border; x+=xstep) {  
float tipy = y - 20-random(10);  
float tipx = x + random(20);  
line(x, y, tipx, tipy);
 } 
  
//左上右下的白房子
noStroke();
fill(255);
triangle(30,30,45.25,12.393,60.067,30);
rect(30,30,30,30); 
triangle(255.5,387.607,240.684,369.75,270.316,369.75);
rect(240.684,340,30,30); 

//中間的房子
noStroke();
fill(200);
triangle(125.477,217.666,150.785,187.815,175.447,217.666);
rect(125.477,217,50,50); 
}

void draw() { 
  
if (mousePressed == true) {  
manygrasses();  
}
}

void manygrasses() {  
  float step =random(2);  
  float stepx=random(mouseY)/30;  
  float aaa=random(1)+2; 
  
  float x=mouseX;  
  float y=mouseY;
  
  float tipx=x + random(1) ;  
  float tipy=y -random(1)-mouseY/10; 
  
    stroke(57,181,74);  
    strokeWeight(aaa);  
  line(x+step, y-step, tipx+stepx, tipy-step);  

}  

void keyPressed() {  
  saveFrame("Green Green Gress of Home001_###.png");
} 

