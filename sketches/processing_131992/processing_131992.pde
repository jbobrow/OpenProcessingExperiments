


class ball {
  int x;
  int y;
  int breedte;
  int snelheid;
  PImage insect;
  
  ball(int tempX, int tempY, int tempBreedte, int tempSnelheid ) {
    x = tempX;
    y = tempY;
    breedte = tempBreedte;
    snelheid = tempSnelheid;
  }
  
  void updateBall() {
    y = y + snelheid;
  }
  

  
  void tekenBall() {
    image(insect, x, y - 50 );
  }
}
ball [ ] ballCollection = new ball [5];

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

AudioPlayer song;
Minim minim;

int gameStatus = 0;
int score;

PImage img;
PImage timon;

void setup() {
  size( 500, 500 );
  minim = new Minim(this);
  song = minim.loadFile("hakunamatata.mp3", 5048);
  song.play();
  img = loadImage( "download.jpg" );
  timon = loadImage( "timon.png" );
  for( int i = 0; i < ballCollection.length; i++){
    ballCollection [i] = new ball( int( random( width ) ), 100, int(random(20,40)), int(random(3,8)));
  }
}

void draw(){
  background(0);
  image(img, 0, 0, width, height);
  if ( gameStatus == 0 ) {
    text( "Score", 10, 70);
    text( score, 10, 90); 
    for ( int i = 0; i < ballCollection.length; i++){
      ballCollection [i].insect = loadImage( "insect.png" );
      ballCollection [i].updateBall();
      ballCollection [i].tekenBall();
      if ( ballCollection[i].y > height + 50 ){
        ballCollection[i].y = 0;
        ballCollection[i].x = int(random(0, width));
        ballCollection[i].snelheid = int(random( 1, 6));
      }
      
      if ( ( ballCollection[i].y > 350 - ( ballCollection[i].breedte/2 ) ) && ( ballCollection[i].y < 350 + ( ballCollection[i].breedte/2  ) ) && ( ballCollection[i].x < ( mouseX + 70 ) + ( ballCollection[i].breedte/2  ) ) && ( ballCollection[i].x > ( mouseX - 70 ) - ( ballCollection[i].breedte/2  ) ) ) {
            ballCollection[i].y = 0;
            score = score + 1;
      }
    }
    image(timon, mouseX - 70, height - 250 );
  }
  

}


