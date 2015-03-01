
//Elipse con teclado y click momento

int a = (50);
float alto = 20;
float ancho = 20;

void setup() { 
  size(800,300);
  background(#3C3C3C);
  stroke(#69538E);
  smooth();
}

void draw() {
  fill(0,5);
  rect(0,0,width,height);
 //  background (#3C3C3C);
  // fill(#FFE99C);
      if (mousePressed && (mouseButton == LEFT)) {
    fill(0);
  } else if (mousePressed && (mouseButton == RIGHT)) {
    fill(255);
  } else {
    fill(#FFE99C);
  }
  ellipse(mouseX,mouseY,ancho,alto);
}

void keyReleased () {
  
 
    if (keyCode==RIGHT) {
      ancho = ancho + 1;
  } else if (keyCode==LEFT) {
    ancho = ancho - 1;
  } else if (keyCode==UP) {
    alto = alto + 1;
  } else if (keyCode==DOWN) {
    alto = alto -1;
  } 
}

