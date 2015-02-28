
class Piano {


  int x1 = 0;
  int y1 = 0;

  int xp = mouseX;
  int yp = mouseY;
  boolean button = false;
  int w_w =100;
  int h_w =250;
  int w_b =70;
  int h_b =150;
  int spa =5;
  float x2 = w_w+spa/2;
  float y2 = 0;




  float [] values = new float [1000];

  Piano () {

    display();
  }


  void display () {

    if (button==false) {// initialize flower face change condition to no butoon has been pressed condition
      flowerkey=1;// assign 1 to no key pressed, 2 to black key has been pressed and 3 to white key has been pressed.
    }

    //key pressing
    //white key # 01

      if ( (mouseX > 0 && mouseX < 65 && mouseY > 0 && mouseY < 250 && mousePressed)||(mouseX> 65 && mouseX < 100 && mouseY > 150 && mouseY< 250 && mousePressed)) {

      button = true;
    } 
    else {
      button = false;
    }
    rectMode(CORNER);
    if (button) {
      fill(0,160,219);
      beginShape();
      vertex(0,0);
      vertex(65,0);
      vertex(65,h_b);
      vertex(100,h_b);
      vertex(100,250);
      vertex(0,250);
      endShape(CLOSE);
      flowerkey=3;
      song = minim.loadFile("C.mp3");
      song.play();
    } 
    else {
      fill(255);
      beginShape();
      vertex(0,0);
      vertex(65,0);
      vertex(65,h_b);
      vertex(100,h_b);
      vertex(100,250);
      vertex(0,250);
      endShape(CLOSE);
    }


    //black key # 01
    if ( mouseX > 65 && mouseX < 135 && mouseY > 0 && mouseY < h_b && mousePressed) {
      button = true;
    } 
    else {
      button = false;
    }

    if (button) {
      fill(54,41,131);
      rect(65,0,70,h_b);
      flowerkey=2;
      song = minim.loadFile("C#.mp3");
      song.play();
    }
    else {
      fill(0);
      rect(65,0,70,h_b);
    }

    //white key # 02
    if ( (mouseX > 137.5 && mouseX < 172.5 && mouseY > 0 && mouseY < 150 && mousePressed)||(mouseX > 105 && mouseX < 205 && mouseY > 150 && mouseY < 250 && mousePressed)) {
      button = true;
    } 
    else {
      button = false;
    }

    if (button) {
      fill(160,31,128);
      rect(135,0,37.5,h_b);
      rect(105,h_b,100,100);
      flowerkey=3;
      song = minim.loadFile("D.mp3");
      song.play();
    }
    else {
      fill(255);
      rect(135,0,37.5,h_b);
      rect(105,h_b,100,100);
    }

    //black key # 02
    if ( mouseX > 172.5 && mouseX < 242.5 && mouseY > 0 && mouseY < h_b && mousePressed) {
      button = true;
    } 
    else {
      button = false;
    }

    if (button) {
      fill(228,2,116);
      rect(172.5,0,70,h_b);
      flowerkey=2;
      song = minim.loadFile("D#.mp3");
      song.play();
    }
    else {
      fill(0);
      rect(172.5,0,70,h_b);
    }


    //white key # 03
    if ( (mouseX > 210 && mouseX < 242.5 && mouseY > 150 && mouseY < 250 && mousePressed) || (mouseX > 242.5 && mouseX < 310 && mouseY > 0 && mouseY < 250 && mousePressed) ) {
      button = true;
    } 
    else {
      button = false;
    }

    if (button) {
      fill(227,30,47);
      beginShape();
      vertex(242.5, 0);
      vertex(310,0);
      vertex(310,250);
      vertex(210,250);
      vertex(210,h_b);
      vertex(242.5,h_b);
      endShape(CLOSE);
      flowerkey=3;song = minim.loadFile("E.mp3");
      song.play();
    }
    else {
      fill(255);
      beginShape();
      vertex(242.5, 0);
      vertex(310,0);
      vertex(310,250);
      vertex(210,250);
      vertex(210,h_b);
      vertex(242.5,h_b);
      endShape(CLOSE);
    }

    //white key # 04
    if ( (mouseX > 315 && mouseX < 382.5 && mouseY > 0 && mouseY < 150 && mousePressed)||(mouseX > 315 && mouseX < 415 && mouseY > 150 && mouseY < 250 && mousePressed)) {
      button = true;
    } 
    else {
      button = false;
    }

    if (button) {
      fill(236,123,35);
      beginShape();
      vertex(315,0);
      vertex(382.5,0);
      vertex(382.5,h_b);
      vertex(415,h_b);
      vertex(415,250);
      vertex(315,250);
      endShape(CLOSE);
      flowerkey=3;
      song = minim.loadFile("F.mp3");
      song.play();
    }
    else {
      fill(255);
      beginShape();
      vertex(315,0);
      vertex(382.5,0);
      vertex(382.5,h_b);
      vertex(415,h_b);
      vertex(415,250);
      vertex(315,250);
      endShape(CLOSE);
    }

    //black key # 03
    if ( mouseX > 382.5 && mouseX < 452.5 && mouseY > 0 && mouseY < h_b && mousePressed) {
      button = true;
    } 
    else {
      button = false;
    }

    if (button) {
      fill(255,233,0);
      rect(382.5,0,70,h_b);
      flowerkey=2;
      song = minim.loadFile("F#.mp3");
      song.play();
    }
    else {
      fill(0);
      rect(382.5,0,70,h_b);
    }


    //white key # 05
    if ( (mouseX > 452.5 && mouseX < 487.5 && mouseY > 0 && mouseY < 150 && mousePressed)||(mouseX > 420 && mouseX < 520 && mouseY > 150 && mouseY < 250 && mousePressed)) {
      button = true;
    } 
    else {
      button = false;
    }

    if (button) {
      fill(154,189,54);
      beginShape();
      vertex(452.5,0);
      vertex(487.5,0);
      vertex(487.5,h_b);
      vertex(520,h_b);
      vertex(520,250);
      vertex(420,250);
      vertex(420,h_b);
      vertex(452.5,h_b);
      endShape(CLOSE);
      flowerkey=3;
      song = minim.loadFile("G.mp3");
      song.play();
    }
    else {
      fill(255);
      beginShape();
      vertex(452.5,0);
      vertex(487.5,0);
      vertex(487.5,h_b);
      vertex(520,h_b);
      vertex(520,250);
      vertex(420,250);
      vertex(420,h_b);
      vertex(452.5,h_b);
      endShape(CLOSE);
    }

    //black key # 04
    if ( mouseX > 487.5 && mouseX < 557.5 && mouseY > 0 && mouseY < h_b && mousePressed) {
      button = true;
    } 
    else {
      button = false;
    }

    if (button) {
      fill(0,149,71);
      rect(487.5,0,70,h_b);
      flowerkey=2;
      song = minim.loadFile("G#.mp3");
      song.play();
    }
    else {
      fill(0);
      rect(487.5,0,70,h_b);
    }

    //white key # 06
    if ( (mouseX > 557.5 && mouseX < 592.5 && mouseY > 0 && mouseY < 150 && mousePressed)||(mouseX > 525 && mouseX < 625 && mouseY > 150 && mouseY < 250 && mousePressed)) {
      button = true;
    } 
    else {
      button = false;
    }

    if (button) {
      fill(0,154,154);
      beginShape();
      vertex(525,h_b);
      vertex(557.5,h_b);
      vertex(557.5,0);
      vertex(592.5,0);
      vertex(592.5,h_b);
      vertex(625,h_b);
      vertex(625,250);
      vertex(525,250);
      endShape(CLOSE);
      flowerkey=3;
      song = minim.loadFile("A.mp3");
      song.play();
    }
    else {
      fill(255);
      beginShape();
      vertex(525,h_b);
      vertex(557.5,h_b);
      vertex(557.5,0);
      vertex(592.5,0);
      vertex(592.5,h_b);
      vertex(625,h_b);
      vertex(625,250);
      vertex(525,250);
      endShape(CLOSE);
    }

    //black key # 05
    if ( mouseX > 592.5 && mouseX < 662.5 && mouseY > 0 && mouseY < h_b && mousePressed) {
      button = true;
    } 
    else {
      button = false;
    }

    if (button) {
      fill(177,65,145);
      rect(592.5,0,70,h_b);
      flowerkey=2;
      song = minim.loadFile("A#.mp3");
      song.play();
    }
    else {
      fill(0);
      rect(592.5,0,70,h_b);
    }

    //white key # 07
    if ( (mouseX > 662.5 && mouseX < 730 && mouseY > 0 && mouseY < 150 && mousePressed)||(mouseX > 630 && mouseX < 730 && mouseY > 150 && mouseY < 250 && mousePressed)) {
      button = true;
    } 
    else {
      button = false;
    }

    if (button) {
      fill(240,148,176);
      beginShape();
      vertex(630,h_b);
      vertex(662.5,h_b);
      vertex(662.5,0);
      vertex(730,0);
      vertex(730,250);
      vertex(630,250);
      endShape(CLOSE);
      flowerkey=3;
      song = minim.loadFile("B.mp3");
      song.play();
    }
    else {
      fill(255);
      beginShape();
      vertex(630,h_b);
      vertex(662.5,h_b);
      vertex(662.5,0);
      vertex(730,0);
      vertex(730,250);
      vertex(630,250);
      endShape(CLOSE);
    }

    //white key # 08
    if ( mouseX > 735 && mouseX < 835 && mouseY > 0 && mouseY < 250 && mousePressed) {
      button = true;
    } 
    else {
      button = false;
    }

    if (button) {
      fill(96,36,131);
      rect(735,0,100,250);
      flowerkey=3;
      song = minim.loadFile("HC.mp3");
      song.play();
    }
    else {
      fill(255);
      rect(735,0,100,250);
    }
  }
}



