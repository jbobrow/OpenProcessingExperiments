
float x1=10;
float y1=60;
float x2=10;
float y2=110;

float px1=810;
float py1=380;
int counter = 0;
int counterMax = 13;

boolean page1=true;

boolean ba =false;

import gifAnimation.*;
Gif him,p,player1,player3,player4,player5,player7,press;

PImage current,a;

PFont font;
String letter, letter1;

import ddf.minim.*;
Minim minim;
AudioPlayer song,play1,play2,play3,play4,play5,play6,play7,play8,play9,play10,play11,play12;


void setup() {
  a=loadImage("scene1.jpg");
  current = a;
  size(current.width,current.height);
  him = new Gif (this,"himicon.gif");
  him.play();

  letter1=" ";
  letter=letter1;


  press=new Gif(this,"press.gif");
  player1=new Gif(this,"player1.gif"); 
  player3=new Gif(this,"player3.gif");
  player4=new Gif(this,"player4.gif");
  player5=new Gif(this,"player5.gif");
  player7=new Gif(this,"player7.gif");
  

  p=press;
  p.play();
  minim = new Minim(this);
  song = minim.loadFile("bkground.mp3");

  song.play();
  song.loop();
  play1 = minim.loadFile("play1.mp3");
  play2 = minim.loadFile("play2.mp3");
  play3 = minim.loadFile("play3.mp3");
  play4 = minim.loadFile("play4.mp3");
  play5 = minim.loadFile("play5.mp3");
  play6 = minim.loadFile("play6.mp3");
  play7 = minim.loadFile("play7.mp3");
  play8 = minim.loadFile("play8.mp3");
  play9 = minim.loadFile("play9.mp3");
  play10 = minim.loadFile("play10.mp3");
  play11 = minim.loadFile("play11.mp3");
  play12 = minim.loadFile("play12.mp3");
}

void draw() {

  background(current);
  stroke(35,185,199);
  strokeWeight(10);
  line(10,y2,x2,y2);
  imageMode(CENTER);
  image(him,x1,y1);
  image(p,px1,py1);

  font = createFont("Arial", 12);
  textFont(font);
  textAlign(CENTER, CENTER);
  if(page1) {
    drawPage1();
  }
}


void stop() {
  song.close();
  play1.close();
  minim.stop();
  super.stop();
}

void drawPage1() {
  textSize((mouseX-width/2)*3+1);
  text(letter, width/2, mouseY);
}

void keyPressed() {
  if(keyCode==LEFT) {
    counter--;
    if(counter<0) {
      counter=0;
    }
    sceneCounter();
  }
  if(keyCode==RIGHT) {
    counter++;
    if(counter>counterMax) {
      counter=counterMax;
    }
    sceneCounter();
  }
}

