
import ddf.minim.*;
import geomerative.*;

AudioPlayer player;
Minim minim;
RShape stella; 

float z = 0;  
PImage Tower, Plane;
float seiGradi = PI/30;
float trentaGradi = PI/6;
float x_plane , vel_plane ;

void setup() 
{
  x_plane = -100;
  vel_plane = 1;
  frameRate(120);
  smooth();
  size(500,700);
  loadPixels(); 
  
  RG.init( this );
  stella = RShape.createEllipse( 283,339,70,70);  
  minim = new Minim(this);
  player = minim.loadFile("bells.mp3", 2048);
}

void draw() 
{  
  //sky--------------------------------------------
  
  noiseDetail(6, 0.4);

  for(int y = 0;  y < height;  y++) {
    for(int x = 0;  x < width;  x++) {

      float grigio = noise( x/300.0,  y/180.0,  z );

      pixels[x+y*width] = color(grigio*255);
      pixels[x+y*width] = color(grigio*255, grigio*191+64, grigio*127+128);
    }
  }
  updatePixels();
  z += 0.03;
  //AirPlane---------------------------------------
  
  Plane = loadImage ("Airplane02.png");
  image (Plane,x_plane, 400);
  x_plane += vel_plane;
  
  //tower------------------------------------------
  
  Tower = loadImage("tower1.png");
  image (Tower,200,9);
  
  //clock------------------------------------------
  
  translate(283,339);

  int secondi = second();  
  disegnaLancetta( secondi*seiGradi, 30 );

  int minuti = minute();  

  disegnaLancetta( minuti*seiGradi, 20 );
  int ore = hour();   
  disegnaLancetta( ore*trentaGradi, 15 );
  //stella.draw();
}

void disegnaLancetta( float angolo, float lunghezza ) 
{
  pushMatrix();
  rotate( angolo-HALF_PI );
  strokeWeight(1.5);
  stroke(40);
  line( 0,0, lunghezza,0 );
  popMatrix();
}


void mouseMoved() {
  if ( stella.contains(mouseX, mouseY) ) {
    cursor(HAND);
    player.play();
    player.loop(1);
  } else {
      cursor(ARROW);
   
  }
}


