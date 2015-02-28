
import ddf.minim.*; // carga la libreria

Minim minim; // crea la variable de la libreria
AudioInput entrada; // crea la variable de entrada
float suavizado = 0;
void setup()
{
  size(400, 400);
  minim = new Minim(this); // inicia minim
  entrada = minim.getLineIn(); // inicia la entrada
  stroke(255);
}

void draw()
{
  background(0);
  float amp = entrada.mix.get(0)*500; // lee la amplitud de la entrada
  suavizado = (suavizado*0.95)+(amp*0.5);
  ellipse(width, width/2, amp, amp);
  ellipse(width/3, width/2, suavizado, amp);
}

void stop()  // cierra todo y libera la tarjeta de sonido
{
  entrada.close();
  minim.stop();
  super.stop();
}

