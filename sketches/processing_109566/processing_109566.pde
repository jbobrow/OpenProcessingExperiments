
PImage luca;
PImage lucabig;
PImage ecoli;
PImage ecolibig;
PImage oak;
PImage oakbig;
PImage banana;
PImage bananabig;
PImage acoel;
PImage acoelbig;
PImage bee;
PImage beebig;
PImage lungfish;
PImage lungfishbig;
PImage croc;
PImage crocbig;
PImage coelo;
PImage coelobig;
PImage parrot;
PImage parrotbig;
PImage elephant;
PImage elephantbig;
PImage chimp;
PImage chimpbig;
PImage erectus;
PImage erectusbig;
PImage hsapien;
PImage hsapienbig;
PImage tol;
boolean clicked =false;

void setup() {
  size(920, 700);
  background(245, 243, 218);
  stroke(168, 165, 166);
  strokeCap(SQUARE);
  imageMode(CENTER);

  luca=loadImage("luca2.jpg");
  lucabig=loadImage("lucabig.jpg");
  ecoli=loadImage("ecoli.jpg");
  ecolibig=loadImage("ecolibig.jpg");
  oak=loadImage("oaktree.jpg");
  oakbig=loadImage("oakbig.jpg");
  banana=loadImage("banana.jpg");
  bananabig=loadImage("bananabig.jpg");
  acoel=loadImage("acoel.jpg");
  acoelbig=loadImage("acoelbig.jpg");
  bee=loadImage("bee.jpg");
  beebig=loadImage("beebig.jpg");
  lungfish=loadImage("lungfish.jpg");
  lungfishbig=loadImage("lungfishbig.jpg");
  croc=loadImage("croc.jpg");
  crocbig=loadImage("crocbig.jpg");
  coelo=loadImage("coelo.jpg");
  coelobig=loadImage("coelobig.jpg");
  parrot=loadImage("parrot.jpg");
  parrotbig=loadImage("parrotbig.jpg");
  elephant=loadImage("elephant.jpg");
  elephantbig=loadImage("elephantbig.jpg");
  chimp=loadImage("chimp.jpg");
  chimpbig=loadImage("chimpbig.jpg");
  erectus=loadImage("erectus.jpg");
  erectusbig=loadImage("erectusbig.jpg");
  hsapien=loadImage("hsapien.jpg");
  hsapienbig=loadImage("hsapienbig.jpg");
  tol=loadImage("tolbig.jpg");
}


