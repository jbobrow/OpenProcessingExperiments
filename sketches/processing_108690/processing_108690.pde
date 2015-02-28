

import ddf.minim.*;
Minim minim;
AudioPlayer player;

PImage pole, woman, man1, man2, wman1, wman2, heart, money;

boolean heartFlag = false, moneyFlag = false, heartshow = false, moneyshow = false;
int posx = 500, timer = 0, speed = 3;

void setup() {
  size(1200, 650);
  
  pole = loadImage("pole.png");
  woman = loadImage("w.png");
  man1 = loadImage("m1.png");
  man2 = loadImage("m2.png");
  wman1 = loadImage("m1p.png");
  wman2 = loadImage("m2p.png");
  heart = loadImage("heart.png");
  money = loadImage("money.png");
  
  // Init Minim
  minim = new Minim(this);
}

void draw() {
  background(0);
  
  image(pole, 300, 150);
  image(heart, 210, 120);
  image(money, 890, 120);
  
  image(man1, 160, 240);
  image(man2, 790, 240);
  
  image(woman, posx, 28);
  if(timer % 1 == 0) {
    if(heartFlag) {
      posx -= speed;
      if(posx <= 152) {
        heartFlag = false;
        heartshow = true;
      }
    }
    if(moneyFlag) {
      posx += speed;
      if(posx >= 832) {
        moneyFlag = false;
        moneyshow = true;
      }
    }
  }
  timer++;
  
  if(heartshow)
    image(wman1, 110, 420);
  if(moneyshow)
    image(wman2, 800, 420);
}

void mousePressed() {
  if(!heartFlag && !moneyFlag && mouseX > 210 && mouseX < 310 && mouseY > 120 && mouseY < 220) {
    minim.stop();
    player = minim.loadFile("m1.mp3");
    player.loop(0);
    heartFlag = true;
    heartshow = moneyshow = false;
  }
  if(!heartFlag && !moneyFlag && mouseX > 890 && mouseX < 990 && mouseY > 120 && mouseY < 220) {
    minim.stop();
    player = minim.loadFile("m2.mp3");
    player.loop(0);
    moneyFlag = true;
    heartshow = moneyshow = false;
  }
}



