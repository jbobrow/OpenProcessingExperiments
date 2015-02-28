
/*
Sketch inspired of: http://cdn1.sbnation.com/entry_photo_images/7397019/Screen_Shot_2013-01-01_at_08.11.56_large_verge_medium_landscape.png

Of course, a lot if missing, like the center of the circle, it should be a mask, and I need a
background.

Made by @ramayac
*/

float large_rad = 80;
float num_cir = 100;
int circ = 30;
Circulo[] circulos = new Circulo[circ];

void setup() {
  size(550, 250);
  background(#5D1E26); 
  frameRate(10);
  noStroke();
  iniciarCirculos();
}

void draw() {
  background(#5D1E26);
  dibujarCirculos();  

  //Circulo del centro, hay que hacerlo mascara
  fill(#5D1E26);
  noStroke();
  ellipse(width/2, height/2, large_rad*2, large_rad*2);

  String hora = t(hour()) + ":" + t(minute()) + ":" + t(second());

  fill(255);
  text(hora, 249, height/2);
  //println(hora);
}

void mousePressed() {
  println(mouseX + ", " + mouseY);
}

//Esto deberia ser un lambda
String t(int tiempo) {
  if (tiempo < 10) {
    return "0" + tiempo;
  }  
  else {
    return "" + tiempo;
  }
}

void iniciarCirculos() {
  for (int i = 0; i < circulos.length; i++) {
    float angle = i * TWO_PI / circulos.length;
    float x = width/2 + cos(angle) * large_rad;
    float y = height/2 + sin(angle) * large_rad;
    float rad = random(10, large_rad*2.5);
    circulos[i] = new Circulo(x, y, rad);
  }
}

void dibujarCirculos() {
  for (int i = 0; i < circulos.length; i++) {
    circulos[i].draw();
  }
}

class Circulo {
  float x, y, r, a;

  Circulo(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.a = 0;
  }

  void draw() {
    if (a > 0) {
      fill(255, a);
      noStroke();
      ellipse(x, y, r*2, r*2);
      float decrece = random(1);
      if (decrece < 0.30){
        a--;
      }
    } else {
      if(frameCount % 10 == 0){
        float revive = random(1);
        if (revive < 0.10) {
          if (r*2 < large_rad*2) {
            a = random(0, 120);
          } else {
            a = random(0, 40);
          }
        }
      }
    }
  }
}
