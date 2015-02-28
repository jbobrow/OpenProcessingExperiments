
import ddf.minim.*;

PImage b;
PImage i;
float inflar = 50;

AudioPlayer s;
AudioPlayer soplar;
Minim minim;


void setup() {
  imageMode(CENTER);
  size(800, 600);
  i= loadImage ("up.jpg");
  b = loadImage("bomba123.jpg");
  minim = new Minim(this);
  s = minim.loadFile("POP.wav");
  soplar = minim.loadFile("blowrepeat.wav");
  soplar.play();
}




void draw() {

  background(255);
  float v = dist(mouseX, mouseY, pmouseX, pmouseY); // mide la velocidad del movimiento del mouse (distancia entre la posición actual y la anterior)
  println(v); 
  //soplar.VOLUME(v*0.05);
  inflar = inflar + (v*0.05);
  image(b, 400, 300, inflar, inflar);
  if (inflar > 500) {
    b=  i;
    image(b, 400, 300, inflar, inflar);
    soplar.close();
    s.play();
    noLoop();
    image ( i, 400, 300, inflar, inflar);
  }
}


// para borrar
void keyPressed() { // cuando se oprime una tecla...
  background(255); // pinta el fondo de blanco

  loop();
}



void stop()
{
  // always close Minim audio classes when you are done with them
  s.close();
  
  minim.stop();

  super.stop();
}


