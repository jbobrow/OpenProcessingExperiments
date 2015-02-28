

import ddf.minim.*;

Minim minim;
AudioSample synt;
AudioSample synt2;
AudioSample synt3;
AudioSample pad;

PFont fontA;
int x;
float y;
float speed;
int x1;
float y1;
float speed1;
int x2;
float y2;
float speed2;
int x3;
float y3;
float speed3;
float rot;


void setup(){
  size(680,250,P3D);
  minim = new Minim(this);
  synt = minim.loadSample("synth4.wav", 2048);
  synt2 = minim.loadSample("synth3.wav", 2048);
  pad = minim.loadSample("synth6.wav", 2048);
  synt3 = minim.loadSample("synth5.wav", 2048);
  fontA = loadFont("anorex-100.vlw");
  textFont(fontA, 100);
  smooth();
}


void draw(){
  background(0);
  stroke(255);

  rotateX(y/y2/y3);
  rotateY(y/y2/y3);




  rot=rot+0.01;

  if(mousePressed){
    speed=random(4);
    speed1=random(4);
    speed2=random(4);
    speed3=random(4);
    println(y);

    y=constrain(y,0,250);
    y1=constrain(y1,0,250);
    y2=constrain(y2,0,250);
    y3=constrain(y3,0,250);

  }
  y=y+speed;
  y1=y1+speed1;
  y2=y2+speed2;
  y3=y3+speed3;



  if((y>height) ||  (y<0)){

    speed=speed*-1;
        synt.trigger();

  }

  if((y1>height) ||  (y1<0)){

    speed1=speed1*-1;
    synt2.trigger();
  }


  if((y2>height) ||  (y2<0)){

    speed2=speed2*-1;
    synt3.trigger();
  }

  if((y3>height) ||  (y3<0)){

    speed3=speed3*-1;
    pad.trigger();
  }

  line(0,y,100,y);
  line(100,y1,200,y1);
  line(200,y2,300,y2);
  line(300,y3,400,y3);

  fill(255);
  text(y,400,50);
  text(y1,400,110);
  text(y2,400,170);
  text(y3,400,230);

  for(int i=0; i<680; i=i+10){
    for(int j=0; j<250; j=j+10){
      rotateX(y/y2/y3);
      rotateY(y/y2/y3);
      pushMatrix();

      point(i,j);
      popMatrix();


    }

  }

}









