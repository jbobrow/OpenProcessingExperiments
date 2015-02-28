
import ddf.minim.*;


AudioSample mother;
AudioSample lonely;
AudioSample jewish;
AudioSample yawn;
AudioSample hello;
AudioSample mozel;
AudioSample bye;
AudioSample goodbye;
AudioSample toodaloo;
AudioSample wearingthat;
AudioSample yeah2;
AudioSample thirsty;
AudioSample hamotzee;
AudioSample lala;
AudioSample matchmaker;
AudioSample photosynthesis;
AudioSample whoisshe;
AudioSample email;
AudioSample mail;
AudioSample beautiful;
AudioSample goodmorning;
AudioSample growing;
AudioSample wear;
AudioSample lechium;
AudioSample mench;
AudioSample slurp;
AudioSample colsprings;
AudioSample tap;

Minim helloo;
Minim yess;
Minim drankk;
Minim greetingg;
Minim testt;
Minim confirmm;
Minim chatt;
Minim thirstyy;
Minim byee;
Minim sadd;

int longness = 10000;
spring[] springs = new spring[longness];

boolean trigger, otrigger, prob, prob2, hasChanged, ready,grow, greet, talk1,talk2,talk3, good, bad, decent;
int state, stateCap, probability, probability2, stateCap2,sync, talkState,talk, inc, chat,spoke, talking,hotrigger, syncCount, c, d, health, counter,initiate, tr,r,g,b;
float easing = .06;
float targetx,targety,x,y,x1,y1;




int numBlobs = 1;

float blogPx = 90;
float blogPy = 45;

PGraphics pg;
int[][] vy,vx;

void setup() {
  size(640, 360, P2D);
  noCursor();
  background(0);
  pg = createGraphics(160, 90, P2D);
  vy = new int[numBlobs][pg.height];
  vx = new int[numBlobs][pg.width];
  
  for (int i = 0; i < longness; i++) {
    springs[i] = new spring(random(width), random(height), i);
  }

  trigger = false;
  otrigger = false;
  hasChanged = false;
  grow = false;
  greet = false;
  talk1 = false;
  talk2 = false;
  talk3 = false;
  good = false;
  bad = false;
  decent = false;
  ready = false;
  sync = 0;
  x = width/2;
  probability = 0;
  probability2 = 0;
  syncCount = 0;
  state = 0;
  stateCap = 0;
  stateCap2 = 0;
  initiate = 0;
  tr = 255;
  health = int(random(1,4));
  inc = 0;
  chat = 0;
  prob = false;
  prob2 = false;
  r = 0;
  g = 0;
  b = 0;
  d = 0;
  talk = 0;
  talkState = 0;
  talking = 0;
  spoke = 0;
  counter = 0;
  hotrigger = 0;
  
  helloo = new Minim(this);
  yess = new Minim(this);
  drankk = new Minim(this);
  greetingg = new Minim(this);
  testt = new Minim(this);
  confirmm = new Minim(this);
  chatt = new Minim(this);
  thirstyy = new Minim(this);
  byee = new Minim(this);
  sadd = new Minim(this);
  hello = helloo.loadSample("Hello.mp3");
  yawn = greetingg.loadSample("Yawn.mp3");
  goodmorning = greetingg.loadSample("GoodMorning.mp3");
  wear = greetingg.loadSample("Wear.mp3");
  beautiful = greetingg.loadSample("Beautiful.mp3");
  whoisshe = greetingg.loadSample("WhoIsShe.mp3");
  mozel = drankk.loadSample("Mozel.mp3");
  lechium = drankk.loadSample("Lechium.mp3");
  growing = drankk.loadSample("Growing.mp3");
  colsprings = drankk.loadSample("Springs.mp3");
  slurp = drankk.loadSample("Slurp.mp3");
  tap = drankk.loadSample("Tap.mp3");
  mench = drankk.loadSample("Mench.mp3");
  hamotzee = drankk.loadSample("Hamotzee.mp3");
  yeah2 = yess.loadSample("Yeah2.mp3");
  jewish = chatt.loadSample("Jewish.mp3");
  lala = chatt.loadSample("Lala.mp3");
  matchmaker = chatt.loadSample("Matchmaker.mp3");
  photosynthesis = chatt.loadSample("Photosynthesis.mp3");
  email = chatt.loadSample("Email.mp3");
  mail = chatt.loadSample("Mail.mp3");
  thirsty = thirstyy.loadSample("Thirsty.mp3");
  bye = byee.loadSample("Bye.mp3");
  goodbye = byee.loadSample("Goodbye.mp3");
  toodaloo = byee.loadSample("Toodaloo.mp3");
  wearingthat = byee.loadSample("WearingThat.mp3");
  lonely = sadd.loadSample("Lonely.mp3");
}


