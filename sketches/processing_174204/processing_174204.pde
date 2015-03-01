
import ddf.minim.*;

PImage libelula;
Minim minim;
AudioPlayer sonido;

void setup(){
  
  background(0);
  size(600,600);
  minim = new Minim(this);
  libelula = loadImage("libelula.png");
  sonido = minim.loadFile("sonido.mp3");
  sonido.loop();
}

void draw() {

for(int i = 0; i < sonido.bufferSize(); i++)
  {
    float izq, der;
    izq = sonido.left.get(i)*2;
    der = sonido.right.get(i)*2;
    float volumen = (izq+der) * 30;
      if (volumen > 10){
        background(0);
          for (int ln=0; ln < volumen; ln++){
            tint(random(255), random(255), random(255));
            float tam;
            tam = random(0, 100);
            float angulo = 0;
            float variacion;
            variacion = random(-0.1, 0.1);
            angulo = angulo + variacion;
            float c = cos(angulo);
            translate(width/2, height/2);
            rotate(c);
            image(libelula, random(width), random(height), tam, tam);
                                           }
                       }
  }
}


