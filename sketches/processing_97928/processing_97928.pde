
import ddf.minim.*;
Minim minim;
AudioSample noteC1;
AudioSample noteCsharp1;
AudioSample noteD1;
AudioSample noteDsharp1;
AudioSample noteE1;
AudioSample noteF1;
AudioSample noteFsharp1;
AudioSample noteG1;
AudioSample noteGsharp1;
AudioSample noteA1;
AudioSample noteAsharp1;
AudioSample noteB1;
AudioSample noteC2;
AudioSample noteCsharp2;
AudioSample noteD2;
AudioSample noteDsharp2;
AudioSample noteE2;
AudioPlayer song;

PImage letters;
PImage letters2;

void setup() {
  size(1123, 800);
  background(175);
  letters = loadImage("letters.png");
  letters2 = loadImage("letters2.png");
  minim = new Minim(this);
  noteC1 = minim.loadSample("C1.wav");
  noteCsharp1 = minim.loadSample("Csharp1.wav");
  noteD1 = minim.loadSample("D1.wav");
  noteDsharp1 = minim.loadSample("Dsharp1.wav");
  noteE1 = minim.loadSample("E1.wav");
  noteF1 = minim.loadSample("F1.wav");
  noteFsharp1 = minim.loadSample("Fsharp1.wav");
  noteG1 = minim.loadSample("G1.wav");
  noteGsharp1 = minim.loadSample("Gsharp1.wav");
  noteA1 = minim.loadSample("A1.wav");
  noteAsharp1 = minim.loadSample("Asharp1.wav");
  noteB1 = minim.loadSample("B1.wav");
  noteC2 = minim.loadSample("C2.wav");
  noteCsharp2 = minim.loadSample("Csharp2.wav");
  noteD2 = minim.loadSample("D2.wav");
  noteDsharp2 = minim.loadSample("Dsharp2.wav");
  noteE2 = minim.loadSample("E2.wav");
  song = minim.loadFile("entertainer.wav");
  smooth();
}