void draw() {

  println (mouseX +"," + mouseY);

  smooth();
  image(luca, 130, 60);
  image(ecoli, 80, 630);
  image(oak, 140, 630);
  image(banana, 200, 630);
  image(acoel, 260, 630);
  image(bee, 320, 630);
  image(lungfish, 380, 630);
  image(croc, 440, 630);
  image(coelo, 480, 510);
  image(parrot, 520, 630);
  image(elephant, 580, 630);
  image(chimp, 640, 630);
  image(erectus, 720, 610);
  image(hsapien, 800, 630);
  image(tol, 490, 90);



  if (mousePressed==true) {

    if (mouseX>111 && mouseX<150) {//luca
      if (mouseY>40 && mouseY<80) {
        drawNormal();
        clicked=true;
        if (clicked=true) {
          drawLuca();
          drawOrigin();
        }
      }
    }

    if (mouseX>60 && mouseX<100) {//e coli
      if (mouseY>610 && mouseY<650) {
        drawNormal();
        clicked=true;
        if (clicked = true) {
          drawOne();
          drawOrigin();
        }
      }
    }

    if (mouseX>111 && mouseX<150) {//oak tree
      if (mouseY>610 && mouseY<650) {
        drawNormal();
        clicked=true;
        if (clicked = true) {
          drawTwo();
          drawOrigin();
          drawEuk();
        }
      }
    }


    if (mouseX>180 && mouseX<220) {//banana
      if (mouseY>610 && mouseY<650) {
        drawNormal();
        clicked=true;
        if (clicked=true) {
          drawThree();
          drawOrigin();
          drawEuk();
        }
      }
    }


    if (mouseX>240 && mouseX<280) {//acoel
      if (mouseY>610 && mouseY<650) {
        drawNormal();
        clicked = true;
        if (clicked=true) {
          drawFour();
          drawOrigin();
          drawEuk();
          drawBi();
        }
      }
    }
    if (mouseX>300 && mouseX<340) {//bee
      if (mouseY>610 && mouseY<650) {
        drawNormal();
        clicked = true;
        if (clicked=true) {
          drawFive();
          drawOrigin();
          drawEuk();
          drawBi();
        }
      }
    }
    if (mouseX>360 && mouseX<400) {//lungfish
      if (mouseY>610 && mouseY<650) {
        drawNormal();
        clicked=true;
        if (clicked=true) {
          drawSix();
          drawOrigin();
          drawEuk();
          drawBi();
          drawVert();
        }
      }
    }
    if (mouseX>420 && mouseX<460) {//croc
      if (mouseY>610 && mouseY<650) {
        drawNormal();
        clicked=true;
        if (clicked=true) {
          drawSeven();
          drawOrigin();
          drawEuk();
          drawBi();
          drawVert();
          drawTetra();
        }
      }
    }
    if (mouseX>460 && mouseX<500) {//coelo
      if (mouseY>490 && mouseY<530) {
        drawNormal();
        clicked=true;
        if (clicked=true) {

          drawEight();
          drawOrigin();
          drawEuk();
          drawBi();
          drawVert();
          drawTetra();
        }
      }
    }

    if (mouseX>500 && mouseX<540) {//parrot 
      if (mouseY>610 && mouseY<650) {
        drawNormal();
        clicked=true;
        if (clicked=true) {
          drawNine();
          drawOrigin();
          drawEuk();
          drawBi();
          drawVert();
          drawTetra();
        }
      }
    }
    if (mouseX>560 && mouseX<600) {//elephant
      if (mouseY>610 && mouseY<650) {
        drawNormal();
        clicked=true;
        if (clicked=true) {
          drawTen();
          drawOrigin();
          drawEuk();
          drawBi();
          drawVert();
          drawTetra();
          drawMam();
        }
      }
    }
    if (mouseX>620 && mouseX<660) {//chimp 
      if (mouseY>610 && mouseY<650) {
        drawNormal();
        clicked=true;
        if (clicked=true) {
          drawEleven();
          drawOrigin();
          drawEuk();
          drawBi();
          drawVert();
          drawTetra();
          drawHom();
          drawMam();
        }
      }
    }
    if (mouseX>700 && mouseX<740) {//h erectus
      if (mouseY>590 && mouseY<630) {
        drawNormal();
        clicked=true;
        if (clicked=true) {
          drawTwelve();
          drawOrigin();
          drawEuk();
          drawBi();
          drawVert();
          drawTetra();
          drawMam();
          drawHom();
        }
      }
    }
    if (mouseX>780 && mouseX<820) {//hsapien
      if (mouseY>610 && mouseY<650) {
        drawNormal();
        clicked=true;
        if (clicked=true) {
          drawThirteen();
          drawOrigin();
          drawEuk();
          drawBi();
          drawVert();
          drawTetra();
          drawMam();
          drawHom();
        }
      }
    }
  }
  else {

    stroke(168, 165, 166);
    strokeWeight(1.5);
    line(130, 80, 130, 100);//origin to 1 E COLI
    line(130, 100, 80, 100);
    line(80, 100, 80, 600);

    line(130, 80, 130, 100);//origin to 2 TREE
    line(130, 100, 220, 100);
    line(220, 100, 220, 140);
    line(220, 140, 170, 140);
    line(170, 140, 170, 300);
    line(170, 300, 140, 300);
    line(140, 300, 140, 600);

    line(130, 80, 130, 100);//origin to 3 BANANA
    line(130, 100, 220, 100);
    line(220, 100, 220, 140);
    line(220, 140, 170, 140);
    line(170, 140, 170, 300);
    line(170, 300, 200, 300);
    line(200, 300, 200, 600);

    line(130, 80, 130, 100);//origin to 4 ECOEL
    line(130, 100, 220, 100);
    line(220, 100, 220, 140);
    line(220, 140, 320, 140);
    line(320, 140, 320, 180);
    line(320, 180, 290, 180);
    line(290, 180, 290, 240);
    line(290, 240, 260, 240);
    line(260, 240, 260, 600);

    line(130, 80, 130, 100);//origin to 5 BEE
    line(130, 100, 220, 100);
    line(220, 100, 220, 140);
    line(220, 140, 320, 140);
    line(320, 140, 320, 180);
    line(320, 180, 290, 180);
    line(290, 180, 290, 240);
    line(290, 240, 320, 240);
    line(320, 240, 320, 600);


    line(130, 80, 130, 100);//origin to 6 LUNGFISH
    line(130, 100, 220, 100);
    line(220, 100, 220, 140);
    line(220, 140, 320, 140);
    line(320, 140, 320, 180);
    line(320, 180, 410, 180);
    line(410, 180, 410, 240);
    line(410, 240, 380, 240);
    line(380, 240, 380, 600);

    line(130, 80, 130, 100);//origin to 7 CROCODILE
    line(130, 100, 220, 100);
    line(220, 100, 220, 140);
    line(220, 140, 320, 140);
    line(320, 140, 320, 180);
    line(320, 180, 410, 180);
    line(410, 180, 410, 240);
    line(410, 240, 520, 240);
    line(520, 240, 520, 280);
    line(520, 280, 460, 280);
    line(460, 280, 460, 300);
    line(460, 300, 440, 300);
    line(440, 300, 440, 600);

    line(130, 80, 130, 100);//origin to 8 RAPTOR
    line(130, 100, 220, 100);
    line(220, 100, 220, 140);
    line(220, 140, 320, 140);
    line(320, 140, 320, 180);
    line(320, 180, 410, 180);
    line(410, 180, 410, 240);
    line(410, 240, 520, 240);
    line(520, 240, 520, 280);
    line(520, 280, 460, 280);
    line(460, 280, 460, 300);
    line(460, 300, 500, 300);
    line(500, 300, 500, 360);
    line(500, 360, 480, 360);
    line(480, 360, 480, 480);

    line(130, 80, 130, 100);//origin to 9 PARROT
    line(130, 100, 220, 100);
    line(220, 100, 220, 140);
    line(220, 140, 320, 140);
    line(320, 140, 320, 180);
    line(320, 180, 410, 180);
    line(410, 180, 410, 240);
    line(410, 240, 520, 240);
    line(520, 240, 520, 280);
    line(520, 280, 460, 280);
    line(460, 280, 460, 300);
    line(460, 300, 500, 300);
    line(500, 300, 500, 360);
    line(500, 360, 520, 360);
    line(520, 360, 520, 600);

    line(130, 80, 130, 100);//origin to 10 ELEPHANT
    line(130, 100, 220, 100);
    line(220, 100, 220, 140);
    line(220, 140, 320, 140);
    line(320, 140, 320, 180);
    line(320, 180, 410, 180);
    line(410, 180, 410, 240);
    line(410, 240, 520, 240);
    line(520, 240, 520, 280);
    line(520, 280, 620, 280);
    line(620, 280, 620, 400);
    line(620, 400, 580, 400);
    line(580, 400, 580, 600);

    line(130, 80, 130, 100);//origin to 11 CHIMP
    line(130, 100, 220, 100);
    line(220, 100, 220, 140);
    line(220, 140, 320, 140);
    line(320, 140, 320, 180);
    line(320, 180, 410, 180);
    line(410, 180, 410, 240);
    line(410, 240, 520, 240);
    line(520, 240, 520, 280);
    line(520, 280, 620, 280);
    line(620, 280, 620, 400);
    line(620, 400, 680, 400);
    line(680, 400, 680, 480);
    line(680, 480, 640, 480);
    line(640, 480, 640, 600);
    //
    line(130, 80, 130, 100);//origin to 12 H. ERECTUS
    line(130, 100, 220, 100);
    line(220, 100, 220, 140);
    line(220, 140, 320, 140);
    line(320, 140, 320, 180);
    line(320, 180, 410, 180);
    line(410, 180, 410, 240);
    line(410, 240, 520, 240);
    line(520, 240, 520, 280);
    line(520, 280, 620, 280);
    line(620, 280, 620, 400);
    line(620, 400, 680, 400);
    line(680, 400, 680, 480);
    line(680, 480, 740, 480);
    line(740, 480, 740, 560);
    line(740, 560, 720, 560);
    line(720, 560, 720, 580);

    line(130, 80, 130, 100);//origin to 13 H.SAPIEN
    line(130, 100, 220, 100);
    line(220, 100, 220, 140);
    line(220, 140, 320, 140);
    line(320, 140, 320, 180);
    line(320, 180, 410, 180);
    line(410, 180, 410, 240);
    line(410, 240, 520, 240);
    line(520, 240, 520, 280);
    line(520, 280, 620, 280);
    line(620, 280, 620, 400);
    line(620, 400, 680, 400);
    line(680, 400, 680, 480);
    line(680, 480, 740, 480);
    line(740, 480, 740, 560);
    line(740, 560, 800, 560);
    line(800, 560, 800, 600);
  }
}