void draw() {
  frameRate(30);

 
    if (talk != 0 && talking == 0) {
      ready = true;
      spoke++;
     }
     

     if(spoke > 1) {
       talk = 0;
       talking++;
     }
     
     
     if(!ready) {
       talking = 0;
       spoke = 0;
       talk = 0;
       talkState = 0;
     }
    
      if (talkState <= 1) {
          ready = false;
          }
          
      if (talkState == 2)
          if (talking > 350) {
          ready = false;
          }
      
      if (talkState == 3)
          if (talking > 150) {
          ready = false;
          }
          
      if (talkState == 4)
          if (talking > 100) {
          ready = false;
          }
          
      if (talkState == 5)
          if (talking > 100) {
          ready = false;
          }
          
      if (talkState == 6)
          if (talking > 100) {
          ready = false;
          }
      if (talkState == 7)
          if (talking > 90) {
          ready = false;
          }
          
      if (talkState == 8)
          if (talking > 90) {
          ready = false;
          }
      
      if (talkState == 9)
          if (talking > 320) {
          ready = false;
          }
          
      if (talkState == 10)
          if (talking > 150) {
          ready = false;
          }
          
      if (talkState == 11)
          if (talking > 80) {
          ready = false;
          }
          
      if (talkState == 12)
          if (talking > 100) {
          ready = false;
          }
      if (talkState == 13)
          if (talking > 150) {
          ready = false;
          }
      if (talkState == 14)
          if (talking > 1600) {
          ready = false;
          }
          
      if (talkState == 15)
          if (talking > 70) {
          ready = false;
          }
      if (talkState == 16)
          if (talking > 150) {
          ready = false;
          }
      if (talkState == 17)
          if (talking > 40) {
          ready = false;
          }
      if (talkState == 18)
          if (talking > 60) {
          ready = false;
          }
      if (talkState == 19)
          if (talking > 190) {
          ready = false;
          }
      if (talkState == 20)
          if (talking > 200) {
          ready = false;
          }
      if (talkState == 21)
          if (talking > 650) {
          ready = false;
          }
      if (talkState == 22)
          if (talking > 850) {
          ready = false;
          }
      if (talkState == 23)
          if (talking > 650) {
          ready = false;
          }
      if (talkState == 24)
          if (talking > 90) {
          ready = false;
          }
      if (talkState == 25)
          if (talking > 80) {
          ready = false;
          }
      if (talkState == 26)
          if (talking > 720) {
          ready = false;
          }
      if (talkState == 27)
          if (talking > 200) {
          ready = false;
          }
      if (talkState == 28)
          if (talking > 650) {
          ready = false;
          }
      if (talkState == 29)
          if (talking > 330) {
          ready = false;
          }
      if (talkState == 30)
          if (talking > 300) {
          ready = false;
          }
      if (talkState == 31)
          if (talking > 90) {
          ready = false;
          }
      if (talkState == 32)
          if (talking > 80) {
          ready = false;
          }
      if (talkState == 33)
          if (talking > 720) {
          ready = false;
          }
      if (talkState == 34)
          if (talking > 80) {
          ready = false;
          }
      if (talkState == 35)
          if (talking > 720) {
          ready = false;
          }
          
    if(talk == 1) {
      talkState = 1;
    }
    
    if(talk == 2) {
      talkState = 2;
      beautiful.trigger();
    }
    if(talk == 3) {
      talkState = 3;
      yawn.trigger();
    }
    if(talk == 4) {
      talkState = 4;
      whoisshe.trigger();
    }
    if(talk == 5) {
      talkState = 5;
      goodmorning.trigger();
    }
    if(talk == 6) {
      talkState = 6;
      wear.trigger();
    }
    if(talk == 7) {
      talkState = 7;
      lechium.trigger();
    }
    if(talk == 8) {
      talkState = 8;
      mench.trigger();
    }
    if(talk == 9) {
      talkState = 9;
      slurp.trigger();
    }
    if(talk == 10) {
      talkState = 10;
      colsprings.trigger();
    }
    if(talk == 11) {
      talkState = 11;
      tap.trigger();
    }
    if(talk == 12) {
      talkState = 12;
      growing.trigger();
    }
    if(talk == 13) {
      talkState = 13;
      mozel.trigger();
    }
    if(talk == 14) {
      talkState = 14;
      hamotzee.trigger();
    }
   
   
    if(talk == 17) {
      talkState = 17;
      yeah2.trigger();
    }
    if(talk == 18) {
      talkState = 18;
      hello.trigger();
    }
    if(talk == 19) {
      talkState = 19;
    }
    if(talk == 20) {
      talkState = 20;
      jewish.trigger();
    }
    if(talk == 21) {
      talkState = 21;
      lala.trigger();
    }
    if(talk == 22) {
      talkState = 22;
      matchmaker.trigger();
    }
    if(talk == 23) {
      talkState = 23;
      photosynthesis.trigger();
    }
    if(talk == 24) {
      talkState = 24;
      mail.trigger();
    }
    if(talk == 25) {
      talkState = 25;
      email.trigger();
    }
    

    if(talk == 29) {
      talkState = 29;
      thirsty.trigger();
    }
    
    if(talk == 30) {
      talkState = 30;
      lonely.trigger();
    }
    

    if(talk == 32) {
      talkState = 32;
      bye.trigger();
    }
    if(talk == 33) {
      talkState = 33;
      goodbye.trigger();
    }
    if(talk == 34) {
      talkState = 34;
      toodaloo.trigger();
    }
    if(talk == 35) {
      talkState = 35;
      wearingthat.trigger();
    }
  
  
  if(talkState == 5 && talking > 95) {
    prob = true;
  }
  
  
  if(prob) { 
     probability++;
  }
     
  if (probability == 10) {
   if(random(1.0) < 0.6) {
     talk = 6;
    }
   }
  
  if (probability > 15) {
    probability = 0;
    prob = false;
  }
   
   println(probability);
    inc++;
    
    if(talk > 1) {
      inc = 0;
    }
    
    if(inc == 1000) {
      talk = int(random(19,27));
      chat = int(random(100, 800));
    }
    if(inc == 1200 + chat) {
      inc = 0;
    }
    
    
    println(talking);
    
    

     if (mouseX > x) {     
    fill(r,g,b,10);
    r = 255;
    b = 0;
     }
     
     if (mouseX < x) {
    fill(r,g,b,10);
    b = 255;
    r = 0;
     }
     
   x1 = mouseX;
   y1 = mouseY;
     
  targetx = x1;
  float dx = targetx - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  targety = y1;
  float dy = targety - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  
  if (dist(mouseX,mouseY,x,y) < 30) {
    sync++;
  }
  
  if (sync > 100) {
    sync = 0;
  }
  
  if(!ready) {
  
  if (sync == 70 && !talk2 && talking == 0) {
    grow = true;
    syncCount++;
    talk = 17;
    greet = true;
    talk2 = true;
  }
  }
  
  if (syncCount > 200) {
    syncCount = 0;
    sync = 0;
  }
  
  if (syncCount > 0) {
  if (grow) {
    if (dist(mouseX,mouseY,x,y) > 20) {
      if (mouseY < y) {
      initiate++;
      }
    }
    
    if (initiate == 40 && greet && talk2 && !talk3) {
       talk = int(random(7,14));
       talk3 = true;
    }
   }
  }
       
  
  if (stateCap >= 40) {
    stateCap = 0;
  }
  
  if (stateCap <= 0) {
    stateCap = 0;
  }
  
   if (stateCap2 >= 40) {
    stateCap2 = 0;
  }
  
  if (stateCap2 <= 0) {
    stateCap2 = 0;
  }
     
     if (r == 0) {
       stateCap++;
       stateCap2--;
       trigger = true;
       otrigger = false;
     }
     
     if (b == 0) {
       stateCap2++;
       stateCap--;
       trigger = false;
       otrigger = true;
     }
     
     if (stateCap > 5 && stateCap2 > 5) {
     if (trigger && !hasChanged) {
       state++;
       hasChanged = true;
     }
     
     if (otrigger && hasChanged) {
       state++;
       hasChanged = false;
       }
     }
     
     if (state == 3) {
       hotrigger++;
       
       if (hotrigger == 3 && !greet && !talk1) {
       talk = 18;
       greet = true;
       talk1 = true;
       }
     }
     
    blogPx=x/4;
    blogPy=y/4;



  //by luis2048, invented by Jim Blinn
  for (int i = 0; i < 1; i++) {
    for (int a = 0; a < pg.width; a++) {
      vx[i][a] = int(sq(blogPx-a));
    }

    for (int b = 0; b < pg.height; b++) {
      vy[i][b] = int(sq(blogPy-b)); 
    }
  }
  
   
  pg.beginDraw();
  pg.loadPixels();
  for (int b = 0; b < pg.height; b++) {
    for (int a = 0; a < pg.width; a++) {
      int m = 1;
      for (int i = 0; i < numBlobs; i++) {
        m += 80000/(vy[i][b] + vx[i][a]+1);
      
      if(health == 3) {
        good = true;
      }
      
      if(health == 2) {
        decent = true;
      }
      
      if(health == 1) {
        bad = true;
      }
      
      if(good) {
        d = 100;
      }
      if(bad) {
        c = 230;
      }
      if(decent) {
        c = 0;
      }

      float gg = m+a;
      float bb = (a+m+b+d)/2;
      
      pg.pixels[a+b*pg.width] = color(c, gg, bb);
    }
   }
  }
  
  
  
  pg.updatePixels();
  pg.endDraw();
  ellipse(x,y,10,10);
  ellipse(mouseX, mouseY, 20, 20);
  image(pg, 0, 0, width, height);
  for (int i = 0; i < longness ; i++) {
    springs[i].render();
  }
  
  if (mouseY < height - 50) {
    fadeIn();
  }
  
  if (mouseY > height - 50) {
    fadeOut();
  }
   
   if (tr == 255) {
      state = 0;
      sync = 0;
      initiate = 0;
      hotrigger = 0;
      r = 0;
      g = 0;
      b = 0;
      y = height;
      counter = 0;
      stateCap = 0;
      stateCap2 = 0;
      trigger = false;
      otrigger = false;
      hasChanged = false;
      grow = false;
      greet = false;
      talk1 = false;
      talk2 = false;
      talk3 = false;
      ready = false;
      talkState = 0;
      talking = 0;
      talk = 0;
      prob = false;
      probability = 0;
      }
}


