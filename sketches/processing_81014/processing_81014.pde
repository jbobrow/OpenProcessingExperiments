
PFont letra;
float pos_x;
float inc = 0;

void setup() {
  size(800,400);
  letra = createFont("Verdana.wlv", 1);
  textSize(80);
  pos_x = 0;
}

void draw() {
  background(0);
  text("M", pos_x, height/2);
  text("A", pos_x + inc * 2, height/2);
  text("R", pos_x + inc * 4, height/2);
  text("C", pos_x + inc * 6, height/2);
  text("O", pos_x + inc * 8, height/2);
  text("S", pos_x + inc * 10, height/2);
  
  inc += 0.5;
  
  if((pos_x + inc * 10) >= width-40) {
    noLoop();
    save("imagen.gif");
  }
}