void drawOne() {

  stroke(109, 9, 140);//purple ORIGIN
  strokeWeight(1.5);
  line(130, 80, 130, 100);//origin to 1 E COLI
  line(130, 100, 80, 100);
  line(80, 100, 80, 600);
  image(ecolibig, 770, 150);
  stroke(0);
  textSize(24);
  fill(0);
  text("E.coli", 750, 250);
}

void drawTwo() {
  stroke(153, 8, 23);//pink eukarya
  strokeWeight(1.5);
  line(130, 80, 130, 100);//origin to 2 TREE
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 170, 140);
  line(170, 140, 170, 300);
  line(170, 300, 140, 300);
  line(140, 300, 140, 600);
  image(oakbig, 770, 150);
  stroke(0);
  textSize(24);
  fill(0);
  text("Oak Tree", 785, 250);
}

void drawThree() {
  stroke(153, 8, 23);//pink eukarya
  strokeWeight(1.5);
  line(130, 80, 130, 100);//origin to 3 BANANA
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 170, 140);
  line(170, 140, 170, 300);
  line(170, 300, 200, 300);
  line(200, 300, 200, 600);
  image(bananabig, 770, 150);
  stroke(0);
  textSize(24);
  fill(0);
  text("Banana", 795, 284);
}

void drawFour() {
  stroke(176, 155, 7);//orange bilateria
  strokeWeight(1.5);
  line(130, 80, 130, 100);//origin to 4 ECOEL
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 320, 140);
  line(320, 140, 320, 180);
  line(320, 180, 290, 180);
  line(290, 180, 290, 240);
  line(290, 240, 260, 240);
  line(260, 240, 260, 600);
  image(acoelbig, 770, 150);
  stroke(0);
  textSize(24);
  fill(255);
  text("Acoela", 795, 225);
}

