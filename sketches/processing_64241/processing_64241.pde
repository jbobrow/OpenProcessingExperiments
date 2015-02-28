
// Library importieren
import ddf.minim.*;

// Objekte erstellen
Minim minim;
AudioPlayer in;

void setup() {
  size(1024, 400);
  background (120, 35, 45);
  colorMode (HSB, 360, 100, 100, 100);

  // Konstruktor des Minim Objekts aufrufen
  minim = new Minim(this);

  // Livestream vom FM4 laden, Größe des default sample buffer's ist 1024
  in = minim.loadFile("LQ Alesso vs Adrian Lux - Years of Teenage Crime (Dj David Gruber Bootleg Mashup).mp3");

  println (in.getMetaData().title() +in.getMetaData().author());

  // Wiedergabe starten
  in.play();
}

void draw() {
  noStroke();
  fill(200, 10, 10, 2);
  rect(0, 0, width, height);
  pushMatrix();
  translate(width/3, height/2);

  for (int j=0; j<360; j++) {
    if (in.mix.get(j)*200>29) {
      line(43, 0, 0, 30);
    }
    else {
      stroke(200, 100, 100, 35);
    }

    line(tan(j)*50, sin(j)*50, sin(j)*abs(in.left.get(j))*200 + sin(j)*50, sin(j)*abs(in.right.get(j))*120 + sin(j)*50);
  }
  for (int k=360; k>0; k--) {
int c =0;
    if (in.mix.get(k)*200>25) {
      c = (int)map(in.mix.get(k),0,1,330,360);
      println(in.mix.get(k));
      stroke (c, 100, 100);
    }
    else {
      stroke (c, 100, 100);
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
