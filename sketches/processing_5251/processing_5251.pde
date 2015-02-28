
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import ddf.minim.*;

Minim minim;
AudioInput in;


boolean swap = false;
boolean mode = false;
boolean rotation = false;
float hairFlow;

float level;
float blow = 90;
float x = 240.0;
float y = 160.0;
float p = 240.0;
float q = 160.0;
float u = 3.0;
float f;
float v;
float mouthY;
float z = 1;
float angle = 0;
float scalar = 3;
float angleInc = 0.05;
float offset = 135;
float armAngle = 0.3;
float angleSpeed = 0.05;
float r = 6.0;

float bodyX;
float bodyY;
float facialX;
float facialY;
float mond;
int multipl = 1;
int angleDir = 1;
float hoek;


PShape mouth;
PShape body;
PShape face;
PShape bovenarm;
PShape onderarm;
PShape knuppel;
PImage head;
PImage jaw;
PImage knuppelPic;
PImage onderarmPic;
PImage bovenarmPic;


float Ypos;
int printtest;

void setup(){

  minim = new Minim(this);
  minim.debugOn();

  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);

  size(480,320); 
  smooth(); 
  mouth = loadShape("mouth.svg");
  face = loadShape("face2.svg");
  body = loadShape("body.svg");
  bovenarm = loadShape("bovenarm.svg");
  onderarm = loadShape("onderarm.svg");
  knuppel = loadShape("knuppel.svg");
  head = loadImage("head.png");
  jaw = loadImage("jaw.png");
  knuppelPic = loadImage("knuppel.png");
  onderarmPic = loadImage("onderarm.png");
  bovenarmPic = loadImage("bovenarm.png");

}