void drawFive() {
  stroke(176, 155, 7);//orange/bilateria
  strokeWeight(1.5);
  line(130, 80, 130, 100);//origin to 5 BEE
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 320, 140);
  line(320, 140, 320, 180);
  line(320, 180, 290, 180);
  line(290, 180, 290, 240);
  line(290, 240, 320, 240);
  line(320, 240, 320, 600);
  image(beebig, 770, 150);
  stroke(0);
  textSize(24);
  fill(0);
  text("Bee", 795, 250);
}

void drawSix() {
  stroke(32, 193, 5);//green vertebrate
  strokeWeight(1.5);
  line(130, 80, 130, 100);//origin to 6 LUNGFISH
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 320, 140);
  line(320, 140, 320, 180);
  line(320, 180, 410, 180);
  line(410, 180, 410, 240);
  line(410, 240, 380, 240);
  line(380, 240, 380, 600);
  image(lungfishbig, 770, 150);
  stroke(0);
  textSize(24);
  fill(255);
  text("Lungfish", 715, 120);
}


void drawSeven() {
  stroke(32, 193, 5);//green vertebrate
  strokeWeight(1.5);
  line(130, 80, 130, 100);//origin to 7 CROCODILE
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 320, 140);
  line(320, 140, 320, 180);
  line(320, 180, 410, 180);
  line(410, 180, 410, 240);
  line(410, 240, 520, 240);
  line(520, 240, 520, 280);
  line(520, 280, 460, 280);
  line(460, 280, 460, 300);
  line(460, 300, 440, 300);
  line(440, 300, 440, 600);
  image(crocbig, 770, 150);
  stroke(0);
  textSize(24);
  fill(255);

  text("Crocodile", 725, 245);
}

