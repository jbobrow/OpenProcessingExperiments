
float vangerX;
float vangerY;
int   score;
int   leven;
PImage bg;
PImage img;
PImage mario;
PImage gameover;

tegenstander tegenstander1;
tegenstander tegenstander2;
tegenstander tegenstander3;
tegenstander tegenstander4;
tegenstander tegenstander5;

void setup() {
  size(900, 700);
  bg = loadImage("bg.png");
  img = loadImage("goomba.png");
  mario = loadImage("mario.png");
  gameover = loadImage("0.png");
  leven=1;
  tegenstander1 = new tegenstander(random(900), 0, 30, 30, 3);
  tegenstander2 = new tegenstander(random(900), -100, 30, 30, 3);
  tegenstander3 = new tegenstander(random(900), -350, 30, 30, 3);  
  tegenstander4 = new tegenstander(random(900), -50, 30, 30, 3);
  tegenstander5 = new tegenstander(random(900), -400, 30, 30, 3);
}

void draw() {
  vangerX = mouseX;
  vangerY = 690;
  background(bg);
  image(mario, vangerX, vangerY-125);
  tegenstander1.tekentegenstander();
  tegenstander2.tekentegenstander();
  tegenstander3.tekentegenstander();
  tegenstander4.tekentegenstander();
  tegenstander5.tekentegenstander();
  fill(255);
  textSize(32);
  text("Score: " + score, 10, 30);
}



class tegenstander {
  float x;
  int y;
  int breedte;
  int hoogte;
  int snelheid;
  
  tegenstander(float tempX, int tempY, int tempBreedte, int tempHoogte, int tempSnelheid) {
    x= tempX;
    y = tempY;
    breedte = tempBreedte;
    hoogte= tempHoogte;
    snelheid = tempSnelheid;
  }

  void tekentegenstander() {
    image(img, x-15, y-20);
    y=y+snelheid;

    if (x > vangerX && x < vangerX +50 && y > vangerY-140 && y <vangerY-65  ) {
      leven=0;
    }
    

    if  (y>700) {
      y=0;
      x=random(0, 1000);
      snelheid=snelheid+1;
      score=score+1;
    }
    if (leven==0) {
      snelheid=0;
      leven=0;
      fill(0);
      image(gameover,0,0);
      textSize(52);
      text("GAME OVER", width / 2-150, height / 2-20);
      textSize(24);
      text("Score: " + score, width/2-150, height/2+10);
      if (mouseButton == LEFT) {
        score=0;
setup();
  }
      }
  }
}



