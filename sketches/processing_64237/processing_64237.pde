
// Library importieren
import ddf.minim.*;

// Objekte erstellen
Minim minim;
AudioPlayer in;


void setup() {
  size(1024, 800);
  background(35, 25, 255);
  colorMode(HSB, 100, 100,100);

  // Konstruktor des Minim Objekts aufrufen
  minim = new Minim(this);

  // Livestream vom FM4 laden, Größe des default sample buffer's ist 1024
  in = minim.loadFile("Eliminate - Chasing Fire (Drumstep VIP) (www.bitons.ru).mp3");


  println(in.getMetaData().title() +in.getMetaData().author());

  // Wiedergabe starten
  in.play();
}

void draw() {
 


  noStroke();
  fill(0, 0,0.5);
  rect(0, 0, width, height);
  pushMatrix();
  translate(width/2, height/2);
  rotate((frameCount % 360 * 1000));





  for (int j = 0; j < 360; j++) {
 println(in.mix.get(j));
    if (in.mix.get(j) > 0.5) {
       println("iii");
       fill( 50, 20, 100);
  rect(-width, -height, width*4 , height*4);
 
    }

    if (in.mix.get(j)*200 > 29) {
      line(43, 0, 0, 30);
    }
    else {
      stroke(34, 100, 10, 35);
    }

    line(tan(j)*50, sin(j)*50, sin(j)*abs(in.left.get(j))*200 + sin(j)*50, sin(j)*abs(in.right.get(j))*120 + sin(j)*50);
  }
  for (int k = 360; k > 0; k--) {


    if (in.mix.get(k)*200 > 25) {
      stroke(35, 25, 100);
    }
    else {
      stroke(35, 255, 100);
    }


    line(sin(k)*50, sin(k)*50, cos(k)*abs(in.left.get(k))*200 + cos(k)*50, cos(k)*abs(in.right.get(k))*200 + sin(k)*50);
  }

  popMatrix();
}



void stop()
{
  // Player in schließen
  in.close();
  // Minim Object stoppen
  minim.stop();

  super.stop();
}