void drawEight() {
  stroke(32, 193, 5);//green vertebrate
  strokeWeight(1.5);
  line(130, 80, 130, 100);//origin to 8 RAPTOR
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 320, 140);
  line(320, 140, 320, 180);
  line(320, 180, 410, 180);
  line(410, 180, 410, 240);
  line(410, 240, 520, 240);
  line(520, 240, 520, 280);
  line(520, 280, 460, 280);
  line(460, 280, 460, 300);
  line(460, 300, 500, 300);
  line(500, 300, 500, 360);
  line(500, 360, 480, 360);
  line(480, 360, 480, 480);
  image(coelobig, 770, 150);
  stroke(0);
  textSize(24);
  fill(255);
  text("Coelophysis", 700, 245);
}

void drawNine() {
  stroke(32, 193, 5);//green vertebrate
  strokeWeight(1.5);
  line(130, 80, 130, 100);//origin to 9 PARROT
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 320, 140);
  line(320, 140, 320, 180);
  line(320, 180, 410, 180);
  line(410, 180, 410, 240);
  line(410, 240, 520, 240);
  line(520, 240, 520, 280);
  line(520, 280, 460, 280);
  line(460, 280, 460, 300);
  line(460, 300, 500, 300);
  line(500, 300, 500, 360);
  line(500, 360, 520, 360);
  line(520, 360, 520, 600);
  image(parrotbig, 770, 150);
  stroke(0);
  textSize(24);
  fill(255);
  text("Parrot", 700, 245);
}

void drawTen() {
  stroke(2, 211, 177);//green vertebrate
  strokeWeight(1.5);
  line(130, 80, 130, 100);//origin to 10 ELEPHANT
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 320, 140);
  line(320, 140, 320, 180);
  line(320, 180, 410, 180);
  line(410, 180, 410, 240);
  line(410, 240, 520, 240);
  line(520, 240, 520, 280);
  line(520, 280, 620, 280);
  line(620, 280, 620, 400);
  line(620, 400, 580, 400);
  line(580, 400, 580, 600);
  image(elephantbig, 770, 150);
  stroke(0);
  textSize(24);
  fill(255);
  text("Elephant", 710, 255);
}

void drawEleven() {
  stroke(0, 41, 229);//light blue hominidae
  strokeWeight(1.5);
  line(130, 80, 130, 100);//origin to 11 CHIMP
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 320, 140);
  line(320, 140, 320, 180);
  line(320, 180, 410, 180);
  line(410, 180, 410, 240);
  line(410, 240, 520, 240);
  line(520, 240, 520, 280);
  line(520, 280, 620, 280);
  line(620, 280, 620, 400);
  line(620, 400, 680, 400);
  line(680, 400, 680, 480);
  line(680, 480, 640, 480);
  line(640, 480, 640, 600);
  image(chimpbig, 770, 150);
  stroke(0);
  textSize(24);
  fill(255);
  text("Chimp", 730, 265);
}

