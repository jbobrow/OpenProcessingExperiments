
int score;
int lives;
PImage background;
PImage shit;
PImage bucket;
PFont tekst20;
PFont tekst30;


Shit eersteShit;
Shit tweedeShit;
Shit derdeShit;
Shit vierdeShit;


void setup() {
  size(1200, 600);
  background = loadImage("background.jpg"); //achtergrondfoto laden
  shit = loadImage("shit.png"); //birdshit foto laden
  bucket = loadImage("bucket.png");//bucket foto laden
  
  tekst20 = loadFont("DINAlternate-Bold-20.vlw");//Font 20px
  tekst30 = loadFont("DINAlternate-Bold-30.vlw");//Font 30px
  
  eersteShit = new Shit(203, -234, 1.8);
  tweedeShit = new Shit(395, -52, 1.8);
  derdeShit = new Shit(623, 29, 1.8);
  vierdeShit = new Shit(826, -40, 1.8);

  score =0; //score start bij 0
  lives =10; //levens start bij 10
}

void draw() {
  background(background); //background
  
  fill(255);
  textFont(tekst20);//font 20px laden
  text("I'll get a gun while you catch the birdshit! Keep this park clean!", 80, 30);
  text("Score:" +score, 980, 30);
  text("Lives:" +lives, 980, 50);
  
  catcher(); //bucket 

  eersteShit.updateShit();//shit1
  eersteShit.drawShit();
  eersteShit.catchShit();
  eersteShit.gameover();

  tweedeShit.updateShit();//shit2
  tweedeShit.drawShit();
  tweedeShit.catchShit();
  tweedeShit.gameover();

  derdeShit.updateShit();//shit3
  derdeShit.drawShit();
  derdeShit.catchShit();
  derdeShit.gameover();

  vierdeShit.updateShit();//shit4
  vierdeShit.drawShit();
  vierdeShit.catchShit();
  vierdeShit.gameover();

}






class Shit {
  float x;
  float y;
  float snelheid;

  Shit(int tempX, int tempY, float tempSnelheid) {
    x = tempX;
    y = tempY;
    snelheid = tempSnelheid;
  }

  void updateShit() {
    y = y + snelheid;//shit bewegen
  }

  void catchShit() {//als y in de bucket zit EN x is binnen 20px links of rechts van de muis (dus in de bucket van +- 50px) dan wordt x random tussen 50 en 1150 en y=0 en score +1
    if (y > 460 && y < 500 && x > mouseX -25 && x < mouseX + 25) {
      x = random(50,1150);
      y = 0;
      score = score + 1;
    }
    else if (y > 580) {// als niet gecatched is wordt x random tussen 50 en 1150 en y=0 en leven -1
      x = random(50,1150);
      y = 0;
      lives = lives -1;
    }

    if (score == 10) { //snelheid hoger bij 10 punten
      snelheid += 0.02;
    }
    if (score == 20) {//snelheid hoger bij 20 punten
      snelheid += 0.02;
    }
    if (score == 30) {//snelheid hoger bij 30 punten
      snelheid += 0.02;
    }
    if (score == 40) {//snelheid hoger bij 40 punten
      snelheid += 0.02;
    } 
    if (score == 50) {//snelheid hoger bij 50 punten
      snelheid += 0.02;
    } 
    if (score == 60) {//snelheid hoger bij 60 punten (70 niet gedaan want = toch onhaalbaar)
      snelheid += 0.02;
    }
  }

  
  void drawShit() {//birdshit plaatje tekenen
    image(shit, x, y);
  }

  void gameover() {// bij 0 levens gaat alle shit op y-400 zodat het uit beeld is
    if (lives == 0) {
      y = -400;
      fill(255);
      textFont(tekst30);//font 30px wordt opgeroepen
      textAlign(CENTER);
      text("GAME OVER", width/2, height/2-30);
      text("Score:" +score, width/2, height/2);
      text("Press any key to start a new game",width/2,height/2+30);
     
    if(keyPressed){//Als op een knop gedrukt wordt start setup (dus de game) opnieuw
      setup();
    }

    }
  }
}


void catcher() {//bucket plaatje wordt opgeroepen en beweegt met de muis in X richting
  image(bucket, mouseX, 460);
}



