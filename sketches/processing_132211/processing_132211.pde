
worm mijnWorm1;
worm mijnWorm2;
worm mijnWorm3;
worm mijnWorm4;
worm mijnWorm5;
worm mijnWorm6;
worm mijnWorm7;

PImage achtergrond;
PImage vogels;

int point= 0;
int Lives =3;
float richting;



void setup () {
  size(497, 750);

  achtergrond = loadImage("boom.jpg");  //afbeeldingen
  vogels = loadImage("vogels2.png");

  mijnWorm1= new worm (50, 0, 4);
  mijnWorm2= new worm (100, 0, 2);
  mijnWorm3= new worm (150, 0, 3);
  mijnWorm4= new worm (200, 0, 4);
  mijnWorm5= new worm (250, 0, 5);
  mijnWorm6= new worm (300, 0, 4);
  mijnWorm7= new worm (370, 0, 3);
}



void draw () {

  mijnWorm1.achtergrond();
  mijnWorm1.drawWorm();
  mijnWorm1.update();
  mijnWorm1.vogels();
  mijnWorm1.testRand ();
  mijnWorm1.points ();

  mijnWorm2.drawWorm ();
  mijnWorm2.update();
  mijnWorm2.testRand ();

  mijnWorm3.update();
  mijnWorm3.testRand ();
  mijnWorm3.drawWorm ();  

  mijnWorm4.update();
  mijnWorm4.testRand ();
  mijnWorm4.drawWorm ();

  mijnWorm5.update();
  mijnWorm5.testRand ();
  mijnWorm5.drawWorm ();

  mijnWorm6.update();
  mijnWorm6.testRand ();
  mijnWorm6.drawWorm ();

  mijnWorm7.update();
  mijnWorm7.testRand ();
  mijnWorm7.drawWorm ();

  textSize(50);
  fill(255, 200, 200, 99);
  noStroke();
  rect(250, 50, 240, 160);
  stroke(1);
  fill(0);
  text("Score " + point, 250, 100);   //aantal punten in beeld
  text("Levens " + Lives, 250, 180);  //aantal levens in beeld
}


class worm { //class vallende wormpjes

  float wormY =100;
  float wormX =100;
  float richting=7;

  worm(int tempX, int tempY, int tempRichting) {
    wormX = tempX;
    wormY = tempY; //de positie van de banaan bepalen door wat ingevuld wordt bij de setup
    richting = tempRichting;
  }

  void achtergrond () {
    image(achtergrond, 0, 0);
  }

  void drawWorm () {
    fill(255, 200, 200);
    ellipse(wormX, wormY, 10, 10);
    ellipse(wormX+4, wormY+4, 10, 10);
    ellipse(wormX+7, wormY+9, 10, 10);
    ellipse(wormX+11, wormY+12, 10, 10);
    ellipse(wormX+16, wormY+13, 10, 10);  
    ellipse(wormX+21, wormY+12, 10, 10);  
    ellipse(wormX+25, wormY+13, 10, 10);  
    ellipse(wormX+29, wormY+16, 10, 10);  
    ellipse(wormX+32, wormY+20, 10, 10);
  }

  void update() {
    wormY = wormY + richting;   //de wormpjes vallen
    richting=richting*1.0002;  //de wormpjes vallen sneller
                                 //extra bij de basisopdracht
  }


  void vogels() {
    imageMode(CENTER);
    image(vogels, mouseX, 680);
    imageMode(CORNERS);
  }


  void testRand () {
    if (wormY > 600 && wormX > mouseX-100 && wormX < mouseX+100) { //vakje om vogels
      wormY=0;
      point = point+1;   //score neemt toe
      wormX = random (10, 480);
    }

    else if (wormY > 730) {
      Lives = Lives-1; //levens nemen af
      wormY=0;
    }

    if (Lives == 0) { //als je 0 levens hebt--> gameover
      gameover();
    }
  }


  void points () {     //extra bij de basisopdracht

    if (point < 11) {
      fill(255, 200, 200, 99);
      noStroke();
      rect(7, 50, 190, 60);
      stroke(1);
      fill(0);
      text("LEVEL 1", 10, 100);
    }

    if (point > 10 && point < 30) {

      fill(255, 200, 200, 99);
      noStroke();
      rect(7, 50, 190, 60);
      stroke(1);
      fill(0);      
      text("LEVEL 2", 10, 100);
    }

    if (point > 29 && point < 50) {
      fill(255, 200, 200, 99);
      noStroke();
      rect(7, 50, 190, 60);
      stroke(1);
      fill(0);      
      text("LEVEL 3", 10, 100);

      fill(255, 200, 200, 99);
      rect(160, 420, 170, 30);
      fill(0);
      textSize(20);
      text("Let's speed up!", 170, 440);
    }

    if (point > 49 && point < 70) {
      fill(255, 200, 200, 99);
      noStroke();
      rect(7, 50, 190, 60);
      stroke(1);
      fill(0);      
      text("LEVEL 4", 10, 100);
    }

    if (point > 69 && point <90) {
      fill(255, 200, 200, 99);
      noStroke();
      rect(7, 50, 190, 60);
      stroke(1);
      fill(0);      
      text("LEVEL 5", 10, 100);
    
          fill(255, 200, 200, 99);
      rect(200, 420, 100, 30);
      fill(0);
      textSize(20);
      text("Nice job!", 210, 440);
      
    }

    if (point > 89 && point <110) {
      fill(255, 200, 200, 99);
      noStroke();
      rect(7, 50, 190, 60);
      stroke(1);
      fill(0);      
      text("LEVEL 6", 10, 100);
      if (point >100 && point <110){
          fill(255, 200, 200, 99);
      rect(160, 420, 120, 30);
      fill(0);
      textSize(20);
      text("Over 100!", 170, 440);
      }
    }

    if (point > 109 && point <130) {
      fill(255, 200, 200, 99);
      noStroke();
      rect(7, 50, 190, 60);
      stroke(1);
      fill(0);      
      text("LEVEL 7", 10, 100); 
    
    }
    
    if (point > 129 && point <150) {
      fill(255, 200, 200, 99);
      noStroke();
      rect(7, 50, 190, 60);
      stroke(1);
      fill(0);      
      text("LEVEL 8", 10, 100);
    }

    if (point > 149) {
      fill(255, 200, 200, 99);
      noStroke();
      rect(7, 50, 190, 60);
      stroke(1);
      fill(0);      
      text("LEVEL 9", 10, 100);
    }
  }
}


void gameover() {     //extra bij de basisopdracht
  noLoop();     //spel moet stoppen
  setup();    //weer de setup afspelen
  textSize(50);
  background (255, 200, 200);

  fill(255, 99);
  rect(50, 210, 400, 100);
  fill(0);
  text("GAME OVER!", 100, 270);
  fill(255, 200, 200);

  fill(255, 99);
  rect(50, 510, 400, 130);
  fill(0);
  text("Press ENTER to", 60, 560);
  text("restart", 160, 620);

  image(vogels, 110, 275);
}

void keyPressed() {      //extra bij de basisopdracht
  if (keyCode == ENTER) {
    Lives=3;  //gegevens terugzetten
    point = 0;   //gegevens terugzetten
    loop();  //spel mag weer lopen
  }
}



