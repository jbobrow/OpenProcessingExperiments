
//ivy lin
//nick nally
//math, programming and art
//week 1 assignment
//25/01/11


float x;
int directionx;
float y;
int directiony;
float z;
int directionz;
float a;
int directiona;
float b;
int directionb;
float c;
int directionc;
float e;
int directione;
float f;
int directionf;


void setup(){
  size(600,500);
  background(255,255,255);
  smooth();
  frameRate(-900000);
  x=0;
  directionx=1;
  y=0;
  directiony=1;
  z=600;
  directionz=1;
  a=500;
  directiona=1;
  b=600;
  directionb=1;
  c=0;
  directionc=1;
  e=0;
  directione=1;
  f=500;
  directionf=1;
 //grid
  stroke(237,108,22,80);
  strokeWeight(10);
  line(0,100,100,0);
  line(0,100,500,600);
  line(100,0,600,500);
  line(600,500,500,600);
  line(0,300,300,0);
  line(0,500,500,0);
  line(0,700,700,0);
  line(0,900,900,0);
  line(0,300,300,600);

//part 2
//orange
  stroke(255,106,46);
  strokeWeight(40);
  line(0,300,300,600);
  stroke(232,177,155);
  strokeWeight(10);
  line(0,350,250,600);
  stroke(250,169,63);
  strokeWeight(10);
  line(0,330,270,600);
  stroke(155,69,19);
  strokeWeight(5);
  line(0,370,230,600);
  stroke(155,69,19);
  strokeWeight(5);
  line(0,280,320,600);
  stroke(250,198,129);
  strokeWeight(5);
  line(0,290,310,600);
  stroke(250,198,129);
  strokeWeight(5);
  line(0,380,220,600);
  //red
  stroke(157,25,25,95);
  strokeWeight(20);
  line(0,0,600,600);
  stroke(234,57,57,80);
  strokeWeight(5);
  line(0,5,595,600);
  stroke(232,54,137);
  strokeWeight(30);
  line(0,40,560,600);
  stroke(157,30,30,50);
  strokeWeight(25);
  line(0,50,550,600);
  stroke(232,63,86);
  strokeWeight(22);
  line(0,80,520,600);
  stroke(237,146,211,90);
  strokeWeight(5);
  line(0,65,535,600);
  stroke(172,86,198);
  strokeWeight(5);
  line(0,15,585,600);
  stroke(113,14,112,80);
  strokeWeight(5);
  line(0,60,540,600);
  stroke(250,174,212);
  strokeWeight(5);
  line(0,65,535,600);
  strokeWeight(50);
  line(0,-50,600,550);
  stroke(142,14,23);
  strokeWeight(5);
  line(0,-80,600,520);
  stroke(142,14,99);
  strokeWeight(10);
  line(0,-40,600,560);
  stroke(227,103,117);
  strokeWeight(15);
  line(0,-60,600,540);
  stroke(250,3,151);
  strokeWeight(10);
  line(0,0,600,600);
  //green
  stroke(33,124,15,80);
  strokeWeight(20);
  line(600,0,0,600);
  stroke(76,196,53);
  strokeWeight(20);
  line(580,0,0,580);
  stroke(23,80,12);
  strokeWeight(15);
  line(550,0,0,550);
  stroke(153,219,171);
  strokeWeight(30);
  line(520,0,0,520);
  stroke(71,147,21);
  strokeWeight(10);
  line(510,0,0,510);
  stroke(220,247,202);
  strokeWeight(10);
  line(500,0,0,500);
  stroke(79,224,162);
  strokeWeight(30);
  line(480,0,0,480);
  stroke(6,57,35);
  strokeWeight(10);
  line(455,0,0,455);
  stroke(92,126,84);
  strokeWeight(10);
  line(560,0,0,560);
  stroke(67,118,37);
  strokeWeight(10);
  line(445,0,0,445);
  //blue
  stroke(79,135,211,99);
  strokeWeight(100);
  line(0,170,430,600);
  stroke(8,53,113);
  strokeWeight(10);
  line(0,150,450,600);
  stroke(70,184,224);
  strokeWeight(20);
  line(0,180,420,600);
  stroke(33,130,232);
  strokeWeight(30);
  line(0,200,400,600);
  stroke(185,220,255);
  strokeWeight(10);
  line(0,240,360,600);
  stroke(26,126,137);
  strokeWeight(15);
  line(0,260,340,600);
  //brown
  stroke(155,79,3);
  strokeWeight(80);
  line(80,600,600,80);
  stroke(80,50,11);
  strokeWeight(50);
  line(100,600,600,100);
  stroke(196,165,125);
  strokeWeight(10);
  line(80,600,600,80);
  stroke(137,118,57);
  strokeWeight(25);
  line(120,600,600,120);
  stroke(88,81,57);
  strokeWeight(15);
  line(55,600,600,55);
  stroke(152,136,120);
  strokeWeight(10);
  line(140,600,600,140);
  stroke(234,142,50);
  strokeWeight(5);
  line(145,600,600,145);
  stroke(157,65,19);
  strokeWeight(15);
  line(160,600,600,160);
  stroke(229,122,83);
  strokeWeight(20);
  line(10,600,600,10);
  //yellow
  stroke(227,215,82);
  strokeWeight(30);
  line(110,0,600,490);
  stroke(228,240,80);
  strokeWeight(10);
  line(150,0,600,450);
  stroke(239,245,158,99.9);
  strokeWeight(50);
  line(160,0,600,440);
  stroke(255,226,0);
  strokeWeight(10);
  line(110,0,600,490);
  stroke(227,204,89);
  strokeWeight(30);
  line(160,0,600,440);
  stroke(252,209,48);
  strokeWeight(20);
  line(200,0,600,400);
  stroke(252,237,156);
  strokeWeight(10);
  line(210,0,600,390);
  stroke(162,143,93,99);
  strokeWeight(20);
  line(230,0,600,370);
  
  //part 1
  noStroke();
  fill(51,190,203,50);
  rect(0,0,10,400);
  rect(5,0,40,600);
  rect(40,0,15,300);
  rect(50,0,70,10);
  rect(80,0,70,225);
  rect(100,0,150,550);
  rect(200,0,70,450);
  rect(270,0,10,255);
  rect(277,0,50,570);
  rect(320,0,100,422);
  rect(400,0,50,333);
  rect(440,0,100,30);
  rect(520,0,40,600);
  rect(550,0,100,531);
  
  fill(250,174,245,50);
  rect(50,10,30,600);
  rect(70,210,30,600);
  rect(110,520,100,100);
  rect(255,230,40,600);
  rect(310,400,100,400);
  rect(400,300,30,600);
  rect(430,20,60,600);
  rect(500,10,10,600);
  rect(555,480,100,100);
  
  //part 3
  noStroke();
  fill(254,255,240,90);
  quad(280,0,600,320,600,0,280,0);
  fill(246,250,209,90);
  quad(300,0,600,300,600,0,300,0);
  quad(400,0,600,200,600,0,400,0);
  quad(450,0,600,150,600,0,450,0);
  fill(254,255,240);
  quad(500,0,600,100,600,0,500,0);
  
  //part 4
  fill(227,229,206);
  quad(600,600,500,600,600,500,600,600);
  fill(227,229,206,90);
  quad(600,600,450,600,600,450,600,600);
  quad(600,600,350,600,600,350,600,600);
  quad(600,600,430,600,600,430,600,600);
  
  //part 5
  fill(254,255,240);
  quad(0,600,100,600,0,500,0,600);
  fill(254,255,240,90);
  quad(0,600,200,600,0,400,0,600);
  quad(0,600,210,600,0,390,0,600);
  quad(0,600,130,600,0,470,0,600);
  
  //part 6
  
  fill(254,255,240,90);
  quad(0,0,0,600,50,600,50,0);
  quad(0,0,0,600,50,600,50,0);
  quad(50,0,600,0,600,50,50,50);
  quad(50,0,600,0,600,50,50,50);
  
  fill(255,255,255,95);
  noStroke();
  quad(0,0,600,0,600,500,0,500);

}

