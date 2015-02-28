

Line ln;
Line lns[];

String words[] = {
  "Bugra   Can   ASlan ", "Beykent Universitesi", "Guzel Sanatlar Fakultesi", "iletisim Tasarım Bolumu ",
  "by ", "    GoGoR ", " ",
  " "
};

void setup()
{
  size(640, 360, P3D);
  
  
  lns = new Line[8];

 
  textFont(loadFont("Univers66.vlw.gz"), 1.0);

  
  fill(255);

  
  for(int i = 0; i < 8; i++) {
   
    ln = new Line(words[i], 0, i * 70);
    lns[i] = ln;
  }
}

void draw()
{
  background(0);
  
  translate(-200, -50, -450);
  rotateY(0.3);

  
  for(int i = 0; i < 8; i++) {
    float f1 = sin((i + 1.0) * (millis() / 10000.0) * TWO_PI);
    float f2 = sin((8.0 - i) * (millis() / 10000.0) * TWO_PI);
    Line line = lns[i];
    pushMatrix();
    translate(0.0, line.yPosition, 0.0);
    for(int j = 0; j < line.myLetters.length; j++) {
      if(j != 0) {
        translate(textWidth(line.myLetters[j - 1].myChar) * 75, 0.0, 0.0);
      }
      rotateY(f1 * 0.005 * f2);
      pushMatrix();
      scale(75.0);
      text(line.myLetters[j].myChar, 0.0, 0.0);
      popMatrix();
    }
    popMatrix();
  }
}


