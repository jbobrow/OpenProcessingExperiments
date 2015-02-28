
import ddf.minim.*;
Minim minim;
AudioSample breakb;

float X, Y;
float amX, amY;
float es;
float b1X, b1Y, b2X, b2Y, b3X, b3Y, b4X, b4Y, b5X, b5Y, 
b6X, b6Y, b7X, b7Y, b8X, b8Y, b9X, b9Y, b10X, b10Y, b11X, b11Y, 
b12X, b12Y, b13X, b13Y, b14X, b14Y, b15X, b15Y;
float b1sX, b1sY, b2sX, b2sY, b3sX, b3sY, b4sX, b4sY, b5sX, b5sY, 
b6sX, b6sY, b7sX, b7sY, b8sX, b8sY, b9sX, b9sY, b10sX, b10sY, b11sX, b11sY, 
b12sX, b12sY, b13sX, b13sY, b14sX, b14sY, b15sX, b15sY;
float b1f, b2f, b3f, b4f, b5f, b6f, b7f, b8f, b9f, b10f, b11f, b12f, b13f, 
b14f, b15f;
float mbsX, mbsY;

void setup() {
  size(400, 600);
  minim = new Minim(this);
  breakb = minim.loadSample("breakb.mp3", 2048);
  X=width/2;
  Y=height/2;
  rectMode(CENTER);
  textAlign(CENTER);
  noStroke();
  smooth();
}

void draw() {
  background(255);
  fill(0);
  rect(mouseX, height-50, 60, 10);

  if (X==width/2 && Y==height/2) {
    if (amX==0 && amY==0) { 
      fill(200);
      rect(width/2, height/2-100, 200, 100);
      fill(0);
      text("Simple Breakout", width/2, height/2-100);
      text("Click to Start", width/2, height/2-80);
      text("by Eiichi Ishii", width/2+65, height/2-35);
    }
  } 

  if (X>width || X<0) {
    amX=-amX;
  }  
  if (Y<0) {
    amX=random(-5, 5);
    amY=-amY;
  }
  if (X>=mouseX-mbsX && X<=mouseX+mbsX ) {
    if (Y>height-50-mbsY) {
      amX=random(-5, 5);
      amX=-amX;
      amY=-amY;
    }
  }

  if (X>=b1X-b1sX && X<=b1X+b1sX) {
    if (Y>=b1Y-b1sY && Y<=b1Y+b1sY) {
      breakb.trigger();
      b1sX=0;
      b1sY=0;
      amX=-amX;
      amY=-amY;
    }
  } 
  if (X>=b2X-b2sX && X<=b2X+b2sX) {
    if (Y>=b2Y-b2sY && Y<=b2Y+b2sY) {
      breakb.trigger();
      b2sX=0;
      b2sY=0;
      amX=-amX;
      amY=-amY;
    }
  } 
  if (X>=b3X-b3sX && X<=b3X+b3sX) {
    if (Y>=b3Y-b3sY && Y<=b3Y+b3sY) {
      breakb.trigger();
      b3sX=0;
      b3sY=0;
      amX=-amX;
      amY=-amY;
    }
  } 
  if (X>=b4X-b4sX && X<=b4X+b4sX) {
    if (Y>=b4Y-b4sY && Y<=b4Y+b4sY) {
      breakb.trigger();
      b4sX=0;
      b4sY=0;
      amX=-amX;
      amY=-amY;
    }
  } 
  if (X>=b5X-b5sX && X<=b5X+b5sX) {
    if (Y>=b5Y-b5sY && Y<=b5Y+b5sY) {
      breakb.trigger();
      b5sX=0;
      b5sY=0;
      amX=-amX;
      amY=-amY;
    }
  } 
  if (X>=b6X-b6sX && X<=b6X+b6sX) {
    if (Y>=b6Y-b6sY && Y<=b6Y+b6sY) {
      breakb.trigger();
      b6sX=0;
      b6sY=0;
      amX=-amX;
      amY=-amY;
    }
  } 
  if (X>=b7X-b7sX && X<=b7X+b7sX) {
    if (Y>=b7Y-b7sY && Y<=b7Y+b7sY) {
      breakb.trigger();
      b7sX=0;
      b7sY=0;
      amX=-amX;
      amY=-amY;
    }
  } 
  if (X>=b8X-b8sX && X<=b8X+b8sX) {
    if (Y>=b8Y-b8sY && Y<=b8Y+b8sY) {
      breakb.trigger();
      b8sX=0;
      b8sY=0;
      amX=-amX;
      amY=-amY;
    }
  } 
  if (X>=b9X-b9sX && X<=b9X+b9sX) {
    if (Y>=b9Y-b9sY && Y<=b9Y+b9sY) {
      breakb.trigger();
      b9sX=0;
      b9sY=0;
      amX=-amX;
      amY=-amY;
    }
  }
  if (X>=b10X-b10sX && X<=b10X+b10sX) {
    if (Y>=b10Y-b10sY && Y<=b10Y+b10sY) {
      breakb.trigger();
      b10sX=0;
      b10sY=0;
      amX=-amX;
      amY=-amY;
    }
  }
  if (X>=b11X-b11sX && X<=b11X+b11sX) {
    if (Y>=b11Y-b11sY && Y<=b11Y+b11sY) {
      breakb.trigger();
      b11sX=0;
      b11sY=0;
      amX=-amX;
      amY=-amY;
    }
  }
  if (X>=b12X-b12sX && X<=b12X+b12sX) {
    if (Y>=b12Y-b12sY && Y<=b12Y+b12sY) {
      breakb.trigger();
      b12sX=0;
      b12sY=0;
      amX=-amX;
      amY=-amY;
    }
  }
  if (X>=b13X-b13sX && X<=b13X+b13sX) {
    if (Y>=b13Y-b13sY && Y<=b13Y+b13sY) {
      breakb.trigger();
      b13sX=0;
      b13sY=0;
      amX=-amX;
      amY=-amY;
    }
  }
  if (X>=b14X-b14sX && X<=b14X+b14sX) {
    if (Y>=b14Y-b14sY && Y<=b14Y+b14sY) {
      breakb.trigger();
      b14sX=0;
      b14sY=0;
      amX=-amX;
      amY=-amY;
    }
  }
  if (X>=b15X-b15sX && X<=b15X+b15sX) {
    if (Y>=b15Y-b15sY && Y<=b15Y+b15sY) {
      breakb.trigger();
      b15sX=0;
      b15sY=0;
      amX=-amX;
      amY=-amY;
    }
  }

  if (Y>height-20) {
    Y=height-19;
    amX=0;
    amY=0;
    fill(0);
    text("GAME OVER", width/2, height/2);
    text("Click to Restart", width/2, height/2+20);
  } 
  if (amX>0 && amY>0) {
    if (b1sX==0 && b2sX==0 && b3sX==0 && b4sX==0 && b5sX==0 && b6sX==0
      && b7sX==0 && b8sX==0 && b9sX==0 && b10sX==0 && b11sX==0 
      && b12sX==0 && b13sX==0 && b14sX==0 && b15sX==0) {
      text("CLEAR!!", width/2, height/2);
      X=width/2;
      Y=height/2;
      es=0;
    }
  } 
  X=X+amX;
  Y=Y+amY;
  ellipse(X, Y, es, es);
  fill(b1f);
  rect(b1X, b1Y, b1sX, b1sY);
  fill(b2f);
  rect(b2X, b2Y, b2sX, b2sY);
  fill(b3f);
  rect(b3X, b3Y, b3sX, b3sY);
  fill(b4f);
  rect(b4X, b4Y, b4sX, b4sY);
  fill(b5f);
  rect(b5X, b5Y, b5sX, b5sY);
  fill(b6f);
  rect(b6X, b6Y, b6sX, b6sY);
  fill(b7f);
  rect(b7X, b7Y, b7sX, b7sY);
  fill(b8f);
  rect(b8X, b8Y, b8sX, b8sY);
  fill(b9f);
  rect(b9X, b9Y, b9sX, b9sY);
  fill(b10f);
  rect(b10X, b10Y, b10sX, b10sY);
  fill(b11f);
  rect(b11X, b11Y, b11sX, b11sY);
  fill(b12f);
  rect(b12X, b12Y, b12sX, b12sY);
  fill(b13f);
  rect(b13X, b13Y, b13sX, b13sY);
  fill(b14f);
  rect(b14X, b14Y, b14sX, b14sY);
  fill(b15f);
  rect(b15X, b15Y, b15sX, b15sY);

  fill(200, 100);
  rect(0, 0, 200, 100);
  fill(0);
  text("amX:", 30, 20);
  text(amX, 65, 20);
  text("amY:", 30, 35);
  text(amY, 65, 35);
}

