

float bgR, bgG, bgB, SunX, MoonX, sunR, sunG, sunB, moonR, moonG, moonB;
float speed = 0;
float x = 500;
float y = 0;
float r = 0;
float gravity = 0.05;


//////////////////////////////////////////////////////////////////SETUP
void setup () {
  size (1000, 625);
  frameRate(60);




  SunX= -50;
  MoonX = 600;
  sunR=random(255);
  sunG=random(255);
  sunB=random(255);
}




void SunAndMoon() {

  if (SunX<1050) {
    fill(255);
    ellipse((SunX), (((SunX*SunX)/2500)), 80, 80);
    SunX+=1;
  }
}

//////////////////////////////////////////////////////////////////PRISM LOOP CONSTRUCTION
void bioPrism() {
  stroke(255, 255, 255, 50);
  int y = 80;
  int spacing = 100;
  int len = 1;
  float peakX = 350;
  float peakY = 150;
  float baseY = 450;
  float culetX = 350;
  float culetY = 600;


  for (int baseX=200; baseX<=800; baseX+= spacing) {
    line(baseX, baseY, baseX, baseY);
    line(peakX, peakY, baseX, baseY);
    line(baseX, baseY, culetX, culetY);
  }


  int jspacing = 100;
  int jen = 1;
  float jeakX = width/2;
  float jeakY = 80;
  float jaseY = 450;
  float juletX = width/2;
  float juletY = 600;

  for (int jaseX=200; jaseX<=800; jaseX+= jspacing) {
    line(jaseX, jaseY, jaseX, jaseY);
    line(jeakX, jeakY, jaseX, jaseY);
    line(jaseX, jaseY, juletX, juletY);
  }

  float sspacing = 100;
  int slen = 1;
  float speakX = 650;
  float speakY = 150;
  float sbaseY = 450;
  float sculetX = 650;
  float sculetY = 600;

  for (int sbaseX=200; sbaseX<=800; sbaseX+= sspacing) {
    line(sbaseX, sbaseY, sbaseX, sbaseY);
    line(speakX, speakY, sbaseX, sbaseY);
    line(sbaseX, sbaseY, sculetX, sculetY);
  }
  float rspacing = 100;
  int rlen = 1;
  float rpeakY = 445;
  float rbaseY = 100;
  float rculetX = 5;


  for (int rpeakX=200; rpeakX<=750; rpeakX+= rspacing) {
    rect(rpeakX, rpeakY, rbaseY, rculetX);
  }
}
///////////////////////////////////////////////////////END PRISM LOOP CONSTRUCTION





//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////DRAW

///////////////////////////////////////////////shadingvariables


//back
float bShadeA = 0;
float bShadeB = 0;
float bShadeC = 0;
float bShadeD = 0;
float bShadeE = 0;
float bShadeF = 0;

//left
float lShadeA = 0;
float lShadeB = 0;
float lShadeC = 0;
float lShadeD = 0;
float lShadeE = 0;
float lShadeF = 0;

//right
float rShadeA = 0;
float rShadeB = 0;
float rShadeC = 0;
float rShadeD = 0;
float rShadeE = 0;
float rShadeF = 0;

//time
float timeA = 100;
float timeB = 350;
float timeC = 475;
float timeD = 625;
float timeE = 850;
float timeF = 900;

