
import ddf.minim.*;
Minim minim;
AudioPlayer song;


float angle = 0.0;
float speed = .17;

void reset_sketch(){
  background(0);
}


void setup() {
  minim = new Minim (this);
  song = minim.loadFile("alicewonderlandfade.wav");
  size(500,500);
  smooth();
  background(0);
}

void draw() {
  translate (mouseX, mouseY);
  rotate(angle);
  strokeWeight(1.5);
  rect(-15,-15,70,70);
  angle += speed;
  if(mousePressed){ 
    if (mouseButton == LEFT) {
      fill(57, 237,226,100);}
     if (mouseButton == RIGHT){
       fill (152, 17, 237, 100);}

}
 else{  fill(255, 100);
 }
}

void mousePressed(){
    song.loop(0);}


void stop()
{
song.close();
minim.stop();
super.stop();
}


void keyReleased(){
 if( key == 'r' ){
  reset_sketch();
 } 
}

