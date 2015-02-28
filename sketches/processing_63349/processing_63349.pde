
int x, y;
 float radius = 100.0; //처음시작할때의 전체 반지름 
float z =10;
 int value=0;
 
void setup()
 {
 size(500, 500);
 frameRate(10);
 smooth();
 }
 
void draw()
 { 

background(255);
 
//꽃 줄기
strokeWeight(5);
 stroke(0, 255, 0);
 line(width/2, height/2-50, width/2, height);
 
translate(width/2, height/2-50); // 꽃의 중심위치
 
//꽃 그리기
stroke(255, random(150, 180), random(0, 10), 10);
 strokeWeight(5);
 noFill();
 for (int i = 0; i<360*10; i+=10)
 {
 float angle = radians(i);
 float x=0+(cos(angle)* radius/2);
 float y=0+(sin(angle) * radius/2);
 
ellipse(x, y, z, z);
 ellipse(x/1.5, y/1.5, 50, 50);
 ellipse(x/2, y/2, z, z);
 ellipse(x/3, y/3, z, z);
 }
 radius = radius+3;
 z-=2;
 
//전체 반지름이 계속커지는 것을 방지
if (radius>280)
 {
 radius-=50;
 z=5.0;
 }
 }
 


