
//Gradiente Interativo
//Erich M. Zimmermann
//Arquitetura e Urbanismo
//Computação I: P2 - Prof. Luiz Ernesto Merkle

//PFont text;

void setup () {
  size(255, 255);
  colorMode(HSB);
//  text = createFont("Arial", 12);
//  textFont (text);
}

void draw () {

  //gradient
  int c = 0;
  for (int y=255; y>=0; y=y-1) {
    if (c>=0) {
      c=c+1;
      stroke(mouseX, mouseY, c);
      line(0, y, 255, y);
    }
  }

/*  //text
  fill(255);
  textAlign(CENTER);
  text("Erich 2013", width/2, height-15);
*/

  //lock
  if (mousePressed == true) {
    noLoop();
  }
}

//reset
void mouseClicked () {
  loop();
}
