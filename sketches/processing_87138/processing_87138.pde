
int head;
float speakercircy;
float speakercircx;
int circwidth;
int rightearplacement;

void setup() {
  size(854, 480);
}

void draw() {
  background(0);
  
  //MIDDLEHEAD
  fill(150);
  noStroke();
  head = width/4;
  ellipse(width/2, height/2, head, head);

  //left eye
  fill(240);
  ellipse(width/2-head/6, height/2, 30, 30);

  //right eye
  fill(0);
  rectMode(CENTER);
  rect(width/2+head/6, height/2, 30, 30);

  //eyebrow
  rectMode(CENTER);
  rect(width/2, height/2.5, 100, 30);

  //TRUNK
  fill(150);
  triangle(380, 320, 427, 450, 474, 320);  
  ellipse(width/2, 425, head/4, head/4);        //circle trunk end
  fill(0);
  ellipse(width/2-10, 425, 25, 25);      //tiny left circle on trunk
  ellipse(width/2+10, 425, 25, 25);      //tiny right circle on trunk

  ////////////////////////////////////////LEFT EAR/////////////////////////////////////////////
  noStroke();
  fill(150);
  ellipse(180, height/2, width/3, width/3);

  //SPEAKERS (from big to small)
  //big gray
  fill(90);
  noStroke();
  rect(180, height/2, width/5, width/5);

  //big white
  fill(240);
  noStroke();
  rect(180, height/2, width/6, width/6);

  //middle speaker grid
  stroke(10);
  fill(180);
  rect(180, height/2, width/8, width/8);

  //LEFT SPEAKERCIRCLES
  speakercircy = height/2.38;
  speakercircx = width/2-180-width/8;
  circwidth = width/32;
  fill(0);

  //row left speakercircles
  ellipse(speakercircx, speakercircy, circwidth, circwidth);
  ellipse(speakercircx, speakercircy + circwidth, circwidth, circwidth);
  ellipse(speakercircx, speakercircy + circwidth*2, circwidth, circwidth);  
  ellipse(speakercircx, speakercircy + circwidth*3, circwidth, circwidth);  

  //row left middle speakercircles
  ellipse(speakercircx+circwidth, speakercircy, circwidth, circwidth);
  ellipse(speakercircx+circwidth, speakercircy + circwidth, circwidth, circwidth);
  ellipse(speakercircx+circwidth, speakercircy + circwidth*2, circwidth, circwidth);  
  ellipse(speakercircx+circwidth, speakercircy + circwidth*3, circwidth, circwidth);  

  //row right middle speakercircles
  ellipse(speakercircx+circwidth*2, speakercircy, circwidth, circwidth);
  ellipse(speakercircx+circwidth*2, speakercircy + circwidth, circwidth, circwidth);
  ellipse(speakercircx+circwidth*2, speakercircy + circwidth*2, circwidth, circwidth);  
  ellipse(speakercircx+circwidth*2, speakercircy + circwidth*3, circwidth, circwidth);  

  //row right speakercircles

  ellipse(speakercircx+circwidth*3, speakercircy, circwidth, circwidth);
  ellipse(speakercircx+circwidth*3, speakercircy + circwidth, circwidth, circwidth);
  ellipse(speakercircx+circwidth*3, speakercircy + circwidth*2, circwidth, circwidth);  
  ellipse(speakercircx+circwidth*3, speakercircy + circwidth*3, circwidth, circwidth);  

  //small black box
  fill(30);
  stroke(100);
  rect(180, height/2, 40, 30);
  /////////////////////////////////////////////////////////////////////////////////////  

  //////////////////////////////////////RIGHT EAR//////////////////////////////////////  
  noStroke();
  fill(150);
  rightearplacement = width-180;

  //right ear
  ellipse(rightearplacement, height/2, width/3, width/3);

  //SPEAKERS (from big to small)
  //big gray
  fill(90);
  noStroke();
  rect(rightearplacement, height/2, width/5, width/5);

  //big white
  fill(240);
  noStroke();
  rect(rightearplacement, height/2, width/6, width/6);

  //middle speaker grid
  stroke(10);
  fill(180);
  rect(rightearplacement, height/2, width/8, width/8);

  //RIGHT SPEAKERCIRCLES
  speakercircx = width/2+180+width/8;
  circwidth = width/32;
  fill(0);

  //row right speakercircles
  ellipse(speakercircx, speakercircy, circwidth, circwidth);
  ellipse(speakercircx, speakercircy + circwidth, circwidth, circwidth);
  ellipse(speakercircx, speakercircy + circwidth*2, circwidth, circwidth);  
  ellipse(speakercircx, speakercircy + circwidth*3, circwidth, circwidth);  

  //row right middle speakercircles
  ellipse(speakercircx-circwidth, speakercircy, circwidth, circwidth);
  ellipse(speakercircx-circwidth, speakercircy + circwidth, circwidth, circwidth);
  ellipse(speakercircx-circwidth, speakercircy + circwidth*2, circwidth, circwidth);  
  ellipse(speakercircx-circwidth, speakercircy + circwidth*3, circwidth, circwidth);  

  //row left middle speakercircles
  ellipse(speakercircx-circwidth*2, speakercircy, circwidth, circwidth);
  ellipse(speakercircx-circwidth*2, speakercircy + circwidth, circwidth, circwidth);
  ellipse(speakercircx-circwidth*2, speakercircy + circwidth*2, circwidth, circwidth);  
  ellipse(speakercircx-circwidth*2, speakercircy + circwidth*3, circwidth, circwidth);  

  //row left speakercircles

  ellipse(speakercircx-circwidth*3, speakercircy, circwidth, circwidth);
  ellipse(speakercircx-circwidth*3, speakercircy + circwidth, circwidth, circwidth);
  ellipse(speakercircx-circwidth*3, speakercircy + circwidth*2, circwidth, circwidth);  
  ellipse(speakercircx-circwidth*3, speakercircy + circwidth*3, circwidth, circwidth);
  
  //small black box
  fill(30);
  stroke(100);
  rect(rightearplacement, height/2, 40, 30);
  /////////////////////////////////////////////////////////////////////////////////////  
}


