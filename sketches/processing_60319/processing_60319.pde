
import ddf.minim.*;

float posicionX, posicionY;
float ruidoX, ruidoY;
float variacionX = 0.9;
float variacionY = 0.4;
float tamano;
int angulo = -30;

Minim minim;
AudioOutput out;
AudioPlayer player;

void setup() {
 size(600,150);
 smooth();
 minim = new Minim(this);
 player = minim.loadFile("Dance of the Pseudo Nymph.mp3");

}
void draw(){
  background (255);
  stroke (159, 206, 234, 25);
  noFill();
   for(int i = 0; i < player.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, player.bufferSize(), 0, width);
    float x2 = map(i+1, 0, player.bufferSize(), 0, width);
    bezier(x1, 50 + player.left.get(i)*50, x2, 50 + player.left.get(i+1)*50, random(10), random (width), random(0), random (width));
    bezier(x1, 150 + player.right.get(i)*50, x2, 150 + player.right.get(i+1)*50, random(0), random (width), random(0), random(width));
  }
   translate(width/7, height/7);
  rotate( radians(random(angulo)) );
  angulo++;
  posicionX = noise(ruidoX)*width;
  posicionY = noise(ruidoY)*height;
  
  ruidoX += player.bufferSize();
  ruidoY +=  player.bufferSize();
  
  stroke(200);
  fill(186, 219, 194, 100);
   ellipse(posicionX, posicionY, 100, 100);
   ellipse (posicionX/4, posicionY/4, 60, 60);
   ellipse(posicionX/random(7), posicionY/random(7), 30, 30);

}

void keyPressed(){
  if (key == 'p'){
 player.setGain(+1);
 player.play();
  }
  if(key== 's'){
    saveFrame("line-####.png"); 
  }
}
 
 void mouseDragged (){
   fill(0,random(0),random(255), 70);
   ellipse(posicionX, posicionY, 100, 100);
   ellipse (posicionX/4, posicionY/4, 60, 60);
   ellipse(posicionX/random(7), posicionY/random(7), 30, 30);
}
void stop() {
 player.close();
 minim.stop();
 
 super.stop();
}