float transA = 255;



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////DRAW LOOP
void draw() {
  background(bgR, bgG, bgB);
  smooth();

  SunAndMoon();

  ///////////////////////////////////////////////shadingback


  fill(0, bShadeA, 0, transA);
  triangle(width/2, 80, 200, 450, 300, 450);

  fill(0, bShadeB, 0, transA);
  triangle(width/2, 80, 300, 450, 400, 450);

  fill(0, bShadeC, 0, transA);
  triangle(width/2, 80, 400, 450, 500, 450);

  fill(0, bShadeD, 0, transA);
  triangle(width/2, 80, 500, 450, 600, 450);

  fill(0, bShadeE, 0, transA);
  triangle(width/2, 80, 600, 450, 700, 450);

  fill(0, bShadeF, 0, transA);
  triangle(width/2, 80, 700, 450, 800, 450);



  ///////////////////////////////////////////////shadingleft
  fill(lShadeA, 0, 0, transA);
  triangle(350, 150, 200, 450, 300, 450);

  fill(lShadeB, 0, 0, transA);
  triangle(350, 150, 300, 450, 400, 450);

  fill(lShadeC, 0, 0, transA);
  triangle(350, 150, 400, 450, 500, 450);

  fill(lShadeD, 0, 0, transA);
  triangle(350, 150, 500, 450, 600, 450);

  fill(lShadeE, 0, 0, transA);
  triangle(350, 150, 600, 450, 700, 450);

  fill(lShadeF, 0, 0, transA);
  triangle(350, 150, 700, 450, 800, 450);

  ///////////////////////////////////////////////shadingright
  fill(0, 0, rShadeA, transA);
  triangle(650, 150, 200, 450, 300, 450);

  fill(0, 0, rShadeB, transA);
  triangle(650, 150, 300, 450, 400, 450);

  fill(0, 0, rShadeC, transA);
  triangle(650, 150, 400, 450, 500, 450);

  fill(0, 0, rShadeD, transA);
  triangle(650, 150, 500, 450, 600, 450);

  fill(0, 0, rShadeE, transA);
  triangle(650, 150, 600, 450, 700, 450);

  fill(0, 0, rShadeF, transA);
  triangle(650, 150, 700, 450, 800, 450);


  ///////////////////////////////////////////////shadingmath

  if (SunX>-50 && SunX<timeA) {
    bShadeA = bShadeA+5;
  }
  else if (SunX>timeA && SunX<timeB) {
    bShadeB = bShadeB+5;
  }
  else if (SunX>timeB && SunX<timeC) {
    bShadeC = bShadeC+5;
  }
  else if (SunX>timeC && SunX<timeD) {
    bShadeD = bShadeD+5;
  }
  else if (SunX>timeD && SunX<timeE) {
    bShadeE = bShadeE+5;
  }
  else if (SunX>timeE && SunX<1000) {
    bShadeF = bShadeF+5;
  }

  if (SunX>-50 && SunX<timeA) {
    lShadeA = lShadeA+5;
  }
  else if (SunX>timeA && SunX<timeB) {
    lShadeB = lShadeB+5;
  }
  else if (SunX>timeB && SunX<timeC) {
    lShadeC = lShadeC+5;
  }
  else if (SunX>timeC && SunX<timeD) {
    lShadeD = lShadeD+5;
  }
  else if (SunX>timeD && SunX<timeE) {
    lShadeE = lShadeE+5;
  }
  else if (SunX>timeE && SunX<1000) {
    lShadeF = lShadeF+5;
  }

  if (SunX>-50 && SunX<timeA) {
    rShadeA = rShadeA+5;
  }
  else if (SunX>timeA && SunX<timeB) {
    rShadeB = rShadeB+5;
  }
  else if (SunX>timeB && SunX<timeC) {
    rShadeC = rShadeC+5;
  }
  else if (SunX>timeC && SunX<timeD) {
    rShadeD = rShadeD+5;
  }
  else if (SunX>timeD && SunX<timeE) {
    rShadeE = rShadeE+5;
  }
  else if (SunX>timeE && SunX<1000) {
    rShadeF =rShadeF+5;
  }
  else {
    //back
    bShadeA = random(255);
    bShadeB = random(255);
    bShadeC = random(255);
    bShadeD = random(255);
    bShadeE = random(255);
    bShadeF = random(255);

    //left
    lShadeA = random(255);
    lShadeB = random(255);
    lShadeC = random(255);
    lShadeD = random(255);
    lShadeE = random(255);
    lShadeF = random(255);

    //right
    rShadeA = random(255);
    rShadeB = random(255);
    rShadeC = random(255);
    rShadeD = random(255);
    rShadeE = random(255);
    rShadeF = random(255);
  }






  ///////////////////////////////////////////////shadingmath


  fill(0);
  stroke(255, 255, 255, 25);
  rect(0, 450, 1000, 200); 
  bioPrism();
  println (SunX);

  fill(255, 0, 0);
  rect(200, 445, 100, 5);

  if (mousePressed && mouseX>=200 && mouseY>=445 && mouseX<=300 && mouseY<=455) {
    SunX = SunX-2;
    fill(255, 100, 100);
  rect(200, 445, 100, 5);
  }
  else {
    SunX=SunX;
  } 

  fill(255, 100, 0);
  rect(300, 445, 100, 5);
  
    if (mousePressed && mouseX>=300 && mouseY>=445 && mouseX<=400 && mouseY<=455) {
    bShadeA-=2;
    bShadeB-=2;
    bShadeC-=2;
    bShadeD-=2;
    bShadeE-=2;
    bShadeF-=2;

    //left
    lShadeA-=2;
    lShadeB-=2;
    lShadeC-=2;
    lShadeD-=2;
    lShadeE-=2;
    lShadeF-=2;

    //right
    rShadeA-=2;
    rShadeB-=2;
    rShadeC-=2;
    rShadeD-=2;
    rShadeE-=2;
    rShadeF-=2;
    fill(255, 150, 100);
  rect(300, 445, 100, 5);
  }
  else {
    SunX=SunX;
  } 


  fill(255, 255, 0);
  rect(400, 445, 100, 5);
float c=0;

  if (mousePressed && mouseX>=400 && mouseY>=445 && mouseX<=500 && mouseY<=455) {
    fill(r);
    
    r=random(255); 
    rect(x, y, 5, 5);
     y = y + speed;
     speed = speed+gravity;
     if (y>445){
       y=445;
       if (speed<.6){
         speed=0;
       }
       else{
         speed=speed * -.7;
             }
     }
  
    fill(255, 150, 150);
  rect(400, 445, 100, 5);
  }


  fill(0, 255, 100);
  rect(500, 445, 100, 5);
  
   if (mousePressed && mouseX>=500 && mouseY>=445 && mouseX<=600 && mouseY<=455) {
  transA-=2;
  fill(255, 100, 150);
  rect(500, 445, 100, 5);
  }
  else {
    transA=255;
  } 

  fill(50, 50, 255);
  rect(600, 445, 100, 5);
    if (mousePressed && mouseX>=600 && mouseY>=445 && mouseX<=700 && mouseY <=455) {
      SunX = -50;}
      fill(255, 150, 200);
  rect(600, 445, 100, 5);

  fill(100, 0, 255);
  rect(700, 445, 100, 5);
  
  if (mousePressed && mouseX>=700 && mouseY >=445 && mouseX<=800 && mouseY<=455){
 fill(100, 100, 255);
  rect(600, 445, 100, 5);
  transA = 0;}



  if (SunX>1000) {
    bgR=bgR+2;
    bgG=bgG+2;
    bgB=bgB+2;
  }
  else {
    bgR=0;
    bgG=0;
    bgB=0;
  }
    }