void drawTwelve() {
  stroke(10, 16, 123);//dark blue homo
  strokeWeight(1.5);
  line(130, 80, 130, 100);//origin to 12 H. ERECTUS
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 320, 140);
  line(320, 140, 320, 180);
  line(320, 180, 410, 180);
  line(410, 180, 410, 240);
  line(410, 240, 520, 240);
  line(520, 240, 520, 280);
  line(520, 280, 620, 280);
  line(620, 280, 620, 400);
  line(620, 400, 680, 400);
  line(680, 400, 680, 480);
  line(680, 480, 740, 480);
  line(740, 480, 740, 560);
  line(740, 560, 720, 560);
  line(720, 560, 720, 580);
  image(erectusbig, 770, 150);
  stroke(0);
  textSize(24);
  fill(0);
  text("Homo erectus", 695, 250);
}

void drawThirteen() {
  stroke(10, 16, 123);//dark blue homo
  strokeWeight(1.5);
  line(130, 80, 130, 100);//origin to 13 H.SAPIEN
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 320, 140);
  line(320, 140, 320, 180);
  line(320, 180, 410, 180);
  line(410, 180, 410, 240);
  line(410, 240, 520, 240);
  line(520, 240, 520, 280);
  line(520, 280, 620, 280);
  line(620, 280, 620, 400);
  line(620, 400, 680, 400);
  line(680, 400, 680, 480);
  line(680, 480, 740, 480);
  line(740, 480, 740, 560);
  line(740, 560, 800, 560);
  line(800, 560, 800, 600);
  image(hsapienbig, 770, 150);
  stroke(0);
  textSize(24);
  fill(255);
  text("Homo sapien", 695, 250);
}


void drawLuca() {
  image(lucabig, 770, 150);
  textSize(28);
  fill(255);
  text("LUCA", 780, 250);
  
}

void drawOrigin() {
  textSize(16);
  fill(0);
  text("Last Universal Common Ancestor", 30, 35);
}

void drawEuk() {
  textSize(16);
  fill(0);
  text("EUKARYA", 225, 125);
}

void drawBi() {
  textSize(16);
  fill(0);
  text("BILATERIA", 325, 165);
}

void drawVert() {
  textSize(16);
  fill(0);
  text("VERTEBRATE", 420, 220);
}

void drawTetra() {
  textSize(16);
  fill(0);
  text("TETRAPOD", 530, 265);
}

void drawMam() {
  textSize(16);
  fill(0);
  text("MAMMALIA", 630, 350);
}

void drawHom() {
  textSize(16);
  fill(0);
  text("HOMINID", 690, 450);
}

