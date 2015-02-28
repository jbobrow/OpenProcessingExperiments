
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
AudioInput input;
BeatDetect beat;
BeatListener bl;
float radKick, radSnare, radHat;
int nodeCount = 0;
Ellipse[] ell = new Ellipse[20];
final static int X_WIDTH = 500; 
final static int Y_HEIGHT = 500; 
int rad = 2;

void setup()
{
  size(X_WIDTH, Y_HEIGHT, OPENGL);
  background(0);
  minim = new Minim(this);
  //player = minim.loadFile("music.mp3");
  input = minim.getLineIn();
  //player.play();
  beat = new BeatDetect();
  smooth();
  for (int i = 0; i < ell.length; i++) {
    int x = (int)random(rad, X_WIDTH-rad);
    int y = (int)random(rad, Y_HEIGHT-rad);
    while (!positionAllowed (x, y)) {
      x = (int)random(rad, X_WIDTH-rad);
      y = (int)random(rad, Y_HEIGHT-rad);
    }
    ell[i] = new Ellipse(x, y, i);
  }
  beat = new BeatDetect(input.bufferSize(), input.sampleRate());
  //Setzt die Zeit, in der der Algorithmus keine weiteren Beats meldet
  beat.setSensitivity(500);
}

void draw() {
  background(0);
  for (int i = 0; i < ell.length; i++) {
    ell[i].drawGradientDisc();
    if (collision(ell[i])) {
      ell[i].invert();
    }
    ell[i].update();
  }


  beat.detect(input.mix);
  // Trigger der BeatDetection
  if ( beat.isKick() ) radKick = 2.5;
  if ( beat.isSnare() ) radSnare = 2.5;
  if ( beat.isHat() ) radHat = 2.5;

  if ( radKick < 0.1 ) radKick = 0.1;
  if ( radSnare < 0.1 ) radSnare = 0.1;
  if ( radHat < 0.1 ) radHat = 0.1;
  frameRate(25);
  // Zeichnet die Kreise
  int rnd = (int)random(0, ell.length);

  
    ell[rnd].setAddition(radKick);
    ell[rnd].drawGradientDisc();

  for (int i = 0; i < ell.length; i++)
  {
    if (ell[i].getGrowing() == false && ell[i].getRadius()>1) {
      ell[i].setSubtraction((-1));
      ell[i].drawGradientDisc();
    } 
    else if (ell[i].getGrowing() == false && ell[i].getRadius()<=1)
    {
      int x = (int)random(rad, X_WIDTH-rad);
      int y = (int)random(rad, Y_HEIGHT-rad);
      ell[i] = new Ellipse(x, y, i);
      while (collision (ell[i])) {
        x = (int)random(rad, X_WIDTH-rad);
        y = (int)random(rad, Y_HEIGHT-rad);
        ell[i] = new Ellipse(x, y, i);
      }
    }
  }

}

boolean positionAllowed(int x, int y) {
  int radius;
  for (int i = 0; i <  ell.length; i++) {
    if (ell[i] == null) {
      return true;
    }  
    radius = (int)(ell[i].getRadius()*2.1);
    if (x > ell[i].getX()-radius && x < ell[i].getX()+radius && 
      y > ell[i].getY()-radius && y < ell[i].getY()+radius) {
      return false;
    }
  }
  return true;
}

boolean collision(Ellipse e) {
  int radius;
  for (int i = 0; i < ell.length; i++) {
    radius = (int)(ell[i].getRadius()*2.1);
    if (e.getId() != i) {
      if (e.getX() > ell[i].getX()-radius && e.getX() < ell[i].getX()+radius && 
        e.getY() > ell[i].getY()-radius && e.getY() < ell[i].getY()+radius) {
        return true;
      }
    }
  }
  return false;
}

 class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;
  
  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
  
  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }
  
  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}
class Ellipse {
  int x; 
  int y; 
  int diameter; 
  int innerCol;
  int outerCol;
  int count; 
  int toX; 
  int toY; 
  int id; 
  float addition;
  boolean growing; 

  Ellipse(int x, int y, int id) {
    this.x = x; 
    this.y = y; 
    this.id = id;
    diameter = 2; 
    innerCol = color(130, 206, 255);
    outerCol = color(0, 0, 0, 10);
    toX = (int)random(-3, 3); 
    toY = (int)random(-3, 3); 
    while (toX == 0 && toY == 0) {
      toY = (int)random(-3, 3);
    }
    growing = true; 
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }

  int getId() {
    return id;
  }

  int getRadius() {
    return diameter/2;
  }

  void setAddition(float rad) {
    this.addition = rad;
    this.diameter = diameter+(int)rad;
    if(this.diameter > 80){
    growing= false; 
    }
  }
  
  boolean getGrowing(){
    return growing; 
  }
  
    void setSubtraction(float rad) {
    this.diameter = diameter+(int)addition+(int)rad;
    addition=0;
  }

  void drawGradientDisc() {
    noStroke();
    beginShape(TRIANGLE_STRIP);
    for (float theta=0; theta<TWO_PI; theta+=TWO_PI/36) {
      fill(innerCol);
      vertex(x, y);
      fill(outerCol);
      vertex(x+(diameter+addition)*cos(theta), y+(diameter+addition)*sin(theta));
    }
    endShape();
  } 


  void update() {
    x += toX;
    y += toY;
    if (x < 0+(diameter/2) || x > X_WIDTH-(diameter/2)) {
      toX*=(-1);
    } 
    else if (y < 0+(diameter/2) || y > Y_HEIGHT-(diameter/2)) {
      toY*=(-1);
    }
  }

  void invert() {
    toX*=(-1);
    toY*=(-1);
  }
}