void mouseClicked() {
  X=mouseX;
  Y=height-150;
  amX=0;
  amY=3;
  mbsX=60;
  mbsY=10;
  b1X=80;
  b1Y=height/3;
  b2X=160;
  b2Y=height/3;
  b3X=240;
  b3Y=height/3;
  b4X=320;
  b4Y=height/3;
  b5X=120;
  b5Y=height/3+25;
  b6X=200;
  b6Y=height/3+25;
  b7X=280;
  b7Y=height/3+25;
  b8X=160;
  b8Y=height/3+50;
  b9X=240;
  b9Y=height/3+50; 
  b10X=60;
  b10Y=height/2+15; 
  b11X=340;
  b11Y=height/2+15; 
  b12X=40;
  b12Y=height/3-50; 
  b13X=360;
  b13Y=height/3-50;
  b14X=200;
  b14Y=height/3-50;
  b15X=200;
  b15Y=height/2+50;
  b1sX=45;
  b1sY=15;
  b2sX=45;
  b2sY=15;
  b3sX=45;
  b3sY=15;
  b4sX=45;
  b4sY=15;
  b5sX=45;
  b5sY=15;
  b6sX=45;
  b6sY=15;
  b7sX=45;
  b7sY=15;
  b8sX=45;
  b8sY=15;
  b9sX=45;
  b9sY=15;
  b10sX=45;
  b10sY=15;
  b11sX=45;
  b11sY=15;
  b12sX=45;
  b12sY=15;
  b13sX=45;
  b13sY=15;
  b14sX=45;
  b14sY=15;
  b15sX=45;
  b15sY=15;
  b1f=random(120);
  b2f=random(120);
  b3f=random(120);
  b4f=random(120);
  b5f=random(120);
  b6f=random(120);
  b7f=random(120);
  b8f=random(120);
  b9f=random(120);
  b10f=random(120);
  b11f=random(120);
  b12f=random(120);
  b13f=random(120);
  b14f=random(120);
  b15f=random(120);
  es=20;
}   

void stop() {
  breakb.close();
  minim.stop();

  super.stop();
}


