
import ddf.minim.*;
Minim minim;
AudioPlayer player;
float nxScale;
float nyScale;
float n=0;
float t;
int p = 1;


void setup(){
  size(800, 300);
  smooth();
  minim = new Minim(this);
  minim.debugOn();
  player = minim.loadFile("teste.mp3", 800);
  player.play();
}
 

void draw(){

  if (p < player.bufferSize() - 1) { 
    p = p +1 ;}
background(25);
  float g = player.left.get(p) *100;
  noFill();
  for(float j=0; j<height; j+=4){
    beginShape(POLYGON);
    for(float i=0; i<width; i+=4){
      nxScale = width/2;
      nyScale = height/2;
      n = noise(i/nxScale, j/nyScale, t/nxScale)*255;
      stroke (#3BBCD9, n); //Tron
      
      curveVertex(i, j+n);
    }
    endShape();
  }
  float mx = map(mouseX, 1, width/4, g, 4);


  t+=mx;
  stroke(#aeff00);
  rectMode(CENTER);
  rect(mouseX, 5, 5, 5);
}

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}