void draw(){
  x +=directionx;
  y +=directiony;
  z +=directionz;
  a +=directiona;
  b +=directionb;
  c +=directionc;
  e +=directione;
  f +=directionf;
  
  
  noStroke();
  fill(255,255,255,50);
  ellipse(x,y,10,10);
  fill(3,3,3,50);
  ellipse(z,a,10,10);
  fill(88,88,88,50);
  ellipse(b,c,10,10);
  fill(180,180,180);
  ellipse(e,f,10,10);
  println(x);
  if(x>width){
   directionx=-1;
  }
  if(x<0){
    directionx=1;
  }
  if(y<0){
    directiony=1;
  }
  if(y>height){
    directiony=-1;
  }
  if(a>height){
    directiona=-1;
  }
  if(a<0){
    directiona=1;
  }
  if(z<0){
    directionz=1;
  }
  if(z>width){
    directionz=-1;
  }
  if(b>width){
    directionb=-1;
  }
  if(b<0){
    directionb=1;
  }
  if(c<0){
    directionc=1;
  }
  if(c>height){
    directionc=-1;
  }
   if(e<0){
    directione=1;
  }
  if(e>width){
    directione=-1;
  }
   if(f<0){
    directionf=1;
  }
  if(f>height){
    directionf=-1;
  }
}


