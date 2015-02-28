
import ddf.minim.*;
PImage pink;
PImage macklemore;
PImage rihanna;
PImage justin;
PFont Berns;
PFont Futura;

Minim minim;
AudioPlayer pinkAudio;
AudioPlayer macklemoreAudio;
AudioPlayer rihannaAudio;
AudioPlayer justinAudio;

void setup() {
  size(1000, 500);
  background(0);

  Berns = loadFont("BernSansCT-Regular-48.vlw");
  Futura = loadFont("Futura-MediumItalic-28.vlw");
  
  //Album covers
  pink = loadImage("pink-featuring-nate-ruess-just-give-me-a-reason-2013-a.JPG");
  macklemore = loadImage("macklemore_theheist.jpg");
  rihanna = loadImage("Rihanna-cover-250x250.jpg");
  justin = loadImage("justin-timberlake-cover.jpg");

  //Audio
  minim = new Minim(this);
  pinkAudio = minim.loadFile("Pink.mp3");
  macklemoreAudio = minim.loadFile("Macklemore.mp3");
  rihannaAudio = minim.loadFile("Rihanna.mp3");
  justinAudio = minim.loadFile("Justin.mp3");
}

void draw() {
  image(pink, 0, 0);
  image(macklemore, 750, 0);
  image(rihanna, 500, 0);
  image(justin, 250, 0);

  noStroke();

  //pink background
  if (pinkAudio.isPlaying()) {
    fill(0, 0, 0, 210);
    rect(250, 0, 750, 250);
    rect(0, 250, width, 250);

    textFont(Futura);
    fill(255);
    text("'Just Give Me A Reason' - P!NK", 290, 300);

    noStroke();

    fill(241, 245, 67);
    beginShape();
    for (int i = 0; i < pinkAudio.bufferSize(); i++) {
      //go through all frequencies for this point in time
      float x = map(i, 0, pinkAudio.bufferSize(), 0, width);
      float y = pinkAudio.left.get(i)*100 + 375;
      vertex(x, y);
    }
    endShape();

    fill(71, 191, 176);
    beginShape();
    for (int i = 0; i < pinkAudio.bufferSize(); i++) {
      //go through all frequencies for this point in time
      float x = map(i, 0, pinkAudio.bufferSize(), 0, width);
      float y = pinkAudio.left.get(i)*50 + 375;
      vertex(x, y);
    }
    endShape();

    fill(255);
    beginShape();
    for (int i = 0; i < pinkAudio.bufferSize(); i++) {
      //go through all frequencies for this point in time
      float x = map(i, 0, pinkAudio.bufferSize(), 0, width);
      float y = pinkAudio.left.get(i)*25 + 375;
      vertex(x, y);
    }
    endShape();

    if (mouseY > 250) {
      fill(255,132, 0, 100);
      rect (0, 250, width, 250);

      textSize(72);
      textFont(Berns);
      fill(255);
      text("stop", 450, 390);
    }
  } 
  else { 
    if (mouseX < 250 && mouseY < 250) {
      fill (255, 0, 0, 100);
      rect (0, 0, 250, 250);

      textSize(72);
      textFont(Berns);
      fill(255);
      text("PLAY", 90, 140);
    }
  }

  //justin background
  if (justinAudio.isPlaying()) {
    fill(0, 0, 0, 210);
    rect(0, 0, 250, 250);
    rect(500, 0, 500, 250);
    rect(0, 250, width, 250);

    textFont(Futura);
    fill(255);
    text("'Mirrors' - JUSTIN TIMBERLAKE", 280, 300);

    fill(70);
    beginShape();
    for (int i = 0; i < justinAudio.bufferSize(); i++) {
      //go through all frequencies for this point in time
      float x = map(i, 0, justinAudio.bufferSize(), 0, width);
      float y = justinAudio.left.get(i)*100 + 375;
      vertex(x, y);
    }
    endShape();

    fill(214, 204, 93);
    beginShape();
    for (int i = 0; i < justinAudio.bufferSize(); i++) {
      //go through all frequencies for this point in time
      float x = map(i, 0, justinAudio.bufferSize(), 0, width);
      float y = justinAudio.left.get(i)*75 + 375;
      vertex(x, y);
    }
    endShape();

    fill(255);
    beginShape();
    for (int i = 0; i < justinAudio.bufferSize(); i++) {
      //go through all frequencies for this point in time
      float x = map(i, 0, justinAudio.bufferSize(), 0, width);
      float y = justinAudio.left.get(i)*50 + 375;
      vertex(x, y);
    }
    endShape();

    if (mouseY > 250) {
      fill(255,132, 0, 100);
      rect (0, 250, width, 250);

      textSize(72);
      textFont(Berns);
      fill(255);
      text("stop", 450, 390);
    }
  } 
  else {
    if ((mouseX > 250 && mouseY < 250) && (mouseX < 500 && mouseY < 250)) {
      fill (255, 0, 0, 100);
      rect (250, 0, 250, 250);

      textSize(72);
      textFont(Berns);
      fill(255);
      text("PLAY", 340, 140);
    }
  }

  //rihanna background
  if (rihannaAudio.isPlaying()) {
    fill(0, 0, 0, 210);
    rect(750, 0, 250, 250);
    rect(0, 0, 500, 250);
    rect(0, 250, width, 250);

    textFont(Futura);
    fill(255);
    text("'Stay' - RIHANNA", 370, 300);

    fill(167, 105, 3);
    beginShape();
    for (int i = 0; i < rihannaAudio.bufferSize(); i++) {
      //go through all frequencies for this point in time
      float x = map(i, 0, rihannaAudio.bufferSize(), 0, width);
      float y = rihannaAudio.left.get(i)*150 + 375;
      vertex(x, y);
    }
    endShape();

    fill(70);
    beginShape();
    for (int i = 0; i < rihannaAudio.bufferSize(); i++) {
      //go through all frequencies for this point in time
      float x = map(i, 0, rihannaAudio.bufferSize(), 0, width);
      float y = rihannaAudio.left.get(i)*100 + 375;
      vertex(x, y);
    }
    endShape();

    fill(255);
    beginShape();
    for (int i = 0; i < rihannaAudio.bufferSize(); i++) {
      //go through all frequencies for this point in time
      float x = map(i, 0, rihannaAudio.bufferSize(), 0, width);
      float y = rihannaAudio.left.get(i)*50 + 375;
      vertex(x, y);
    }
    endShape();

    if (mouseY > 250) {
      fill(255,132, 0, 100);
      rect (0, 250, width, 250);

      textSize(72);
      textFont(Berns);
      fill(255);
      text("stop", 450, 390);
    }
  } 
  else {  
    if ((mouseX > 500 && mouseY < 250) && (mouseX < 750 && mouseY < 250)) {
      fill (255, 0, 0, 100);
      rect (500, 0, 250, 250);

      textSize(72);
      textFont(Berns);
      fill(255);
      text("PLAY", 590, 140);
    }
  }

  //macklemore background
  if (macklemoreAudio.isPlaying()) {
    fill(0, 0, 0, 210);
    rect(0, 0, 750, 250);
    rect(0, 250, width, 250);

    textFont(Futura);
    fill(255);
    text("'Can't Hold Us' - MACKLEMORE & RYAN LEWIS", 200, 300);

    fill(211, 195, 143);
    beginShape();
    for (int i = 0; i < macklemoreAudio.bufferSize(); i++) {
      //go through all frequencies for this point in time
      float x = map(i, 0, macklemoreAudio.bufferSize(), 0, width);
      float y = macklemoreAudio.left.get(i)*75 + 375;
      vertex(x, y);
    }
    endShape();

    fill(70);
    beginShape();
    for (int i = 0; i < macklemoreAudio.bufferSize(); i++) {
      //go through all frequencies for this point in time
      float x = map(i, 0, macklemoreAudio.bufferSize(), 0, width);
      float y = macklemoreAudio.left.get(i)*50 + 375;
      vertex(x, y);
    }
    endShape();

    fill(255);
    beginShape();
    for (int i = 0; i < macklemoreAudio.bufferSize(); i++) {
      //go through all frequencies for this point in time
      float x = map(i, 0, macklemoreAudio.bufferSize(), 0, width);
      float y = macklemoreAudio.left.get(i)*25 + 375;
      vertex(x, y);
    }
    endShape();

    if (mouseY > 250) {
      fill(255,132, 0, 100);
      rect (0, 250, width, 250);

      textSize(72);
      textFont(Berns);
      fill(255);
      text("stop", 450, 390);
    }
  } 
  else {
    if (mouseX > 750 && mouseY < 250) {
      fill (255, 0, 0, 100);
      rect (750, 0, 250, 250);

      textSize(72);
      textFont(Berns);
      fill(255);
      text("PLAY", 840, 140);
    }
  }
}

void mousePressed() {
  if (mousePressed == true) {
    //PINK
    if (mouseX < 250 && mouseY < 250) {
      pinkAudio.play();
    } 
    else {
      pinkAudio.pause();
      pinkAudio.rewind();
    }

    //JUSTIN
    if ((mouseX > 250 && mouseY < 250) && (mouseX < 500 && mouseY < 250)) {
      justinAudio.play();
    } 
    else {
      justinAudio.pause();
      justinAudio.rewind();
    }

    //RIHANNA
    if ((mouseX > 500 && mouseY < 250) && (mouseX < 750 && mouseY < 250)) {
      rihannaAudio.play();
    } 
    else {
      rihannaAudio.pause();
      rihannaAudio.rewind();
    }

    //MACKLEMORE
    if (mouseX > 750 && mouseY < 250) {
      macklemoreAudio.play();
    } 
    else {
      macklemoreAudio.pause();
      macklemoreAudio.rewind();
    }
  }
}


