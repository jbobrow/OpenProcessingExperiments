
void setup() {
  size(900,900);
  background(255);
  smooth();

  //background
 for (int i=1555; i>0; i--){
 noStroke();
 fill(0-i);
 ellipse(700, 200, i, i);
 
 fill(120);
 rect(10,350,200,700);
 
 fill(70);
 rect(410,460,250,600);
 
 fill(100);
 rect(180,595,300,400);
 
 fill(150);
 rect(630,710,275,300);

  //2nd pet

  int x=320; //x-coordinate
  int y=350; //y-coordinate
  int gap=10; //distance of gap between eyes
  int eyeheight=20; //height of eyes
  int mouthL=10; //length of mouth
  int ears=80; //size of ears
  int tail=20; //size of ball on tail
  int leg=80; //length of leg
  int footlength=70; //length of foot

stroke(0);
strokeWeight(1);
  //head, body, and top lines of wings
  fill(0,166,81);
  ellipse(x,y,ears,40);
  fill(196,235,163);
  ellipse(x,y,60,80);
  fill(0,208,120);
  ellipse(x,y+105,100,130);
  line(x+10,y+40,x+100,y+40);
  line(x-10,y+40,x-100,y+40);

  //curved line of the right wing
  noFill();
  beginShape();
  vertex(x+100,y+40);
  bezierVertex(x+90,y+100,x+50,y+90,x+50,y+120);
  endShape();

  //curved line of the left wing
  beginShape();
  vertex(x-100,y+40);
  bezierVertex(x-90,y+100,x-50,y+90,x-50,y+120);
  endShape();

  //tail 
  beginShape();
  vertex(x+60,y+100);
  bezierVertex(x+110,y+90,x+100,y+100,x+110,y+90);
  endShape();
  fill(108,87,229);
  ellipse(x+110,y+90,tail,tail);

  //left leg
  line(x-35,y+153,x-60,y+153+leg);
  line(x-25,y+161,x-50,y+161+leg);
  fill(107,145,224);
  ellipse(x-60,y+157+leg,footlength,20);

  //right leg
  line(x+35,y+153,x+60,y+153+leg);
  line(x+25,y+161,x+50,y+161+leg);
  ellipse(x+60,y+157+leg,footlength,20);

  //mouth
  line(x-mouthL,y+20,x+mouthL,y+20);

  //eyes
  ellipse(x-gap,y-5,15,eyeheight);
  ellipse(x+gap,y-5,15,eyeheight);

  //pupils
  strokeWeight(7);
  point(x-gap,y);
  point(x+gap,y);

  //1st pet
  x=110;
  y=150;
  gap=20;
  eyeheight=30;
  mouthL=15;
  ears=90;
  tail=10;
  leg=40;
  footlength=40;

  strokeWeight(1);
  //head, body, and top lines of wings
  fill(220,0,0);
  ellipse(x,y,ears,40);
  fill(255,153,136);
  ellipse(x,y,60,80);
  fill(255,88,59);
  ellipse(x,y+105,100,130);
  line(x+10,y+40,x+100,y+40);
  line(x-10,y+40,x-100,y+40);

  //curved line of the right wing
  noFill();
  beginShape();
  vertex(x+100,y+40);
  bezierVertex(x+90,y+100,x+50,y+90,x+50,y+120);
  endShape();

  //curved line of the left wing
  beginShape();
  vertex(x-100,y+40);
  bezierVertex(x-90,y+100,x-50,y+90,x-50,y+120);
  endShape();

  //tail 
  beginShape();
  vertex(x+60,y+100);
  bezierVertex(x+110,y+90,x+100,y+100,x+110,y+90);
  endShape();
  fill(255,0,0);
  ellipse(x+110,y+90,tail,tail);

  //left leg
  line(x-35,y+153,x-60,y+153+leg);
  line(x-25,y+161,x-50,y+161+leg);
  ellipse(x-60,y+157+leg,footlength,20);

  //right leg
  line(x+35,y+153,x+60,y+153+leg);
  line(x+25,y+161,x+50,y+161+leg);
  ellipse(x+60,y+157+leg,footlength,20);

  //mouth
  line(x-mouthL,y+20,x+mouthL,y+20);

  //eyes
  fill(240);
  ellipse(x-gap,y-5,15,eyeheight);
  ellipse(x+gap,y-5,15,eyeheight);

  //pupils
  strokeWeight(7);
  point(x-gap,y);
  point(x+gap,y);

  //3rd pet
  x=550;
  y=200;
  gap=5;
  eyeheight=15;
  mouthL=5;
  ears=70;
  tail=15;
  leg=100;
  footlength=60;

  strokeWeight(1);
  //head, body, and top lines of wings
  fill(0,0,255);
  ellipse(x,y,ears,40);
  fill(177,141,248);
  ellipse(x,y,60,80);
  fill(116,0,255);
  ellipse(x,y+105,100,130);
  line(x+10,y+40,x+100,y+40);
  line(x-10,y+40,x-100,y+40);

  //curved line of the right wing
  noFill();
  beginShape();
  vertex(x+100,y+40);
  bezierVertex(x+90,y+100,x+50,y+90,x+50,y+120);
  endShape();

  //curved line of the left wing
  beginShape();
  vertex(x-100,y+40);
  bezierVertex(x-90,y+100,x-50,y+90,x-50,y+120);
  endShape();

  //tail 
  beginShape();
  vertex(x+60,y+100);
  bezierVertex(x+110,y+90,x+100,y+100,x+110,y+90);
  endShape();
  fill(0,0,255);
  ellipse(x+110,y+90,tail,tail);

  //left leg
  line(x-35,y+153,x-60,y+153+leg);
  line(x-25,y+161,x-50,y+161+leg);
  fill(95,95,227);
  ellipse(x-60,y+157+leg,footlength,20);

  //right leg
  line(x+35,y+153,x+60,y+153+leg);
  line(x+25,y+161,x+50,y+161+leg);
  fill(95,95,227);
  ellipse(x+60,y+157+leg,footlength,20);

  //mouth
  line(x-mouthL,y+20,x+mouthL,y+20);

  //eyes
  fill(255);
  ellipse(x-gap,y-5,15,eyeheight);
  ellipse(x+gap,y-5,15,eyeheight);

  //pupils
  strokeWeight(7);
  point(x-gap,y);
  point(x+gap,y);

  //4th pet
  x=770;
  y=490;
  gap=15;
  eyeheight=20;
  mouthL=7;
  ears=100;
  tail=20;
  leg=60;
  footlength=30;

  strokeWeight(1);
  //head, body, and top lines of wings
  fill(255,255,0);
  ellipse(x,y,ears,40);
  fill(255,203,58);
  ellipse(x,y,60,80);
  fill(255,149,10);
  ellipse(x,y+105,100,130);
  line(x+10,y+40,x+100,y+40);
  line(x-10,y+40,x-100,y+40);

  //curved line of the right wing
  noFill();
  beginShape();
  vertex(x+100,y+40);
  bezierVertex(x+90,y+100,x+50,y+90,x+50,y+120);
  endShape();

  //curved line of the left wing
  beginShape();
  vertex(x-100,y+40);
  bezierVertex(x-90,y+100,x-50,y+90,x-50,y+120);
  endShape();

  //tail 
  beginShape();
  vertex(x+60,y+100);
  bezierVertex(x+110,y+90,x+100,y+100,x+110,y+90);
  endShape();
  fill(255,255,0);
  ellipse(x+110,y+90,tail,tail);

  //left leg
  line(x-35,y+153,x-60,y+153+leg);
  line(x-25,y+161,x-50,y+161+leg);
  fill(255,67,9);
  ellipse(x-60,y+157+leg,footlength,20);

  //right leg
  line(x+35,y+153,x+60,y+153+leg);
  line(x+25,y+161,x+50,y+161+leg);
  fill(255,67,9);
  ellipse(x+60,y+157+leg,footlength,20);

  //mouth
  line(x-mouthL,y+20,x+mouthL,y+20);

  //eyes
  fill(255,249,154);
  ellipse(x-gap,y-5,15,eyeheight);
  ellipse(x+gap,y-5,15,eyeheight);

  //pupils
  strokeWeight(7);
  point(x-gap,y);
  point(x+gap,y);
  

 }
 }



