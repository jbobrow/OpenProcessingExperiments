
float backran;
float backran2;
int scratchran;

int b=150;
int c=200;
int a=300;

int value1=250;
int value2=500;
int value3=255;
int value4=5;
int value0=0;

float r=random(1,500);
float f=random(1,300);


void setup() {
  size(400,700);
  frameRate(10);
  smooth();
}

void draw() {
  
  
  backran=random(1,255);
  backran2=random(1,50);
  background(backran2,0,backran);
  scratchran= int (random(1,20));
  strokeWeight(scratchran);
  stroke(54,252,78);
  line(pmouseX ,pmouseY ,mouseX ,mouseY );
  line(pmouseX+100 ,pmouseY+100 ,mouseX+100 ,mouseY+100 );
  line(pmouseX+50 ,pmouseY+50 ,mouseX+50 ,mouseY+50 );
  line(pmouseX+150 ,pmouseY+150 ,mouseX+150 ,mouseY+150 );
  line(pmouseX+200 ,pmouseY+200 ,mouseX+200 ,mouseY+200 );
  line(pmouseX+250 ,pmouseY+250 ,mouseX+250 ,mouseY+250 );
  line(pmouseX+300 ,pmouseY+300 ,mouseX+300 ,mouseY+300 );
  line(pmouseX-50 ,pmouseY-50 ,mouseX-50 ,mouseY-50 );
  noStroke();
  a=a+1;
  b=b-1;
  c=c+30;
  fill(236,252,217);
  ellipse(300,100,400,a);
  fill(251,217,252,20);
  ellipse(300,150,415,c);
  fill(175,244,255,50);
  ellipse(350,200,c,450);
  rectMode(CENTER);
  rect(100,200,mouseX,300);
  fill(175,244,mouseY,30);
  rect(100,250,mouseX,250);
  
  PImage bg;
 
bg = loadImage("enhanced-buzz-5810-1310407963-35.jpg");
 
image(bg,0,500, mouseY,200);
fill(0);
value1=value1+1;
ellipse(300,value1,100,100);
value2=value2+20;
value3=value3+3;
ellipse(200,50,50,value3);
fill(240,8,0,175);
strokeWeight(abs( mouseX - pmouseX ));
stroke(0,255,99);
value4=value4-1;
arc(300,100,800,800,4,mouseX-300);
fill(40,8,100,175);
arc(300,300,500,500,4,mouseX-350);
arc(300,100,750,750,4,mouseX-200);
fill(134,87,mouseY);
noStroke();
ellipseMode(CENTER);
ellipse(300,250,mouseX,50);

stroke(246,255,0);
line(pmouseX ,pmouseY ,mouseX ,mouseY );
}

void mousePressed() {
  strokeWeight(20);
  rectMode(CENTER);
  fill(0);
  rect(mouseX,mouseY,30,40);
  rect(mouseX+200,mouseY+200,200,50);
  fill(240,148,0);
  ellipse(mouseX-100,mouseY-100,50,500);
  
 }