void drawNormal() {
  stroke(168, 165, 166);
  strokeWeight(1.5);
  line(130, 80, 130, 100);//origin to 1 E COLI
  line(130, 100, 80, 100);
  line(80, 100, 80, 600);

  line(130, 80, 130, 100);//origin to 2 TREE
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 170, 140);
  line(170, 140, 170, 300);
  line(170, 300, 140, 300);
  line(140, 300, 140, 600);

  line(130, 80, 130, 100);//origin to 3 BANANA
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 170, 140);
  line(170, 140, 170, 300);
  line(170, 300, 200, 300);
  line(200, 300, 200, 600);

  line(130, 80, 130, 100);//origin to 4 ECOEL
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 320, 140);
  line(320, 140, 320, 180);
  line(320, 180, 290, 180);
  line(290, 180, 290, 240);
  line(290, 240, 260, 240);
  line(260, 240, 260, 600);

  line(130, 80, 130, 100);//origin to 5 BEE
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 320, 140);
  line(320, 140, 320, 180);
  line(320, 180, 290, 180);
  line(290, 180, 290, 240);
  line(290, 240, 320, 240);
  line(320, 240, 320, 600);


  line(130, 80, 130, 100);//origin to 6 LUNGFISH
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 320, 140);
  line(320, 140, 320, 180);
  line(320, 180, 410, 180);
  line(410, 180, 410, 240);
  line(410, 240, 380, 240);
  line(380, 240, 380, 600);

  line(130, 80, 130, 100);//origin to 7 CROCODILE
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 320, 140);
  line(320, 140, 320, 180);
  line(320, 180, 410, 180);
  line(410, 180, 410, 240);
  line(410, 240, 520, 240);
  line(520, 240, 520, 280);
  line(520, 280, 460, 280);
  line(460, 280, 460, 300);
  line(460, 300, 440, 300);
  line(440, 300, 440, 600);

  line(130, 80, 130, 100);//origin to 8 RAPTOR
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 320, 140);
  line(320, 140, 320, 180);
  line(320, 180, 410, 180);
  line(410, 180, 410, 240);
  line(410, 240, 520, 240);
  line(520, 240, 520, 280);
  line(520, 280, 460, 280);
  line(460, 280, 460, 300);
  line(460, 300, 500, 300);
  line(500, 300, 500, 360);
  line(500, 360, 480, 360);
  line(480, 360, 480, 480);

  line(130, 80, 130, 100);//origin to 9 PARROT
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 320, 140);
  line(320, 140, 320, 180);
  line(320, 180, 410, 180);
  line(410, 180, 410, 240);
  line(410, 240, 520, 240);
  line(520, 240, 520, 280);
  line(520, 280, 460, 280);
  line(460, 280, 460, 300);
  line(460, 300, 500, 300);
  line(500, 300, 500, 360);
  line(500, 360, 520, 360);
  line(520, 360, 520, 600);

  line(130, 80, 130, 100);//origin to 10 ELEPHANT
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 320, 140);
  line(320, 140, 320, 180);
  line(320, 180, 410, 180);
  line(410, 180, 410, 240);
  line(410, 240, 520, 240);
  line(520, 240, 520, 280);
  line(520, 280, 620, 280);
  line(620, 280, 620, 400);
  line(620, 400, 580, 400);
  line(580, 400, 580, 600);

  line(130, 80, 130, 100);//origin to 11 CHIMP
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 320, 140);
  line(320, 140, 320, 180);
  line(320, 180, 410, 180);
  line(410, 180, 410, 240);
  line(410, 240, 520, 240);
  line(520, 240, 520, 280);
  line(520, 280, 620, 280);
  line(620, 280, 620, 400);
  line(620, 400, 680, 400);
  line(680, 400, 680, 480);
  line(680, 480, 640, 480);
  line(640, 480, 640, 600);
  //
  line(130, 80, 130, 100);//origin to 12 H. ERECTUS
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 320, 140);
  line(320, 140, 320, 180);
  line(320, 180, 410, 180);
  line(410, 180, 410, 240);
  line(410, 240, 520, 240);
  line(520, 240, 520, 280);
  line(520, 280, 620, 280);
  line(620, 280, 620, 400);
  line(620, 400, 680, 400);
  line(680, 400, 680, 480);
  line(680, 480, 740, 480);
  line(740, 480, 740, 560);
  line(740, 560, 720, 560);
  line(720, 560, 720, 580);

  line(130, 80, 130, 100);//origin to 13 H.SAPIEN
  line(130, 100, 220, 100);
  line(220, 100, 220, 140);
  line(220, 140, 320, 140);
  line(320, 140, 320, 180);
  line(320, 180, 410, 180);
  line(410, 180, 410, 240);
  line(410, 240, 520, 240);
  line(520, 240, 520, 280);
  line(520, 280, 620, 280);
  line(620, 280, 620, 400);
  line(620, 400, 680, 400);
  line(680, 400, 680, 480);
  line(680, 480, 740, 480);
  line(740, 480, 740, 560);
  line(740, 560, 800, 560);
  line(800, 560, 800, 600);


  fill(245, 243, 218);//COVERING UP
  noStroke();
  rectMode(CORNER);
  rect(30, 0, 290, 30);//cover LUCA text
  rect(225, 110, 80, 25);//cover euk
  rect(325, 150, 81, 25);//cover bilat
  rect(420, 203, 100, 30); //cover vertabrate  
  rect(530, 252, 83, 20);//cover tetrapod
  rect(630, 330, 92, 30);//oover mammalia
  rect(691, 425, 100, 30);//cover homonid
}