void draw() {
  rectMode(CORNERS);
  fill(255);
  rect(50, 100, 152, 700);
  rect(152, 100, 254, 700);
  rect(254, 100, 356, 700);
  rect(356, 100, 458, 700);
  rect(458, 100, 560, 700);
  rect(560, 100, 662, 700);
  rect(662, 100, 764, 700);
  rect(764, 100, 866, 700);
  rect(866, 100, 968, 700);
  rect(968, 100, 1070, 700);
  fill(0);
  rect(104, 100, 199, 400);
  rect(205, 100, 300, 400);
  rect(407, 100, 502, 400);
  rect(508, 100, 603, 400);
  rect(609, 100, 704, 400);
  rect(811, 100, 906, 400);
  rect(912, 100, 1007, 400);

  image(letters, 30, 50);
  image(letters2, 30, 120);

  if (keyPressed) {
    if (key == 'a') {
      noteC1.trigger();
      fill(177);
      rectMode(CORNERS);
      rect(50, 100, 152, 700);
      fill(0);
      rect(104, 100, 199, 400);
      rect(205, 100, 300, 400);
      rect(407, 100, 502, 400);
      rect(508, 100, 603, 400);
      rect(609, 100, 704, 400);
      rect(811, 100, 906, 400);
      rect(912, 100, 1007, 400);
      image(letters2, 30, 120);
      image(letters, 30, 50);
    }
    if (key == 'w') {
      noteCsharp1.trigger();
      fill(177);
      rectMode(CORNERS);
      rect(104, 100, 199, 400);
      image(letters2, 30, 120);
    }
    if (key == 's') {
      noteD1.trigger();
      fill(177);
      rectMode(CORNERS);
      rect(152, 100, 254, 700);
      fill(0);
      fill(0);
      rect(104, 100, 199, 400);
      rect(205, 100, 300, 400);
      rect(407, 100, 502, 400);
      rect(508, 100, 603, 400);
      rect(609, 100, 704, 400);
      rect(811, 100, 906, 400);
      rect(912, 100, 1007, 400);

      image(letters, 30, 50);
      image(letters2, 30, 120);
    }
    if (key == 'e') {
      noteDsharp1.trigger();
      fill(177);
      rectMode(CORNERS);
      rect(205, 100, 300, 400);
      image(letters2, 30, 120);
    }
    if (key == 'd') {
      noteE1.trigger(); 
      fill(177);
      rectMode(CORNERS);
      rect(254, 100, 356, 700);
      fill(0);
      fill(0);
      rect(104, 100, 199, 400);
      rect(205, 100, 300, 400);
      rect(407, 100, 502, 400);
      rect(508, 100, 603, 400);
      rect(609, 100, 704, 400);
      rect(811, 100, 906, 400);
      rect(912, 100, 1007, 400);

      image(letters, 30, 50);
      image(letters2, 30, 120);
    }
    if (key == 'f') {
      noteF1.trigger();
      fill(177);
      rectMode(CORNERS);
      rect(356, 100, 458, 700);
      fill(0);
      fill(0);
      rect(104, 100, 199, 400);
      rect(205, 100, 300, 400);
      rect(407, 100, 502, 400);
      rect(508, 100, 603, 400);
      rect(609, 100, 704, 400);
      rect(811, 100, 906, 400);
      rect(912, 100, 1007, 400);

      image(letters, 30, 50);
      image(letters2, 30, 120);
    }
    if (key == 't') {
      noteFsharp1.trigger(); 
      fill(177);
      rectMode(CORNERS);
      rect(407, 100, 502, 400);
      image(letters2, 30, 120);
    }
    if (key == 'g') {
      noteG1.trigger();
      fill(177);
      rectMode(CORNERS);
      rect(458, 100, 560, 700);
      fill(0);
      fill(0);
      rect(104, 100, 199, 400);
      rect(205, 100, 300, 400);
      rect(407, 100, 502, 400);
      rect(508, 100, 603, 400);
      rect(609, 100, 704, 400);
      rect(811, 100, 906, 400);
      rect(912, 100, 1007, 400);

      image(letters, 30, 50);
      image(letters2, 30, 120);
    }
    if (key == 'y') {
      noteGsharp1.trigger(); 
      fill(177);
      rectMode(CORNERS);
      rect(508, 100, 603, 400);
      image(letters2, 30, 120);
    }
    if (key == 'h') {
      noteA1.trigger(); 
      fill(177);
      rectMode(CORNERS);
      rect(560, 100, 662, 700);
      fill(0);
      fill(0);
      rect(104, 100, 199, 400);
      rect(205, 100, 300, 400);
      rect(407, 100, 502, 400);
      rect(508, 100, 603, 400);
      rect(609, 100, 704, 400);
      rect(811, 100, 906, 400);
      rect(912, 100, 1007, 400);

      image(letters, 30, 50);
      image(letters2, 30, 120);
    }
    if (key == 'u') {
      noteAsharp1.trigger(); 
      fill(177);
      rectMode(CORNERS);
      rect(609, 100, 704, 400);
      image(letters2, 30, 120);
    }
    if (key == 'j') {
      noteB1.trigger(); 
      fill(177);
      rectMode(CORNERS);
      rect(662, 100, 764, 700);
      fill(0);
      fill(0);
      rect(104, 100, 199, 400);
      rect(205, 100, 300, 400);
      rect(407, 100, 502, 400);
      rect(508, 100, 603, 400);
      rect(609, 100, 704, 400);
      rect(811, 100, 906, 400);
      rect(912, 100, 1007, 400);

      image(letters, 30, 50);
      image(letters2, 30, 120);
    }
    if (key == 'k') {
      noteC2.trigger(); 
      fill(177);
      rectMode(CORNERS);
      rect(764, 100, 866, 700);
      fill(0);
      fill(0);
      rect(104, 100, 199, 400);
      rect(205, 100, 300, 400);
      rect(407, 100, 502, 400);
      rect(508, 100, 603, 400);
      rect(609, 100, 704, 400);
      rect(811, 100, 906, 400);
      rect(912, 100, 1007, 400);

      image(letters, 30, 50);
      image(letters2, 30, 120);
    }
    if (key == 'o') {
      noteCsharp2.trigger(); 
      fill(177);
      rectMode(CORNERS);
      rect(811, 100, 906, 400);
      image(letters2, 30, 120);
    }
    if (key == 'l') {
      noteD2.trigger(); 
      fill(177);
      rectMode(CORNERS);
      rect(866, 100, 968, 700);
      fill(0);
      fill(0);
      rect(104, 100, 199, 400);
      rect(205, 100, 300, 400);
      rect(407, 100, 502, 400);
      rect(508, 100, 603, 400);
      rect(609, 100, 704, 400);
      rect(811, 100, 906, 400);
      rect(912, 100, 1007, 400);

      image(letters, 30, 50);
      image(letters2, 30, 120);
    }
    if (key == 'p') {
      noteDsharp2.trigger(); 
      fill(177);
      rectMode(CORNERS);
      rect(912, 100, 1007, 400);
      image(letters2, 30, 120);
    }
    if (key == ';') {
      noteE2.trigger(); 
      fill(177);
      rectMode(CORNERS);
      rect(968, 100, 1070, 700);
      fill(0);
      fill(0);
      rect(104, 100, 199, 400);
      rect(205, 100, 300, 400);
      rect(407, 100, 502, 400);
      rect(508, 100, 603, 400);
      rect(609, 100, 704, 400);
      rect(811, 100, 906, 400);
      rect(912, 100, 1007, 400);

      image(letters, 30, 50);
      image(letters2, 30, 120);
    }
    if (key == '1') {
      song.play();
    }
  }
}

void stop() {
  song.close();
  minim.stop();
  super.stop();
}



