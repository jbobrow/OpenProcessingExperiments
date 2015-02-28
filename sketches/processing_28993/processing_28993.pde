
ArrayList towers = new ArrayList();
ArrayList circleMonsters = new ArrayList();
int fr = 0;
int dualtimer = 0;
PImage path, titlepage, instructions;
int money = 700;
int LIVES = 10;

int numObadGuys = 4;
int circleHealth = 200;

boolean play = false;
boolean end = false;
boolean intro = false;
int timer = 0;
boolean title = true;

PFont file;

void setup () {
  size(640, 480);
  rectMode(CENTER);
  imageMode(CENTER);
  smooth();
  frameRate(30);

  textAlign(CENTER);

  path = loadImage("http://i294.photobucket.com/albums/mm118/OnePieceKT7/hkhk-1.jpg");
  titlepage = loadImage("http://i294.photobucket.com/albums/mm118/OnePieceKT7/ddd.jpg");
  instructions = loadImage("http://i294.photobucket.com/albums/mm118/OnePieceKT7/dd.jpg");
}


void draw () {
  /* 
   if(title) {
       dualtimer++;
       if(dualtimer <= 120) {
       image(titlepage,width/2,height/2);
   }
   else {
       title = false;
       intro = true;
       dualtimer = 0;
   }
   }
   
   if(intro) {
       image(instructions,width/2,height/2);
       fill(100);
       rect(540,460,120,40); // start
       fill(255);
       text("PLAY!", 540, 470);
   }
  */

  if (title && !intro) {
    dualtimer++;
    pushMatrix();
    image(path, 319, 239);
    popMatrix();
  
    fill(100);
    rect(540, 460, 120, 40); // start button, bottom right
    rect(100, 460, 120, 40); // how many lives, bottom left
    
    fill(255);
    if (!play || !end) {
      text("START", 540, 470);
    }
    fill(255);
    String lives = "LIVES:" + " " + nf(LIVES, 2);
    text(lives, 100, 470);
  }

  if (play) {
    fr++;
    if (fr == 25) {
      circleMonsters.add(new Circles(circleHealth));
      if (circleMonsters.size() < numObadGuys) {
        fr = 0;
      }
      if (circleMonsters.size() == numObadGuys) {
        fr = 30;
      }
    }

    for (int j=0; j<circleMonsters.size(); j++) {
      if (circleMonsters.size()>0)
        ((Circles)circleMonsters.get(j)).circleMovement();
    }

    if (circleMonsters.size() == 0) {
      timer++;
      if (timer == 120) {
        fr = 0;
        circleHealth += 35;
        numObadGuys += 1;
        timer = 0;
      }
    }
  }

  if (LIVES == 0) {
    play = false;
    end = true;
  }
}


void mousePressed() {

  if (intro) {
    if ((mouseX >= 480 && mouseX <= 600) && (mouseY >= 425 && mouseY <= 465)) {
      intro = false;
      dualtimer = 0;
    }
  }

  if (!play && !intro) {
    if ((mouseX >= 480 && mouseX <= 600) && (mouseY >= 425 && mouseY <= 465)) {
      if (dualtimer > 1)
        play = true;
    }
  }
}
class Circles {

  int xpos = -5;
  int ypos = 60;
  int speed = 2;
  int circleHP;
  PImage circle;
  boolean xLine = true;
  boolean xLine2 = true;

  Circles (int hp) {
    circleHP = hp;
    circle = loadImage("http://i294.photobucket.com/albums/mm118/OnePieceKT7/Monster.png");
  }

  void damage() {
    circleHP -= 5;
  }

  void circleMovement() {

    if (xpos < 580 && xLine) {
      xpos += speed;
    } 
    else if (ypos < 140) {
      ypos += speed;
      xLine = false;
    } 
    else if (xpos > 60 && xLine2) {
      xpos -= speed;
    } 
    else if (ypos < 220 && ypos >= 140) {
      ypos += speed;
      if (ypos == 218) {
        xLine = true;
        xLine2 = false;
      }
    }
    else if (ypos < 300 && ypos >= 220) {
      ypos += speed;
      xLine = false;
    }
    else
      xpos -= speed;

    pushMatrix();
    translate(xpos, ypos);
    image(circle, 0, 0, 40, 25);
    popMatrix();

    if (circleHP < 0) {
      circleMonsters.remove(this);
      money += 50;
    }
    if (xpos < -25) {
      LIVES -= 1;
      circleMonsters.remove(this);
    }
  }
}
                                                                                