void draw(){
  background(255);
  hairFlow = constrain(hairFlow,0.0,1.0);
  blow = constrain(blow,90,120);
  int i = 0;
  level = in.left.get(i)*50;
  println(in.left.get(i)*50);
  if(level > 0.5 && level < 1.8){
    blow = 120;
  }
  if(level > 1){
    hairFlow -=0.1;
    blow -=1;
  }
  else{
    hairFlow +=0.05;
    blow -=1;

  }


  //line(0,lineHeight,480,lineHeight);
  //all local declarations
  angle = angle + angleInc;
  mouthY = offset + cos(angle) * random(-scalar,scalar);
  f = 0.0;
  v = 0;
  strokeWeight(2);
  stroke(255);
  fill(0);
  bodyX = -90.0;
  bodyY = 150.0;
  facialX = -130.0;
  facialY = -100.0;
  Ypos = mouseY;
  hoek = Ypos;
  //  printtest = 1;
  println(printtest);


  //without skin
  if(swap == false && mode == false){
    strokeWeight(2);
    stroke(0);
    fill(255);
    //face
    rect(x-110,y-110,220,110);

    //left eye
    rect(x-100,y-100,90,50);

    //right eye
    rect(x+10,y-100,90,50);


    //pupillen
    float n = constrain(mouseX,x-45,x+35);
    float m = constrain(mouseY,y-100,y-60);
    rect(n-55,m,10,10);
    rect(n+55,m,10,10);

    //mouth

    rect(p-50,q-30,100,20);

    beginShape();
    vertex(p-40,q-32);
    vertex(p-30,q-60);
    vertex(p-20,q-32);
    vertex(p-20,q-32);
    vertex(p-10,q-45);
    vertex(p,q-32);
    vertex(p,q-32);
    vertex(p+10,q-45);
    vertex(p+20,q-32);
    vertex(p+20,q-32);
    vertex(p+30,q-60);
    vertex(p+40,q-32);
    endShape();

    f = 0;
    v = 0;
    pushMatrix();

    translate(250,50);
    strokeWeight(2);
    fill(0);
    beginShape();
    vertex(f,v);
    bezierVertex(f,v,f-20,v+10,f-20,v+20);
    bezierVertex(f-20,v+30,f-10,v+30,f-10,v+30);
    bezierVertex(f,v+30,f,v+20,f,v+20);
    bezierVertex(f,v+20,f+35,v+45,f-10,v+45);
    bezierVertex(f-25,v+45,f-50,v+25,f-40,v);
    bezierVertex(f-30,v,f-20,v,f-20,v);
    endShape(CLOSE);
    popMatrix();

    fill(255);
    strokeWeight(2);
    ellipse(mouseX-20,mouseY,30,30);
    ellipse(mouseX-30,mouseY-5,15,15);
    ellipse(mouseX-10,mouseY-5,15,15);
    fill(0);
    ellipse(mouseX-30,mouseY-5,5,5);
    ellipse(mouseX-10,mouseY-5,5,5);
    noFill();
    ellipse(mouseX-20,mouseY+10,10,10);  

    if(mouseX>190 && mouseX<290 && mouseY>115 && mouseY<150){

      println("u" + u + " q" + q);

      q = constrain(q,160,190) + u; 
      if(q > 189){
        u = u*(-1); 
      }
      if(q==160){
        u = u *-1;
      }


    }
  }


  //skin one
  if(swap == true && mode == false){
    background(200,0,0);


    //all shapes:
    translate(50,0);
    //body
    fill(255);
    stroke(0);
    shape(body,bodyX,bodyY + cos(angle)*scalar);
    pushMatrix();
    translate(240,160);
    scale(z);
    //rotate(hoek);
    //face
    shape(face,facialX,facialY +cos(angle)*scalar/4);


    //mouth
    shape(mouth,facialX+75,facialY+blow 
      //+ constrain(mond,0,40) 
    + cos(angle)*random(-scalar,scalar));



    //kuif
    fill(0);
    stroke(255);
    pushMatrix();
    translate(0,-96 + cos(angle)*scalar/4);
    scale(1,hairFlow);
    beginShape();
    vertex(f,v);
    bezierVertex(f,v,f-20,v+10,f-20,v+20);
    bezierVertex(f-20,v+30,f-10,v+30,f-10,v+30);
    bezierVertex(f,v+30,f,v+20,f,v+20);
    bezierVertex(f,v+20,f+35,v+45,f-10,v+45);
    bezierVertex(f-25,v+45,f-50,v+25,f-40,v);
    bezierVertex(f-30,v,f-20,v,f-20,v);
    endShape(CLOSE);
    popMatrix();

    popMatrix();
    //arm
    fill(255);
    strokeWeight(3);
    stroke(0);
    pushMatrix();
    translate(-30,30);

    shape(bovenarm,bodyX,bodyY + cos(angle)*scalar);
    bovenarm.disableStyle();
    popMatrix();
    pushMatrix();
    translate(-140,130);
    rotate(-PI/4);

    shape(onderarm,bodyX,bodyY + cos(angle)*scalar);
    onderarm.disableStyle();

    pushMatrix();
    translate(100,-20);
    shape(knuppel,bodyX,bodyY + cos(angle)*scalar);
    knuppel.disableStyle();
    popMatrix();
    popMatrix();
    pushMatrix();
    scale(-1,1);

    translate(-570,160 +  cos(angle)*scalar);
    shape(bovenarm,0,0);
    popMatrix();
    //
    //    //arm
    //    pushMatrix();
    //    stroke(0);
    //    translate(360, 160 + cos(angle)*scalar);
    //    rotate(0.3);
    //    ellipse(25,0,r,r);
    //    strokeWeight(12);
    //    line(0,0,50,0);
    //    strokeWeight(6);
    //    translate(50,0);
    //    rotate(-armAngle);
    //    line(0,0,30,0);
    //    strokeWeight(3);
    //    translate(30,0);
    //    rotate(-armAngle);
    //    line(0,0,30,0);
    //    //  noStroke();
    //    fill(0);
    //    ellipse(30,0,12,12);
    //    popMatrix();
    //
    //    //arm2
    //    pushMatrix();
    //    scale(-1,1);
    //    stroke(0);
    //    translate(-100, 180 + cos(angle)*scalar);
    //    rotate(0.3);
    //    ellipse(25,0,r,r);
    //    strokeWeight(12);
    //    line(0,0,50,0);
    //    strokeWeight(6);
    //    translate(50,0);
    //    rotate(-armAngle);
    //    line(0,0,30,0);
    //    strokeWeight(3);
    //    translate(30,0);
    //    rotate(-armAngle);
    //    line(0,0,30,0);
    //    //  noStroke();
    //    fill(0);
    //    ellipse(30,0,12,12);
    //    popMatrix();

    if (160 < mouseX && mouseX < 240 && 100 < mouseY && mouseY < 240 && mousePressed){
      rotation = true;
    }
    if(!mousePressed){
      rotation = false; 
    }

    if( rotation == true){


      println("hoek" + " " + hoek + " " + "Ypos" + " " + Ypos + " " + "mouseY" + " " + mouseY); 

    }

  }

  //skin2
  if(swap == true && mode == true){
    background(150);
    stroke(#684943);
    fill(255);
    shape(body,bodyX,bodyY + cos(angle)*scalar);
    body.disableStyle();
    pushMatrix();
    translate(230,150);
    image(head,facialX+10,facialY + cos(angle) * (scalar/3));
    translate(10,20);
    rotate(-PI/15);
    image(jaw,facialX+45,facialY-50 + constrain(mond,0,40) + blow + cos(angle)*random(-scalar,scalar));
    popMatrix();
     //kuif
    pushMatrix();
    translate(240,70+cos(angle)*scalar);
    scale(1,hairFlow);
    stroke(#332b2f);
    fill(#684943);
    beginShape();
    vertex(f,v);
    bezierVertex(f,v,f-20,v+10,f-20,v+20);
    bezierVertex(f-20,v+30,f-10,v+30,f-10,v+30);
    bezierVertex(f,v+30,f,v+20,f,v+20);
    bezierVertex(f,v+20,f+35,v+45,f-10,v+45);
    bezierVertex(f-25,v+45,f-50,v+25,f-40,v);
    bezierVertex(f-30,v,f-20,v,f-20,v);
    endShape(CLOSE);
    popMatrix();
    
    pushMatrix();
    pushMatrix();
    translate(20,170);
    image(bovenarmPic,0,cos(angle)*scalar);
    pushMatrix();
    scale(-1,1);
    translate(-450,-20);
    image(bovenarmPic,0,cos(angle)*scalar);
    translate(-120,50);
    rotate(-PI/10);
    image(onderarmPic,0,cos(angle)*scalar);
    popMatrix();
    popMatrix();
    rotate(PI/440*cos(angle));
    rotate(PI/10);
    translate(235,155);
    scale(-1,1);

    image(onderarmPic,0,cos(angle)*scalar);
    translate(-63,-70);
    image(knuppelPic,0,cos(angle)*scalar);
    popMatrix();
    
   

  }

}






void keyPressed(){
  if(key == ' ' && swap == false && mode == false){
    swap = !swap;    
  }
  else{
    if(key == ' ' && swap == true && mode == false){
      mode = !mode;
    } 
    else{
      if(key == ' ' && swap == true && mode == true){
        swap = !swap;
        mode = !mode;
      }

    }
  }


}

//void mouseDragged(){
//  printtest = 5;
//  if(160 < mouseX && mouseX < 240 && 100 < mouseY && mouseY < 240){
//    Ypos = PI;
//    
//  } 
//  else if(240 < mouseX && mouseX < 370 && 100 < mouseY && mouseY < 240){
//    hoek = -mouseY/5;
//  }
//
//}





