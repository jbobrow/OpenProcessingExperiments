
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim cancion;
AudioPlayer reproductor;
int renk = 100 ;
void setup()
{
  size(500,500);
  background(0,0,0);
  smooth();
  cancion= new Minim(this);
  reproductor=cancion.loadFile("yopago.mp3");
  reproductor.play();
}
void draw()
{
  
  noFill();
  background(0);
  stroke(0,255,0);
  strokeWeight(4);
  
    if (renk < 100) {
    renk = renk +1 ;
    }
    else {
    renk = 0 ;
    }
    ellipse(250,250,400,400);
    for (int i = 0 ; i < reproductor.bufferSize () - 1 ; i++) {
    if (i == 0) {
      stroke(255,0,0);
      bezier(110,110,160,reproductor.left.get(i)*400,380,reproductor.right.get(i)*400,380,400);
      stroke(0,0,255);
      bezier(390,110,reproductor.right.get(i)*400,110,reproductor.right.get(i)*400,420,115,390);
    }
    if (reproductor.left.get(i) > 0.5) 
    { 
      background (0) ; 
    }
  }
}
void keyPressed () {
   if (key=='s') {
     saveFrame("exports/img-####.tiff");
   }
   noLoop();
   cancion.stop();
}

