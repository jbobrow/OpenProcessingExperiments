
// Sketch to guitar playing
// You can play basic notes using keyboard and dragging mouse over the strings
// Just 3 first frets are available
// Flat or sharp sounds are unavailable

import ddf.minim.*;

Minim minim;
AudioSample a, a3, b, c2, c5, d, d2, E, e1, e4, f1, f4, f6, g, g1, g6, h5; 

void setup() {
 size(800, 500);
 background(#35B6CB);
 minim = new Minim(this);
 a = minim.loadSample("a.wav");
 a3 = minim.loadSample("a3.wav");
 b = minim.loadSample("b.wav");
 c2 = minim.loadSample("c2.wav");
 d = minim.loadSample("d.wav");
 d2 = minim.loadSample("d2.wav");
 E = minim.loadSample("E.wav");
 e1 = minim.loadSample("e1.wav");
 e4 = minim.loadSample("e4.wav");
 f1 = minim.loadSample("f1.wav");
 f4 = minim.loadSample("f4.wav");
 f6 = minim.loadSample("f6.wav");
 g = minim.loadSample("g.wav");
 g1 = minim.loadSample("g1.wav");
 g6 = minim.loadSample("g6.wav");
 h5 = minim.loadSample("h5.wav");
}

//draw guitar
void draw() {
  fill(#FCD57F);
  rect(0, height/2-100, width, 200);
  fill(#950011);   
  strokeWeight(1);
  triangle(0, height/2-100, width, height/2-100, width, height/2-120);
  triangle(0, height/2+100, width, height/2+100, width, height/2+120);
  rect(0, height/2-100, width, 10);
  rect(0, height/2+90, width, 10);  
  rect(0, height/2-90, 10, 180);
  // frets
  fill(#D37D13); 
  rect(180, height/2-90, 10, 180);   
  rect(360, height/2-90, 10, 180); 
  rect(540, height/2-90, 10, 180);
  rect(720, height/2-90, 10, 180);
  // strings
  strokeWeight(2);
  line(0, height/2-75, width, height/2-75);
  line(0, height/2-45, width, height/2-45);
  line(0, height/2-15, width, height/2-15);
  strokeWeight(4);
  line(0, height/2+15, width, height/2+15);
  line(0, height/2+45, width, height/2+45);
  line(0, height/2+75, width, height/2+75);
}

// play sounds
void mouseDragged() {
  if (mouseY == height/2-75) {
    fill(#000000);
    rect(0, height/2-76, width, 2); // blinking string
    // play appropriate sound
    if (!keyPressed) e1.trigger(); 
    if (keyPressed && (key == 'w' || key == 'W')) e1.trigger();
    if (keyPressed && (key == 'e' || key == 'E')) f1.trigger();
  }
  if (mouseY == height/2-45) {
    fill(#000000);
    rect(0, height/2-46, width, 2);
    if (!keyPressed) b.trigger();
    if (keyPressed && (key == 'a' || key == 'A')) c2.trigger();
    if (keyPressed && (key == 'd' || key == 'D')) d2.trigger();
  }
  if (mouseY == height/2-15) {
    fill(#000000);
    rect(0, height/2-16, width, 2);
    if (!keyPressed) g.trigger();
    if (keyPressed && (key == 'x' || key == 'X')) a3.trigger();
  }
  if (mouseY == height/2+15) {
    fill(#000000);
    rect(0, height/2+13, width, 2);
    if (!keyPressed) d.trigger();
    if (keyPressed && (key == 'w' || key == 'W')) e4.trigger();
    if (keyPressed && (key == 'e' || key == 'E')) f4.trigger();
  }
  if (mouseY == height/2+45) {
    fill(#000000);
    rect(0, height/2+43, width, 2);
    if (!keyPressed) a.trigger();
    if (keyPressed && (key == 's' || key == 'S')) h5.trigger();
    if (keyPressed && (key == 'd' || key == 'D')) c5.trigger();
  }
  if (mouseY == height/2+75) {
    fill(#000000);
    rect(0, height/2+73, width, 2);
    if (!keyPressed) E.trigger();
    if (keyPressed && (key == 'z' || key == 'Z')) f6.trigger();
    if (keyPressed && (key == 'c' || key == 'C')) g6.trigger();
  }
}


