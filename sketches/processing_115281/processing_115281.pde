
/*
Jeff Guo
 Oct 3 2013
 Interactive Prototyping 3
 --FREE KICK--
 All Rights Reserved
 */
PFont agency;
PFont calibri;
PImage bg;
PImage ball;
float x;
float y;
float v;
float spdx;
float spdy;


boolean start = false;


void setup() {
  agency = loadFont("AgencyFB-Bold-48.vlw");
  size(1280, 800);
  smooth();
  frameRate(60);

  bg = loadImage("bg.jpg");
  ball = loadImage("ball.png");


  imageMode(CENTER);
  ellipseMode(CENTER);
}


void draw() {



  image(bg, width/2, height/2);

  stroke(255);
  strokeWeight(3);
  line(143, 350, mouseX, mouseY);




  //      float x0 = random(292, 985);
  //      float y0 = random(76, 724);
  float x0 = 480;
  float y0 = 84;

   float x1 = 416;
   float y1 = 144;
  //
    float x2 = 680;
    float y2 = 345;
  //
   float x3 = 980;
   float y3 = 644;
 
    float x4 = 380;
    float y4 = 344;
  
    float x5 = 490;
    float y5 = 654;
  //
    float x6 = 660;
    float y6 = 564;
  //
  //  float x7 = 780;
  //  float y7 = 384;
  //
  //  float x8 = 900;
  //  float y8 = 544;
  //
  //  float x9 = 560;
  //  float y9 = 444;





  fill(0,0,255);
  ellipse(x0, y0, 40, 40);
    ellipse(x1, y1, 40, 40);
   ellipse(x2, y2, 40, 40);
    ellipse(x3, y3, 40, 40);
    ellipse(x4, y4, 40, 40);
    ellipse(x5, y5, 40, 40);
    ellipse(x6, y6, 40, 40);
  //  ellipse(x7, y7, 40, 40);
  //  ellipse(x8, y8, 40, 40);
  //  ellipse(x9, y9, 40, 40);

 





  x = (x+spdx)*v;
  y = (y+ spdy)*v;

if(dist(x+143, y+350,x0,y0)<=40){
  spdx = (x-x0 +143)*0.3;
  spdy = (y-y0 + 350)*0.3;
}
if(dist(x+143, y+350,x1,y1)<=40){
  spdx = (x-x1 +143)*0.3;
  spdy = (y-y1 + 350)*0.3;
}
if(dist(x+143, y+350,x2,y2)<=40){
  spdx = (x-x2 +143)*0.3;
  spdy = (y-y2 + 350)*0.3;
}
if(dist(x+143, y+350,x3,y3)<=40){
  spdx = (x-x3 +143)*0.3;
  spdy = (y-y3 + 350)*0.3;
}

if(dist(x+143, y+350,x4,y4)<=40){
  spdx = (x-x4 +143)*0.3;
  spdy = (y-y4 + 350)*0.3;
}
if(dist(x+143, y+350,x5,y5)<=40){
  spdx = (x-x5 +143)*0.3;
  spdy = (y-y5 + 350)*0.3;
}
if(dist(x+143, y+350,x6,y6)<=40){
  spdx = (x-x6 +143)*0.3;
  spdy = (y-y6 + 350)*0.3;
}




  if (x>= 1080|| x< -40) {
    spdx = -spdx*0.2;
  }
  if (y>= 420 || y< -310) {
    spdy = -spdy*0.2;
  }


  if (x>1069 && y>0 && y<100) {
   
    v =1 ;
    spdx = 0;
    spdy = 0;
    fill(255);
   textFont(agency, 96);
  text("GOAL!", 545, 435);
    
  }else{
     v = 0.99;
  }





  //ball
  image(ball, x+143, y+350, 50, 50);
}

void mouseClicked() {
  start = true;
}

void mouseReleased() {
  start = true;
 spdx = (mouseX-143)*0.03;
  spdy = (mouseY-350)*0.03;
}



