
//Assignment #2
//Brenna Lash
//blash@brynmawr.edu
//Sept. 16 2010

float x,w,y,h,a,b,c,d,r1,r2,r3,r4,r5,r6,r7;

float speed=1;
float gravity=.1;


void setup() {

  size(600,600);
  smooth();

  x=300;
  y=100;
  w=100;
  h=100;

  a=100;
  b=50;
  c=100;
  d=100;

  r1=random(50,400);
  r2=random(50,400);
  r3=random(50,400);
  r4=random(50,400);
  r5=random(50,400);
  r6=random(50,400);
  r7=random(50,400);
  
  
}

void draw() {

  background(55,75,108);

  //lightning bolt
  noStroke();
  fill(242,258,6);

  beginShape();
  vertex(x,y);
  vertex(x+.5*w,y);
  vertex(x+.25*w,y+.45*h);
  vertex(x+.4*w,y+.45*h);
  vertex(x+.25*w,y+.8*h);
  vertex(x+.4*w,y+.8*h);
  vertex(x-.2*w,y+1.5*h);
  vertex(x-.15*w,y+.9*h);
  vertex(x-.3*w,y+.9*h);
  vertex(x-.15*w,y+.55*h);
  vertex(x-.3*w,y+.55*h);
  vertex(x,y);
  endShape(CLOSE);

  //rain drops

  noStroke();
  fill(90,196,222);

  beginShape();
  curveVertex(a+r1,b);
  curveVertex(a+r1,b+.05*d);
  curveVertex(a+r1+.04*c,b+.1*d);
  curveVertex(a+r1+.03*c,b+.15*d);
  curveVertex(a+r1-.03*c,b+.15*d);
  curveVertex(a+r1-.04*c,b+.1*d);
  curveVertex(a+r1+.04*c,b);
  endShape(CLOSE);

  beginShape();
  curveVertex(a+r2,b-20);
  curveVertex(a+r2,b-20+.05*d);
  curveVertex(a+r2+.04*c,b-20+.1*d);
  curveVertex(a+r2+.03*c,b-20+.15*d);
  curveVertex(a+r2-.03*c,b-20+.15*d);
  curveVertex(a+r2-.04*c,b-20+.1*d);
  curveVertex(a+r2+.04*c,b-20);
  endShape(CLOSE);

  beginShape();
  curveVertex(a+r3,b+10);
  curveVertex(a+r3,b+10+.05*d);
  curveVertex(a+r3+.04*c,b+10+.1*d);
  curveVertex(a+r3+.03*c,b+10+.15*d);
  curveVertex(a+r3-.03*c,b+10+.15*d);
  curveVertex(a+r3-.04*c,b+10+.1*d);
  curveVertex(a+r3+.04*c,b+10);
  endShape(CLOSE);


  beginShape();
  curveVertex(a+r4,b-35);
  curveVertex(a+r4,b-35+.05*d);
  curveVertex(a+r4+.04*c,b-35+.1*d);
  curveVertex(a+r4+.03*c,b-35+.15*d);
  curveVertex(a+r4-.03*c,b-35+.15*d);
  curveVertex(a+r4-.04*c,b-35+.1*d);
  curveVertex(a+r4+.04*c,b-35);
  endShape(CLOSE);

  beginShape();
  curveVertex(a+r5,b-20);
  curveVertex(a+r5,b-20+.05*d);
  curveVertex(a+r5+.04*c,b-20+.1*d);
  curveVertex(a+r5+.03*c,b-20+.15*d);
  curveVertex(a+r5-.03*c,b-20+.15*d);
  curveVertex(a+r5-.04*c,b-20+.1*d);
  curveVertex(a+r5+.04*c,b-20);
  endShape(CLOSE);

  beginShape();
  curveVertex(a+r6,b-40);
  curveVertex(a+r6,b-40+.05*d);
  curveVertex(a+r6+.04*c,b-40+.1*d);
  curveVertex(a+r6+.03*c,b-40+.15*d);
  curveVertex(a+r6-.03*c,b-40+.15*d);
  curveVertex(a+r6-.04*c,b-40+.1*d);
  curveVertex(a+r6+.04*c,b-40);
  endShape(CLOSE);

  beginShape();
  curveVertex(a+r7,b-20);
  curveVertex(a+r7,b-20+.05*d);
  curveVertex(a+r7+.04*c,b-20+.1*d);
  curveVertex(a+r7+.03*c,b-20+.15*d);
  curveVertex(a+r7-.03*c,b-20+.15*d);
  curveVertex(a+r7-.04*c,b-20+.1*d);
  curveVertex(a+r7+.04*c,b-20);
  endShape(CLOSE);

  //loop the raindrops

  b=b+1;
  
  if(b>=600) {

    b=1;
  }

  //gravity for raindrops

  b=b+speed;
  
 speed=speed+gravity;

 if(b>=height+10){
    speed=speed*-.1;
  }

  //clouds

  noStroke();
  fill(155);

  ellipse(70,48,100,100);
  ellipse(150,50,180,160);
  ellipse(230,55,125,130);
  ellipse(320,50,140,130);
  ellipse(385,45,190,170);
  ellipse(450,53,125,120);
  
  //ground
  
  noStroke();
  fill(31,131,53);
  rect(0,480,height,width/5);
  
  //puddles
  
  noStroke();
  fill(90,196,222);
  ellipse(350,515,70,30);
  ellipse(320,500,40,20);
  
  ellipse(220,520,80,60);
  ellipse(260,510,50,40);
  
  //ripples in puddles
  
  if (mousePressed){
  noFill();
  stroke(15,95,134);
  ellipse(350,515,20,10);
  ellipse(350,515,30,20);
  ellipse(350,515,40,30);
  
  ellipse(220,520,30,20);
  ellipse(220,520,40,30);
  ellipse(220,520,50,40);
  ellipse(220,520,60,50);
  
  }
   
}


void mousePressed() {

  x=130;
  h=150;
  
}

void keyPressed(){
  
  x=300;
  h=100;
  
}









