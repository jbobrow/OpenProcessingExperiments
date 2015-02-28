
import ddf.minim.*;

Minim minim;
AudioPlayer song;

float color1 = 35;
float color2 = 45;
float color3 = 65;
float color4 = 75;

void setup() {
  size(512, 400);
  background(0);
  colorMode(HSB,100,100,100,100);
  
  minim = new Minim(this);
  song = minim.loadFile("You_Big_Fat_Smart.mp3", 1024);
  
  song.play();
  
  smooth();

}


void draw() {
  noStroke();
  fill(0, 5);
  rect(0,0,width,height);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(frameCount % 360 * 2));
    for(int j = 0; j < 360; j++) {
      
      if(song.mix.get(j)*200 > 50) {
        stroke(color1,100,100);
      }
      else {
        stroke(color2,100,100);
      }
      
      line(cos(j)*50, sin(j)*50, cos(j)*abs(song.left.get(j))*200 + cos(j)*50, sin(j)*abs(song.right.get(j))*200 + sin(j)*50);
    }
    for(int k = 360; k > 0; k--) {
      
      
      if(song.mix.get(k)*200 > 25) {
        stroke(color3,100,100);
      }
      else {
        stroke(color4,100,100);
      }
      
      
      line(cos(k)*50, sin(k)*50, cos(k)*abs(song.right.get(k))*200 + cos(k)*50, sin(k)*abs(song.left.get(k))*200 + sin(k)*50);   
    }
  
  popMatrix();
}

void keyPressed() {
  
  if(key == 'r') {
    color1 = 0;
    color2 = 5;
    color3 = 90;
    color4 = 95;
  }
  
  if(key == 'g') {
    color1 = 35;
    color2 = 45;
    color3 = 65;
    color4 = 75; 
  }
  
}

void stop() {
  
  song.close();
  minim.stop();
  super.stop();
  
}

