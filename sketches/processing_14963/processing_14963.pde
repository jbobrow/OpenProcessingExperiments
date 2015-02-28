


int card = 0;
PFont font;
PImage opening;
PImage parch;
PImage opt2b;
PImage opt3b;
PImage opt4c;
PImage opt4b;
PImage opt3c;
PImage opt5b;
PImage opt6b;
PImage opt7c;
PImage opt6a;
PImage opt7a;
PImage opt7b;
PImage opt8a;
PImage opt2c;
PImage opt2a;
PImage opt3a;
PImage opt4a;
PImage opt5a;



boolean move=true;

void setup() {
  size(640, 480);
  smooth();

  opening= loadImage("dma28_ aesops tales.png");
  parch= loadImage("talabheim_paper.jpeg");
  opt2b = loadImage("AT2b.png");
  opt3b=loadImage("AT3b.png");
  opt4c=loadImage("AT4c.png");
  opt4b=loadImage("AT4b.png");
  opt3c=loadImage("AT3c.png");
  opt5b=loadImage("AT5b.png");
  opt6b=loadImage("AT6b.png");
  opt7c=loadImage("AT7c.png");
  opt6a=loadImage("AT6a.png");
  opt7a=loadImage("AT7a.png");
  opt7b=loadImage("AT7b.png");
  opt8a=loadImage("AT8a.png");
  opt2c=loadImage("AT2c.png");
  opt2a=loadImage("AT2a.png");
  opt3a=loadImage("AT3a.png");
  opt4a=loadImage("AT4a.png");
  opt5a=loadImage("AT5a.png");
}