void mousePressed() {
  if(counter==0) {
    if(hitDetect(mouseX,mouseY,mouseX,mouseY,px1,py1,p.width,p.height)) {
      p=player1;
      player1.play();
      play1.play();
      play1.loop();
    }
  }
  if(counter==1) {
    if(hitDetect(mouseX,mouseY,mouseX,mouseY,px1,py1,p.width,p.height)) {
      page1=true;
      letter="Plumping";
    }
  }
  if(counter==2) {
    if(hitDetect(mouseX,mouseY,mouseX,mouseY,px1,py1,p.width,p.height)) {
      p=player3;
      player3.play();
      play3.play();
      play3.loop();
    }
  }
  if(counter==3) {
    if(hitDetect(mouseX,mouseY,mouseX,mouseY,px1,py1,p.width,p.height)) {
      p=player4;
      player4.play();
      play5.play();
      play5.loop();
    }
  }
  if(counter==4) {
    if(hitDetect(mouseX,mouseY,mouseX,mouseY,px1,py1,p.width,p.height)) {
      p=player5;
      player5.play();
      play11.play();
      play11.loop();
    }
  }
  if(counter==5) {
    if(hitDetect(mouseX,mouseY,mouseX,mouseY,px1,py1,p.width,p.height)) {
    }
  }
  if(counter==6) {
    if(hitDetect(mouseX,mouseY,mouseX,mouseY,px1,py1,p.width,p.height)) {
      p=player7;
      player7.play();
      play12.play();
      play12.loop();
    }
  }
  if(counter==7) {
    if(hitDetect(mouseX,mouseY,mouseX,mouseY,px1,py1,p.width,p.height)) {

    }
  }
  if(counter==8) {
    if(hitDetect(mouseX,mouseY,mouseX,mouseY,px1,py1,p.width,p.height)) {
      play4.play();
      play4.loop();
    }
  }
  if(counter==9) {
    if(hitDetect(mouseX,mouseY,mouseX,mouseY,px1,py1,p.width,p.height)) {
      play6.play();
      play6.loop();
    }
  }
  if(counter==10) {
    if(hitDetect(mouseX,mouseY,mouseX,mouseY,px1,py1,p.width,p.height)) {
      play7.play();
      play7.loop();
    }
  }
  if(counter==11) {
    if(hitDetect(mouseX,mouseY,mouseX,mouseY,px1,py1,p.width,p.height)) {
      play8.play();
      play8.loop();
    }
  }
  if(counter==12) {
    if(hitDetect(mouseX,mouseY,mouseX,mouseY,px1,py1,p.width,p.height)) {
      play9.play();
      play9.loop();
    }
  }
  if(counter==13) {
    if(hitDetect(mouseX,mouseY,mouseX,mouseY,px1,py1,p.width,p.height)) {
      play10.play();
      play10.loop();
    }
  }
}
void mouseReleased() {
  p=press;
  play1.pause();
  play2.pause();
  play3.pause();
  play4.pause();
  play5.pause();
  play6.pause();
  play7.pause();
  play8.pause();
  play8.pause();
  play9.pause();
  play10.pause();
  play11.pause();
  play12.pause();
  page1=false;
}
void sceneCounter() {
  if(counter==1) {
    x1=35;
    x2=35;
    current=loadImage("scene2.jpg");
  } 

  if(counter==2) {
    x1=50;
    x2=50;
    px1=650;
    current=loadImage("scene3.jpg");
  }
  if(counter==3) {
    px1=current.width/2;
      
    x1=75;
    x2=75;
    current=loadImage("scene4.jpg");
  }
  if(counter==4) {
    px1=current.width/2;
    x1=95;
    x2=95;
    current=loadImage("scene5.jpg");
  }
  if(counter==5) {
    x1=125;
    x2=125;
    current=loadImage("scene6.jpg");
  }
  if(counter==6) {
    x1=180;
    x2=180;
    current=loadImage("scene7.jpg");
  }
  if(counter==7) {
    x1=240;
    x2=240;
    current=loadImage("scene8.jpg");
  }
  if(counter==8) {
    x1=290;
    x2=290;
    current=loadImage("scene9.jpg");
  }
  if(counter==9) {
    x1=350;
    x2=350;
    current=loadImage("scene10.jpg");
  }
  if(counter==10) {
    x1=400;
    x2=400;
    current=loadImage("scene11.jpg");
  }

  if(counter==11) {
    x1=420;
    x2=420;
    current=loadImage("scene12.jpg");
    if(counter==12) {
      x1=500;
      x2=500;
      current=loadImage("scene13.jpg");
      if(counter==13) {
        x1=550;
        x2=550;
        current=loadImage("scene14.jpg");
      }
    }
  }
}




boolean hitDetect(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {
  w1 /= 2;
  h1 /= 2;
  w2 /= 2;
  h2 /= 2;
  if(x1 + w1 >= x2 - w2 && x1 - w1 <= x2 + w2 && y1 + h1 >= y2 - h2 && y1 - h1 <= y2 + h2) {
    return true;
  } 
  else {
    return false;
  }
}

boolean overButton(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    return true;
  }
  else {
    return false;
  }
}


