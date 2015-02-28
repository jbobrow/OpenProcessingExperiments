
//brushes
float circleX;
float circleH;
float circleS;
float xspeed = 1;
float hspeed = 5;
float sspeed = 10;
float zspeed = 20;

//canvas
void setup(){
  background(random(256),random(256),random(256));
  size(400, 400);
  noStroke();
  circleX = 198;
  smooth();
  frameRate(60);
}

//art
void mousePressed(){
  background(random(256),random(256),random(256));
  noStroke(); //NOTE: you only have to do this once
  //reset background every time so you don't end up with a solid gradient at one point
  fill (112,96,255,60);
  ellipse(random(-50,400),random(-50,400),250,250);
  
  fill (134,121,255,60);
  ellipse(random(-50,400),random(-50,400),250,250);
  
  fill (152,2,202,60);
  ellipse(random(-50,400),random(-50,400),250,250);
  
  fill (183,19,255,60);
  ellipse(circleS,random(-50,400),250,250);
  
  fill (206,0,122,60);
  ellipse(random(-50,400),random(-50,400),250,250);
  
  fill (20,131,73,60);
  ellipse(random(-50,400),random(-50,400),300,300);
  
  fill (42,142,90,60);
  ellipse(random(-50,400),random(-50,400),300,300);
  
  fill (3,124,176,60);
  ellipse(random(-50,400),random(-50,400),300,300);
  
  fill (3,120,180,60);
  ellipse(random(-50,400),random(-50,400),300,300);
  
  fill (80,100,255,60);
  ellipse(circleX,random(-50,400),300,300);
  
  fill (1,88,184,60);
  ellipse(random(-50,400),random(-50,400),300,300);
  
  fill (183,19,255,60);
  ellipse(random(-50,400),random(-50,400),300,300);
}

void draw() {
  //instance of many circles
  //background(random(256),random(256),random(256));
  frameRate(60);
  
  fill (47,255,209,100);
  ellipse(circleX,177,20,20);
  circleX= circleX + xspeed;
  
  fill (73,255,215,100);
  ellipse(212,191,35,35);

  fill (31,145,20,100);
  ellipse(245,202,50,50);
  
  fill (89,214,73,100);
  ellipse(circleH,209,80,80);
  circleH = circleH + hspeed;
  
  fill (3,21,40,100);
  ellipse(circleX,177,150,150);
  
  fill (58,255,212,100);
  ellipse(168,184,20,20);
  
  fill (73,255,215,100);
  ellipse(157,194,30,30);
  
  fill (80,60,255,100);
  ellipse(146,213,45,45);
  
  fill (80,60,255,100);
  ellipse(146,213,45,45);
  
  fill (129,117,255,100);
  ellipse(142,250,80,80);
  
  fill (206,3,123,100);
  ellipse(165,325,150,150);
  
  fill (191,1,138,100);
  ellipse(circleX,419,300,300);
  
  fill (20,0,94,100);
  ellipse(circleH,68,300,300);
  circleH = circleH + hspeed;
  
  fill (24,255,204,100);
  ellipse(163,162,20,20);
  
  fill (64,30,20,100);
  ellipse(150,152,35,35);
  
  fill (90,28,12,100);
  ellipse(128,146,50,50);
  
  fill (128,43,12,100);
  ellipse(102,139,70,70);
  
  fill (229,53,2,100);
  ellipse(circleS,135,100,100);
  circleS= circleS + sspeed;
  
  fill (230,51,0,100);
  ellipse(11,150,150,150);
  
  fill (20,255,203,100);
  ellipse(188,153,20,20);
  
  fill (21,255,204,100);
  ellipse(circleS,139,35,35);
  circleS= circleS + zspeed;
  fill (49,255,210,100);
  ellipse(197,120,50,50);
  
  fill (3,87,163,100);
  ellipse(191,77,80,80);
  
  fill (1,89,184,100);
  ellipse(circleS,-38,250,250);
  circleS= circleS + sspeed;
  
  //all main circles completed//////
  //now edge circles
  if ((((circleX==400)||(circleS==400)||(circleH==400)))||(((circleX==0)||(circleS==0)||(circleH==0)))){
    xspeed=-xspeed;
    hspeed=-hspeed;
    sspeed=-sspeed;
    
}
}



