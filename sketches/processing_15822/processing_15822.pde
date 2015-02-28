
int B1 = 255;
void setup(){
size(600,600);
background(B1);
smooth();
noStroke();
}


void draw(){
  
//background strim
int a = 20;

int b = 10;
int c = 400;
int d = 20;
int e = 410;
int f = 420;
int radius1 = 100;
int F1 = 255;
int F2 = 255;
int F3 = 255;
int radius = 20;
int x = 128;
int y = 50;

fill(127);
quad(10,400,20,410,10,420,0,410);
quad(10+a,400,20+a,410,10+a,420,a,410);
quad(10,400+a,20,410+a,10,420+a,0,410+a);
quad(10,400+2*a,20,410+2*a,10,420+2*a,0,410+2*a);
quad(10,400+3*a,20,410+3*a,10,420+3*a,0,410+3*a);
quad(10,400+4*a,20,410+4*a,10,420+4*a,0,410+4*a);
quad(10,400+5*a,20,410+5*a,10,420+5*a,0,410+5*a);
quad(10,400+6*a,20,410+6*a,10,420+6*a,0,410+6*a);
quad(10,400+7*a,20,410+7*a,10,420+7*a,0,410+7*a);
quad(10,400+8*a,20,410+8*a,10,420+8*a,0,410+8*a);
quad(10,400+9*a,20,410+9*a,10,420+9*a,0,410+9*a);
//quad(10,400+ax,20,410+ax,10,420+ax,0,410+ax);

//
quad(10+a,400+4*a,20+a,410+4*a,10+a,420+4*a,a,410+4*a);
quad(10+2*a,400+5*a,20+2*a,410+5*a,10+2*a,420+5*a,2*a,410+5*a);
quad(b+2*a,c+8*a,d+2*a,e+8*a,b+2*a,f+8*a,2*a,e+8*a);
quad(b+2*a,c+9*a,d+2*a,e+9*a,b+2*a,f+9*a,2*a,e+9*a);
quad(b+3*a,c+9*a,d+3*a,e+9*a,b+3*a,f+9*a,3*a,e+9*a);
quad(b+a,c+5*a,d+a,e+5*a,b+a,f+5*a,a,e+5*a);
quad(b+a,c+6*a,d+a,e+6*a,b+a,f+6*a,a,e+6*a);
quad(b+a,c+7*a,d+a,e+7*a,b+a,f+7*a,a,e+7*a);
quad(b+a,c+8*a,d+a,e+8*a,b+a,f+8*a,a,e+8*a);
quad(b+a,c+9*a,d+a,e+9*a,b+a,f+9*a,a,e+9*a);
//
quad(b+7*a,c,d+7*a,e,b+7*a,f,7*a,e);
quad(b+8*a,c,d+8*a,e,b+8*a,f,8*a,e);
quad(b+7*a,c+a,d+7*a,e+a,b+7*a,f+a,7*a,e+a);
quad(b+6*a,c+a,d+6*a,e+a,b+6*a,f+a,6*a,e+a);
quad(b+7*a,c+2*a,d+7*a,e+2*a,b+7*a,f+2*a,7*a,e+2*a);
quad(b+8*a,c+2*a,d+8*a,e+2*a,b+8*a,f+2*a,8*a,e+2*a);

//outline
fill(0);
rect(100,20,20,20);
rect(80,40,20,60);
rect(100,120,40,40);
rect(100,100,20,20);
rect(80,160,60,120);
rect(60,200,20,20);
rect(140,200,20,20);
rect(60,240,60,120);
rect(40,260,20,60);
rect(80,340,60,40);
rect(140,320,20,20);
rect(40,380,80,120);
rect(20,420,20,60);
rect(120,400,20,20);
rect(60,440,80,140);
rect(80,460,180,140);
rect(40,520,20,40);
rect(180,400,60,60);
rect(160,420,20,20);
rect(160,360,40,40);
rect(180,320,20,40);
rect(200,380,20,20);
rect(240,420,20,40);
rect(260,440,20,20);
rect(280,420,20,20);
rect(260,500,40,60);
rect(300,480,20,20);
rect(260,560,20,40);

//rightside junk

rect(460,360,20,20);
rect(480,340,40,40);
rect(500,320,40,20);
rect(540,300,60,40);

// rounds
stroke(127);
fill(x);
bezier(60,0,60,40,0,40,0,0);
ellipse(130,10,20,20);
ellipse(150,50,60,60);
ellipse(240,20,40,40);
ellipse(270,50,20,20);
ellipse(220,180,40,40);
ellipse(250,290,100,100);
ellipse(380,40,40,40);
ellipse(420,100,40,40);
ellipse(520,80,120,120);
noFill();

//line
strokeWeight(2);
line(0,400,40,400);
line(220,400,280,400);

beginShape();
vertex(280,400);
vertex(280,380);
vertex(320,380);
vertex(320,400);
vertex(340,400);
vertex(340,380);
vertex(360,380);
vertex(360,320);
vertex(380,320);
vertex(380,340);
vertex(500,340);
endShape();

//extra positon
stroke(127);
strokeWeight(4);
fill(127);
rect(360,320,20,120);
rect(340,440,40,40);
rect(380,340,40,60);
rect(420,340,40,40);
rect(460,340,20,20);
rect(380,440,40,20);
rect(380,460,20,80);
rect(340,540,160,60);
rect(300,580,40,20);
rect(420,500,40,40);
rect(460,520,40,20);

//round point
fill(200);
bezier(40,0,40,16,20,16,20,0);
ellipse(130,10,10,10);
ellipse(150,50,30,30);
ellipse(240,20,15,15);
ellipse(270,50,5,5);
ellipse(220,180,10,10);
ellipse(250,290,50,50);
ellipse(380,40,20,20);
ellipse(420,100,15,15);
ellipse(520,80,60,60);

fill(255);

point(80,280);
point(80,340);
point(60,440);
point(80,460);
point(120,500);
point(140,580);
point(240,460);
point(260,560);

// set the functions.
//first ellipce
//250,290 위치의 원 마우스 타게팅 시 주변 휘광 생성
noStroke();
float dis1 = dist(250,290, mouseX, mouseY);
if(dis1 < radius1){
  F1 =- 65;
  F2 =- 35;
  F3 =- 5;
  fill(255);
}else{
  fill(127,50);
  ellipse(250,290,100,100);
}
//
noStroke();
  fill(F1);
  ellipse(250,290,radius1+15,radius1+15);
  fill(F2);
  ellipse(250,290,radius1+5,radius1+5);
  fill(F3);
  ellipse(250,290,radius1-10,radius1-10);
  //

//250.290 위치의 원 색상 변화 -> 지속 변화(클릭유도)

  float dis2 = dist(250,290, mouseX, mouseY);
  if (dis2 < radius1){
    fill(255);
    radius1 ++;
  } else {
    fill(mouseX,mouseY,mouseX/10);
  }
ellipse(250,290, radius1, radius1);

int s = 0;
//동일 위치의 원 클릭시 520, 80 위치의 원 빛남
if (mousePressed && (dis2 < radius1)){
  x =-128;
  y =+ 10;
  s =+ 1;
}
stroke(125,50);
strokeWeight(s);
line(mouseX,mouseY,520,80);
fill(x);
ellipse(520,80,120,120);
fill(y);
ellipse(520,80,60,60);

//520, 80 원 클릭시 전체 색상 반전
float dis3 = dist(520,80,mouseX,mouseY);
if (dis3 < 120){
  x = 255;
  y = 50;
}else if (mousePressed && (dis3 < 60)){
  filter(INVERT);
  //failed
}
//전체 색상의 함수값을 지정, 변형을 시키는 방법.

//마우스 포인터 레이더 회전 stroke
int xx = 0;
int yy = 0;
if (xx < width && yy == 0){xx =+ 20;
}else{xx = 0;}


line (mouseX,mouseY,xx,yy);
//x의 좌표값을 20씩 증가시키다가 600이 되면 20씩 감소시키고
//0에 도달하면 다시 20씩 증가시키는... 그런 공식을 만들어야 될거 같습니다.
//faild

}


