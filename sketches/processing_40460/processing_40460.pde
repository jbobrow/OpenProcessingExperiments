
int circleSize=0;
int circleX =13;
int circleY =13;
float r;
float g;
float b;
float a;

float diam;
float x;
float y;


PImage bg;
void setup() {
  size(800,800);
  bg= loadImage ("cris.jpg");
image(bg,0,0);
  smooth();
}

void mousePressed () {
PImage c;
c = loadImage("fatcat.png");
imageMode(CENTER);
image(c,mouseX,mouseY,100,100);
}

void draw(){

  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
  
  diam=random(30);
  
  //hair
  beginShape();
fill(pmouseX+10,0,pmouseY+10);
stroke (0);
curveVertex(250,290);
curveVertex(230,250);
curveVertex(220,230);
curveVertex(250,175);
curveVertex(270,150);
curveVertex(300,100);
curveVertex(360,90);
curveVertex(420,100);
curveVertex(450,120);
curveVertex(500,200);
curveVertex(490,275);
curveVertex(475,310);
curveVertex(470,290);
curveVertex(465,240);
curveVertex(460,200);
curveVertex(450,175);
curveVertex(440,160);
curveVertex(430,160);
curveVertex(370,160);
curveVertex(260,140);
curveVertex(280,170);
curveVertex(280,200);
curveVertex(260,250);
curveVertex(260,300);
curveVertex(250,290);
endShape(CLOSE);
  
  //shirt
beginShape();
noFill();
stroke (0);
curveVertex(100, 800);
curveVertex(100, 600);
curveVertex(300, 475);
curveVertex(325, 540);
curveVertex(350,550);
endShape();

beginShape();
noFill();
stroke (0);
curveVertex(120, 630);
curveVertex(170, 640);
curveVertex(220, 740);
curveVertex(240, 800);
endShape();

beginShape();
curveVertex(425, 620);
curveVertex(460, 540);
curveVertex(475, 450);
curveVertex(700, 575);
curveVertex(775,800);
endShape();

beginShape();
noFill();
stroke (0);
curveVertex(170, 560);
curveVertex(130, 585);
curveVertex(100, 650);
curveVertex(70, 700);
curveVertex(90, 750);
endShape();

beginShape();
noFill();
stroke (0);
curveVertex(170, 560);
curveVertex(130, 585);
curveVertex(100, 650);
curveVertex(70, 700);
curveVertex(90, 750);
endShape();


ellipseMode(CENTER);
fill(r,g,b,a);
ellipse(320,280,diam,diam);
ellipse(420,280,diam,diam);

}

	






