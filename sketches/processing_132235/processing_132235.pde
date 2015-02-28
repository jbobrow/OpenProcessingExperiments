
PImage jungle;
int richting =7;
int teller2 =0;
int y;
int teller=0;

VallendeBanaan banaan1;



import ddf.minim.*;  //aanvulling op basisopdracht
Minim minim;
AudioPlayer music; 

void setup() {
  size (900, 710);

  jungle = loadImage("achtergrond.jpg"); //aanvulling op basisopdracht

  banaan1 = new VallendeBanaan();

  minim = new Minim(this);
  music = minim.loadFile("jungle.mp3"); 
  music.loop();
}


void draw () {
  background (jungle); 
  GameOver();
  TellersZichtbaar();
  LevelOmhoog();
  Aap();
  banaan1.vallendObject();
  banaan1.aapVangt();
  banaan1.aapMist();
}


//aanvulling op basisopdracht
void GameOver() {
  if (teller2 == 3) {
    textSize(150);
    fill (255, 0, 0);
    text("GAME OVER", 30, 300);
    y=y;
  }
  else {
    y=y+richting;
  }
}

//aanvulling op basisopdracht
void TellersZichtbaar() {
  textSize(50);
  fill(0, 255, 0);
  text (teller, 40, 60);
  fill (255, 0, 0);
  text (teller2, 800, 60);
}

//aanvulling op basisopdracht
void LevelOmhoog() {
  if (teller > 10) {
    richting = richting+1;
    teller = 0;
  }

  if (teller == 10) {
    textSize(80);
    fill(160, 124, 38);
    text ("NEXT LEVEL", 200, 300);
  }
}




void Aap() {

  //rechter oor
  stroke (0);
  fill (160, 124, 38);
  ellipseMode (CENTER);
  ellipse (mouseX+96, 418, 40, 40);

  //linker oor
  stroke (0);
  fill (160, 124, 38);
  ellipseMode (CENTER);
  ellipse (mouseX+8, 418, 40, 40);

  //binnenkant linker oor
  stroke (0);
  fill (192, 143, 118);
  ellipseMode (CENTER);
  ellipse (mouseX+15, 423, 25, 20);

  //binnekant rechter oor
  stroke (0);
  fill (192, 143, 118);
  ellipseMode (CENTER);
  ellipse (mouseX+89, 423, 25, 20);

  //lichaam
  stroke (0);
  fill (160, 124, 38);
  ellipseMode (CENTER);
  ellipse (mouseX+56, 574, 111, 174);

  //hoofd
  stroke (0); 
  fill (160, 124, 38);
  ellipseMode (CENTER);
  ellipse (mouseX+53, 458, 69, 123);

  //oog wit
  stroke (0);
  fill (255);
  ellipseMode (CENTER);
  ellipse (mouseX+53, 457, 60, 88);

  //lijn tussen de ogen
  stroke(0);
  strokeWeight(2); 
  fill (0);
  line (mouseX+53, 414, mouseX+53, 505);

  //neus 
  fill (236, 211, 236);
  ellipseMode (CENTER);
  ellipse (mouseX+54, 492, 108, 61);


  //linker pupil
  fill (0);
  ellipseMode (CENTER);
  ellipse (mouseX+63, 454, 8, 15);

  //rechter pupil
  fill (0);
  ellipseMode (CENTER);
  ellipse (mouseX+43, 454, 8, 15); 

  //lijnen linkerbeen
  stroke(0);
  strokeWeight(2); 
  fill (0);
  line (mouseX+36, 685, mouseX+36, 649);

  stroke(0);
  strokeWeight(2); 
  fill (0);
  line (mouseX+16, 679, mouseX+16, 636);

  //lijnen rechterbeen
  stroke(0);
  strokeWeight(2); 
  fill (0);
  line (mouseX+76, 685, mouseX+76, 649);

  stroke(0);
  strokeWeight(2); 
  fill (0);
  line (mouseX+96, 679, mouseX+96, 636);

  //lijnen linkerarm
  stroke(0);
  strokeWeight(2); 
  fill (0);
  line (mouseX-47, 505, mouseX-47, 561);

  stroke(0);
  strokeWeight(2); 
  fill (0);
  line (mouseX-27, 501, mouseX-27, 544);

  stroke (0);
  strokeWeight (2);
  fill (0);
  line (mouseX-47, 561, mouseX+1, 561);

  stroke (0);
  strokeWeight (2);
  fill (0);
  line (mouseX-24, 542, mouseX+2, 542);

  //lijnen rechterarm
  stroke(0);
  strokeWeight(2); 
  fill (0);
  line (mouseX+159, 505, mouseX+159, 561);

  stroke(0);
  strokeWeight(2); 
  fill (0);
  line (mouseX+139, 501, mouseX+139, 544);

  stroke (0);
  strokeWeight (2);
  fill (0);
  line (mouseX+109, 561, mouseX+158, 561);

  stroke (0);
  strokeWeight (2);
  fill (0);
  line (mouseX+109, 542, mouseX+137, 542);



  //linkerpoot
  stroke (0);
  fill (160, 124, 38);
  ellipseMode (CENTER);
  ellipse (mouseX+96, 696, 50, 30);

  //rechterpoot
  stroke (0);
  fill (160, 124, 38);
  ellipseMode (CENTER);
  ellipse (mouseX+ 19, 696, 48, 30);

  //linkerhand
  stroke (0);
  fill (160, 124, 38);
  ellipseMode (CENTER);
  ellipse (mouseX+158, 491, 50, 30);

  //rechterhand
  stroke (0);
  fill (160, 124, 38);
  ellipseMode (CENTER);
  ellipse (mouseX-43, 491, 48, 30);

  //linkerbeen 
  noStroke ();
  fill (160, 124, 38);
  rectMode (CENTER);
  rect (mouseX+87, 664, 18, 60);

  //rechterbeen
  noStroke ();
  fill (160, 124, 38);
  rectMode (CENTER);
  rect (mouseX+27, 664, 18, 60);

  //linkerarm
  noStroke ();
  fill (160, 124, 38);
  rectMode (CENTER);
  rect (mouseX+-10, 552, 70, 18);

  noStroke ();
  fill (160, 124, 38);
  rectMode (CENTER);
  rect (mouseX+-36, 526, 18, 70);


  //rechterarm
  noStroke ();
  fill (160, 124, 38);
  rectMode (CENTER);
  rect (mouseX+124, 552, 70, 18);

  noStroke ();
  fill (160, 124, 38);
  rectMode (CENTER);
  rect (mouseX+150, 526, 18, 70);
}


class VallendeBanaan {
  float x;



  VallendeBanaan() {
    x=random(50, 850);
  }

  void vallendObject() {
    PImage banaan;
    banaan = loadImage("banaan.png");
    image(banaan, x, y);
  }

  void aapVangt() { 
    if (x < mouseX +70 && x > mouseX-40 && y > 398) {
      y=0;
      teller = teller+1;
      println(teller); 
      x=random(50, 850);
    }
  }

  void aapMist() {
    if (y > 700) {
      y=0; 
      teller2 = teller2 +1;
      println(teller2);
      x=random(50, 850);
    }
  }
}