void fadeIn() {
  fill(0,0,0,tr);
  rect(0,0,width,height);
  tr -= 15;
  
  if(tr == 60 || tr == 61) {
    
    if(health == 1) {
      talk = int(random(29,31));
    }
    
    if(health > 1) {
      talk = int(random(2,6));
    }
  }
  
  if(tr <= 0) {
    tr = 0;
  }
}

void fadeOut() {
  tr += 5;
  
  if(greet && tr == 200 || tr == 201) {
    talk = int(random(32,35));
  }
  
    if(tr >= 255) {
    tr = 255;
    }
  fill(0,0,0,tr);
  rect(0,0,width,height);
}

//by Adam Lastowka
class spring {
  float Xpos;
  float Ypos;
  float Xvel;
  float Yvel;
  float Pxpos;
  float Pypos;
  float colorness;
  spring(float tempXpos, float tempYpos, int colortemp) {
   Xpos = tempXpos;
   Ypos = tempYpos;
   colorness = colortemp;
  }
  
  void render() {
    Xpos += Xvel;
    Ypos += Yvel;
    if (talkState > 6 && talkState < 14) {
      Xvel += (3500 / dist(x1, y1, Xpos, Ypos) * ((0.009 * (x1 - Xpos))) / 50);
      Yvel += (3500 / dist(x1, y1, Xpos, Ypos) * ((0.009 * (y1 - Ypos))) / 50);
    } else {
    Xvel = Xvel / 1.04;
    Yvel = Yvel / 1.04;
    }
    colorness = dist(Xpos, Ypos, Pxpos, Pypos) * 10;
    strokeWeight(2);
    fill(colorness, 255, 255);
    stroke(colorness, 255, 255, 20);
    line(Xpos, Ypos, Pxpos, Pypos);
    Pxpos = Xpos;
    Pypos = Ypos;
  }
}


void stop()
{
  hello.close();
  mother.close();
  lonely.close();
  jewish.close();
  yawn.close();
  hello.close();
  mozel.close();
  bye.close();
  goodbye.close();
  toodaloo.close();
  wearingthat.close();
  yeah2.close();
  thirsty.close();
  hamotzee.close();
  lala.close();
  matchmaker.close();
  photosynthesis.close();
  whoisshe.close();
  email.close();
  mail.close();
  beautiful.close();
  goodmorning.close();
  growing.close();
  wear.close();
  lechium.close();
  mench.close();
  slurp.close();
  colsprings.close();
  tap.close();

  helloo.stop();
  yess.stop();
  drankk.stop();
  confirmm.stop();
  greetingg.stop();
  testt.stop();
  chatt.stop();
  thirstyy.stop();
  byee.stop();
  sadd.stop();
  
  super.stop();
}

