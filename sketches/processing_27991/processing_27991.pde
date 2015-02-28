
import processing.opengl.*;
int count=90;
int m=1;
float Size;
int []sec= 
{
  0,1,2,3,4,5,6,7,8,9,
  10,11,12,13,14,15,16,17,18,19,
  20,21,22,23,24,25,26,27,28,29,
  30,31,32,33,34,35,36,37,38,39,
  40,41,42,43,44,45,46,47,48,49,
  50,51,52,53,54,55,56,57,58,59
};
float []x=new float[220];
float []y=new float[220];
float []Dx=new float[220];
float []Dy=new float[220];

PFont myfont;
PImage circle;

float rot;

void setup() {
  size(700,800);
  smooth();
  frameRate(30);
  imageMode(CENTER);

  myfont  = loadFont("Calibri-13.vlw");
  circle = loadImage("circle-01.png");
  for(int lop=0; lop<110;lop++) {

    Dx[lop]=350+random(-250,250);
    Dy[lop]=400+random(-250,250);
    x[lop]=random(700);
    y[lop]=random(800);
  }
}

void draw() {
  background(0);

  Size=random(20,22);


  for(int lop=0; lop<99;lop++) {

    strokeWeight(random(1,8));
    stroke(150,150,random(255),10);
    //stroke(random(255),random(255),random(255),80);
    line(Dx[lop],Dy[lop],width/2,height/2);
    line(Dx[lop+2],Dy[lop+4],width/2,height/2);
    line(Dx[lop+2],Dy[lop+4],width/2,height/2);
    line(Dx[lop+3],Dy[lop+3],width/2,height/2);
        strokeWeight(random(5,8));
            stroke(150,150,random(255),30);
    line(x[lop],y[lop],x[lop],y[lop]);
  }


  strokeWeight(5);
  fill(255,10);
  ellipse(width/2,height/2,600,600);
  
  pushMatrix();
  translate(350, 400); 
  rotate(rot);
  imageMode(CENTER);
  rot=rot+0.01;

  image(circle,0,0,700,800);
  popMatrix();
  
  noStroke();
  fill(123,104,238,30);
  ellipse(width/2,height/2,second()*10,second()*10);
  ellipse(50,750,Size,Size);
  
  text("Sec",50,780);
  
  fill(106,90,205,50);
  ellipse(width/2,height/2,minute()*10,minute()*10);
  ellipse(350,750,Size,Size);
    text("Min",350,780);
  
  fill(240,230,140,30);
  ellipse(350,750,Size,Size);
  ellipse(width/2,height/2,hour()*25,hour()*25);
  ellipse(650,750,Size,Size);
    text("Hour",650,780);


  fill(255,180);
  textSize(24);
  textAlign(CENTER,CENTER);


  //text(hour()+":"+minute()+":"+second(),300,10);
}


