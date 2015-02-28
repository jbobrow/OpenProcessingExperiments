
import processing.pdf.*;

float x;
float y;
float angle = 0;
float r=250;
//float diff = 1;
//float a = 200; 


void setup(){
  size(600,600);
  background(47,160,154);
  beginRecord(PDF, "prowork1.pdf");
  
}

void draw(){
  x = r * cos(angle);
  y = r * sin(angle);
  
  noFill();
  stroke(255,255,255,80);
  strokeWeight(0.1);
  translate(300,300);
  
  rotate(r);

  ellipse(0,0,x*6,y*6);
   rotate(r);
  ellipse(0+50,0+50,x*7,y*7);
  ellipse(0-50,0-50,x*7,y*7);
   rotate(r * 2);
  ellipse(0+100,0+100,x*8,y*8);
  ellipse(0-100,0-100,x*8,y*8);
   rotate(r * 2);
  ellipse(150,150,x*9,y*9);
  ellipse(-150,-150,x*9,y*9);
   rotate(r * 2);
  ellipse(200,200,x*10,y*10);
  ellipse(-200,-200,x*10,y*10);
   rotate(r * 2);
  ellipse(-250,-250,x*11,y*11);
  ellipse(250,250,x*11,y*11);
  
  line(0,0,x/4,y/4);
  rotate(r * 2);
  line(60,0,x/4,y/4);
  line(-60,0,x/4,y/4);
  rotate(r * 2);
  line(120,0,x/4,y/4);
  line(-120,0,x/4,y/4);
  rotate(r * 2);
  line(150,0,x/4,y/4);
  line(-150,0,x/4,y/4);
  rotate(r * 2);
  line(-180,0,x/4,y/4);
  line(180,0,x/4,y/4);
  rotate(r * 2);
  line(-210,0,x/4,y/4);
  line(210,0,x/4,y/4);
  rotate(r * 2);
  line(-240,0,x/4,y/4);
  line(240,0,x/4,y/4);
  rotate(r * 2);
  line(-270,0,x/4,y/4);
  line(270,0,x/4,y/4);
  rotate(r * 2);
  line(-300,0,x/4,y/4);
  line(300,0,x/4,y/4);
  rotate(r * 2);
  line(-330,0,x/4,y/4);
  line(330,0,x/4,y/4);
  rotate(r * 2);
  line(-360,0,x/4,y/4);
  line(360,0,x/4,y/4);
  rotate(r * 2);
  line(-390,0,x/4,y/4);
  line(390,0,x/4,y/4);
  rotate(r * 2);
  line(-420,0,x/4,y/4);
  line(420,0,x/4,y/4);
  rotate(r * 2);
  line(-450,0,x/4,y/4);
  line(450,0,x/4,y/4);
  //rotate(r * 2);
  //line(-480,0,x/4,y/4);
  //line(480,0,x/4,y/4);
  //rotate(r * 2);
  //line(-510,0,x/4,y/4);
  //line(510,0,x/4,y/4);
  

  
  rotate(r * 2);
  line(0,60,x/4,y/4);
  line(0,-60,x/4,y/4);
  rotate(r * 2);
  line(0,120,x/4,y/4);
  line(0,-120,x/4,y/4);
  rotate(r * 2);
  line(0,-150,x/4,y/4);
  line(0,150,x/4,y/4);
  rotate(r * 2);
  line(0,180,x/4,y/4);
  line(0,-180,x/4,y/4);
  rotate(r * 2);
  line(0,210,x/4,y/4);
  line(0,-210,x/4,y/4);
  rotate(r * 2);
  line(0,240,x/4,y/4);
  line(0,-240,x/4,y/4);
  rotate(r * 2);
  line(0,270,x/4,y/4);
  line(0,-270,x/4,y/4);
  rotate(r * 2);
  line(0,300,x/4,y/4);
  line(0,-300,x/4,y/4);
  rotate(r * 2);
  line(0,330,x/4,y/4);
  line(0,-330,x/4,y/4);
  rotate(r * 2);
  line(0,360,x/4,y/4);
  line(0,-360,x/4,y/4);
  rotate(r * 2);
  line(0,390,x/4,y/4);
  line(0,-390,x/4,y/4);
  rotate(r * 2);
  line(0,420,x/4,y/4);
  line(0,-420,x/4,y/4);
  rotate(r * 2);
  line(0,450,x/4,y/4);
  line(0,-450,x/4,y/4);
  rotate(r * 2);
  line(0,480,x/4,y/4);
  line(0,-480,x/4,y/4);
  rotate(r * 2);
  line(0,510,x/4,y/4);
  line(0,-510,x/4,y/4);
 
  
  
  angle = angle +500;
  
//  r = r - diff;
  
//  if (r == 0||r == 20) {
//    diff = diff *-1;
//  }
}


void keyPressed(){
  if (key == 'q'){
    endRecord();
    exit();
  }
}