void draw() {
  imageMode(CENTER);
  image(parch,0,0);
  imageMode(CORNER);

  if (card == 0) {
    image(opening,0,0,width,height);


    fill(255, 86,139,96);
    strokeWeight(10);
    stroke(255, 86,139);


    //swallow
    ellipse(50,240, 70,70);
    if(mouseX>40 && mouseX<60) {
      if (mousePressed && move) {
        move=false;
        float d = dist(mouseX, mouseY,50, 240);
        if (d < 25) {
          card = 1;
        }
      }
    }  

    //astrologer
    ellipse(450,180, 70,70);
    if(mouseX>440 && mouseX<460) {
      if (mousePressed && move) {
        move=false;
        float d = dist(mouseX, mouseY, 450,180);
        if (d < 25) {
          card = 2;
        }
      }
    }

    //ant
    ellipse(308,332, 70,70);
    if(mouseX>299 && mouseX<320) {
      if (mousePressed && move) {
        move=false;
        float d = dist(mouseX, mouseY, 308,332);
        if (d < 25) {
          card = 14;
        }
      }
    }
  }
  else if (card == 1) {

    image(opt2b,0,0,width,height);
    ellipse(484,67,30,30);

    if (mousePressed && move) {
      move=false;
      float d= dist(mouseX,mouseY,484,67);
      if(d<25) {
        card = 3;
      }
    }
  } 
  //merr scared of strangers
  else if (card == 2) {
    image(opt2c,0,0,width,height);
    ellipse(149,93,40,40);
    if(mousePressed & move) {
      move=false;
      float d=dist(mouseX,mouseY,149,93);
      if(d<25) {
        card=6;
      }
    }
  } 

  else if (card == 3) {
    image(opt3b,0,0,width,height);


    //money vacay
    ellipse(312,268,70,70);
    if(mouseX>290 && mouseX<330) {
      if (mousePressed && move) 
      {
        move=false;
        float d= dist(mouseX,mouseY,312,268);
        if(d<25) {
          card = 5;
        }
      }
    }
    //buy back clothes
    ellipse(366,324,70,70);
    if (mousePressed && move) 
    {
      move=false;
      float d= dist(mouseX,mouseY,366,324);
      if(d<25) {
        card = 4;
      }
    }
  }

  //buy back
  else if (card == 4) {
    image(opt4b,0,0,width,height);
    ellipse(215,235,60,60);
    if(mousePressed && move) {
      move=false;
      float d= dist(mouseX,mouseY,215,235);
      if(d<25) {
        card=6;
      }
    }
  } 

  //vaycay
  else if (card == 5) {
    image(opt4c,0,0,width,height);
    ellipse(563,324,70,70);

    if(mousePressed & move) {
      move=false;
      float d= dist(mouseX,mouseY, 563,324);
      if(d<25) {
        card= 7;
      }
    }
  }
  //life of line
  else if(card==6) {
    image(opt3c,0,0,width,height);
    ellipse(149,93,40,40);
    if(mousePressed & move) {
      move=false;
      float d=dist(mouseX,mouseY,149,93);
      if(d<25) {
        card=0;
      }
    }
  }
  //rose encounter
  else if(card==7) {

    image(opt5b,0,0,width,height);

    ellipse(88,351,30,30);
    if(mouseX>80 && mouseX<100) {
      if(mousePressed & move) {
        move=false;
        float d= dist(mouseX,mouseY,88,351);
        if(d<25) {
          card=8;
        }
      }
    }

    ellipse(210,327,30,30);
    if(mousePressed & move) {
      move=false;
      float d=dist(mouseX,mouseY,210,327);
      if(d<25) {
        card=10;
      }
    }
  }
  //court(madelove)
  else if(card==10) {
    image(opt6a,0,0,width,height);
    ellipse(140,456,50,50);
    if(mouseX>130 && mouseX< 150) {
      if(mousePressed & move) {
        move=false;
        float dd=dist(mouseX,mouseY,140,456);
        if(dd<25) {
          card=12;
        }
      }
    }

    ellipse(140,382,50,50);
    if(mousePressed&move) {
      move=false;
      float d=dist(mouseX,mouseY,140,382);
      if(d<25) {
        card=11;
      }
    }
  }

  //butterfly kills
  else if(card==11) {
    image(opt7a,0,0,width,height);
    ellipse(572,378,40,40);
    if(mousePressed & move) {
      move=false;
      float d=dist(mouseX,mouseY, 572,378);
      if (d<25) {
        card=0;
      }
    }
  }

  //steals petals to make perfume

  else if(card==12) {
    image(opt7b,0,0,width,height);
    ellipse( 547,327,50,50);
    if(mousePressed & move) {
      move= false;
      float d=dist(mouseX,mouseY, 547,327);
      if(d<25) {
        card=13;
      }
    }
  }
  //wolf in sheep's clothing
  else if(card==13) {
    image(opt8a,0,0,width,height);
    ellipse(149,93,40,40);


    if(mousePressed & move) {
      move=false;
      float d=dist(mouseX,mouseY,149,93);
      if(d<25) {
        card=0;
      }
    }
  }

  //converse
  else if(card==8) {
    ellipse(351,74,50,50);
    image(opt6b,0,0,width,height);
    if(mousePressed & move) {
      move=false;
      float d=dist(mouseX,mouseY,351,74);
      if(d<25) {
        card=9;
      }
    }
  }
  //make like famous
  else if(card==9) {
    image(opt7c,0,0,width,height);
    ellipse(149,93,40,40);
    if(mousePressed & move) {
      move=false;
      float d=dist(mouseX,mouseY,149,93);
      if(d<25) {
        card=0;
      }
    }
  }
  //listen to own advice
  else if(card==14) {
    image(opt2a,0,0,width,height);
    ellipse(463,389,20,20);
    if(mousePressed & move) {
      move=false;
      float d=dist(mouseX,mouseY,463,389);
      if(d<25) {
        card=15;
      }
    }
  }
  //follow leaopard
  else if(card==15) {
    image(opt3a,0,0,width,height);
    ellipse(317,214,20,20);
    if(mousePressed & move) {
      move=false;
      float d=dist(mouseX,mouseY,317,214 );
      if(d<25) {
        card=16;
      }
    }
  }


  else if(card==16) {
    image(opt4a,0,0,width,height);
    ellipse(42,148,20,20);
    if(mouseX>30 && mouseX<58){
      if(mousePressed & move){
        move=false;
        float d=dist(mouseX,mouseY,42,148);
        if(d<25){
          card=17;}}}
    
    ellipse(585,130,20,20);
    
    if(mousePressed & move) {
      move=false;
      float d=dist(mouseX,mouseY,585,130);
      if(d<25) {
        card=5;
      }
    }
  }


  else if(card==17) {
    image(opt5a,0,0,width,height);
    if(mousePressed & move) {
      move=false;
      float d=dist(mouseX,mouseY,463,389);
      if(d<25) {
        card=0;
      }
    }
  }
}





void mouseReleased() {
  move=true;
}


