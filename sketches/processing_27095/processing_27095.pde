
class Ball
{
  int diam=16;
  int h=diam;
  int w=diam;
  float x=mouseX;
  float y=mouseY;
  float gravity=1;
  float floorNum =height-(diam/2);
  float velY=1;
  float velX=3;

  AudioPlayer sound4;
  AudioPlayer sound5;
  AudioPlayer sound6;
  AudioPlayer sound7;
  AudioPlayer sound8;
  AudioPlayer sound9;
  AudioPlayer sound10;

  Ball() {
    sound4 = m.loadFile("4.wav");
    sound5 = m.loadFile("5.wav");
    sound6 = m.loadFile("6.wav");
    sound7 = m.loadFile("7.wav");
    sound8 = m.loadFile("8.wav");
    sound9 = m.loadFile("9.wav");
    sound10 = m.loadFile("10.wav");
  }

  void drawBall() {

    if (y > floorNum && !sound10.isPlaying() && this.x < width*(1/7.0)) {
      sound10.loop(0);
    }

    if (y > floorNum && !sound9.isPlaying() && this.x > width*(1/7.0) && this.x < width*(2/7.0)) {
      sound9.loop(0);
    }

    if (y > floorNum && !sound8.isPlaying() && this.x > width*(2/7.0) && this.x < width*(3/7.0)) {
      sound8.loop(0);
    }

    if (y > floorNum && !sound7.isPlaying() && this.x > width*(3/7.0) && this.x < width*(4/7.0)) {
      sound7.loop(0);
    }

    if (y > floorNum && !sound6.isPlaying() && x > width*(4/7.0) && x < width*(5/7.0)) {
      sound6.loop(0);
    }

    if (y > floorNum && !sound5.isPlaying() && x > width*(5/7.0) && x < width*(6/7.0)) {
      sound5.loop(0);
    }

    if (y > floorNum && !sound4.isPlaying() && x > width*(6/7.0) && x < width) {
      sound4.loop(0);
    }

    ellipseMode(CENTER);
    fill(0);
    stroke(0);
    ellipse(x,y,diam,diam);
    velY = velY+gravity;
    y =y+velY;
    x =x+velX;

    if(y>(height+5)) {
      velY=-velY/1.1;
      y = height;
    }
  }
}


