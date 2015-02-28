
/*Bei folgendem von uns hochgeladenem Sketch werden 8 Bilder mit 
 Linien angezeigt. 
 a) Programmiere die ersten 4 mit Hilfe einer while-Schleife nach.
 b) Programmiere die restlichen 4 mit einer for-Schleife nach.*/

void setup() {
  size(900, 460);
  background(255);
  stroke(1);
}

void draw() {
  //Rechteck 1: senkrechte Linien
  rect(20, 20, 200, 200);
  float x1=40;
  float space=10;

  while (x1 <= 200) {
    line(x1, 40, x1, 200);
    x1 = x1+space;
  }

  //Rechteck 2: waagerechte Linien
  rect(240, 20, 200, 200);
  float y2=40;
  //float space=10;

  while (y2 <= 200) {
    line(260, y2, 420, y2);
    y2 = y2+space;
  }

  //Rechteck 3: senkrechte schräge Linien
  rect(460, 20, 200, 200);

  float x3a=520;
  float x3b=480;
  //float space=10;

  while (x3a <= 640 /*&& x3b <= 640*/) {
    line(x3a, 40, x3b, 200);
    x3a = x3a+space;
    x3b = x3b+space;
  }

  //Rechteck 4: waagerechte schräge Linien
  rect(680, 20, 200, 200);

  float y4a=80;
  float y4b=40;
  //float space=10;

  while (y4a <= 200 /*&& y4b <= 200*/) {
    line(700, y4a, 860, y4b);
    y4a = y4a+space;
    y4b = y4b+space;
  }

  //For Schleifen

  //Rechteck 5: senkrechte Linien, unregelmäßiger Abstand
  rect(20, 240, 200, 200);
  //float space=10;

  for (float x5=40; x5 <= 200; x5 = x5+space) {
    line(x5, 260, x5, 420);
    space = space+4;
  }

  //Rechteck 6: waagerechte Linien, unregelmäßiger Abstand
  rect(240, 240, 200, 200);
  space=5;

  for (float y6=260; y6 <= 420; y6 = y6+space) {
    line(260, y6, 420, y6);
    space = space+1;
  }

  //Rechteck 7: 2 x Blöcke senkrechte Linien
  rect(460, 240, 200, 200);
  space=5;

  for (float x7a=480; x7a <= 557; x7a = x7a+space) {
    line(x7a, 270, x7a, 360);
  }
  for (float x7b=563; x7b <= 640; x7b = x7b+space) {
    line(x7b, 320, x7b, 420);
  }

  //Rechteck 8: 2 x versetzte waagerechte Linien
  rect(680, 240, 200, 200);
  space=20;

  for (float y8a = 260; y8a <= 420; y8a = y8a+space) {
    line(700, y8a, 780, y8a);
  }
  for (float y8b = 270; y8b <= 420; y8b = y8b+space) {
    line(780, y8b, 860, y8b);
  }
}

/*void mousePressed() {
  saveFrame("thumbnail.png");
}*/


