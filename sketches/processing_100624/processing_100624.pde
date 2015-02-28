
//  TODO:
//- Segmente auf mehrere Bälle auslegen
//- Segmente verschiebbar machen
//- Interaktionen mittels TUIO ermöglichen
//  (Ball erzeugen, Ball ziehen, Ball be- und entschleunigen)
//- AUDIO: mit Soundfiles arbeiten oder Wellen verbessern
//  z.B. Überlagerungen


import ddf.minim.*; 
import ddf.minim.signals.*; 

Segment[] s;
Ball b;
int abst = 50;
//Die Anordnung der Segmente erfolgt entlang des Screens. Der Abstand (abst)
//bestimmt die Anzahl der Segmente indem bestimmt werden kann, ob sie dichter
//oder weiter auseinander sein sollen

//sound
Minim sounds;
AudioOutput Aout;
SineWave squiggly;

void setup() {
  size(800, 800);
  noStroke();
  createSegments();
  b = new Ball(50, 50, 70, 0.4, 1.0);

  //sound
  sounds = new Minim(this);
  Aout = sounds.getLineOut(Minim.STEREO);
  squiggly = new SineWave(440, 0.5, Aout.sampleRate());
  Aout.addSignal(squiggly);
}

void draw() {
  background(0);  
  strokeWeight(20);
  b.update();
 
  //Segmente werden passend zur Ballposition bewegt
  for (int i=0; i<s.length; i++) {
    s[i].update(b.getBallX(), b.getBallY());
  }
  play();
}

//Erstellen der Segmente entlang des Screens mit zufälliger Anzahl von
//beweglichen Einzelteilen und deren Länge
void createSegments() {
  s = new Segment [2*width/abst+2*height/abst];
  for (int i=0; i<width/abst+1; i++) {
    s[i]= new Segment(i*abst, 0, (int)random(4, 10), (int)random(20, 40));
    s[i+width/abst+1]= new Segment(i*abst, height, (int)random(4, 10), (int)random(20, 40));
  }
  for (int i=1; i<height/abst; i++) {
    s[i+2*width/abst+1]= new Segment(0, i*abst, (int)random(4, 10), (int)random(20, 40));
    s[i+2*width/abst+height/abst]= new Segment(width, i*abst, (int)random(4, 10), (int)random(20, 40));
  }
}

//sound
void play() {
  Aout.setGain(-60);
  int attachedSeg = 0;
  for (int i=0; i<s.length; i++) {
    if (s[i].isOver(s[i].x[0], s[i].y[0], s[i].angle[0], b.getBallX(), b.getBallY())) { 
      Aout.setGain(0);     
      squiggly.portamento(200); 
       now(i);
      attachedSeg++;     
    }
    else{
      attachedSeg--;
    }
    println("Attached Segments: "+(s.length+attachedSeg)/2);
  }
}

int now(int i){
   float freq = (int)map(i, 0, s.length, 400, 150); 
   squiggly.setFreq(freq);
   return 1;
}

class Ball {
  float ballX;
  float ballY;
  int ballXDirection;
  int ballYDirection;
  float size;
  float speedX;
  float speedY;

  Ball(float xPos, float yPos, float size, float speedX, float speedY) {
    ballX = xPos;
    ballY = yPos;
    this.size=size;
    ballXDirection = 1;
    ballYDirection = 1;
    this.speedX=speedX;
    this.speedY=speedY;
  }

  void update() {
    ballX = ballX + speedX * ballXDirection;
    ballY = ballY + speedY * ballYDirection;
    if (ballX > width-size/2 || ballX < size/2) {
      ballXDirection *= -1;      
    }

    if (ballY > height-size/2 || ballY < size/2) {
      ballYDirection *= -1;

    }
    display();
  }

  void display() {
    fill(255,255,0, 100);
    ellipse(ballX, ballY, size, size);
    fill(255, 200);
    ellipse(ballX, ballY, 5, 5);
  }

  float getBallX() {
    return ballX;
  }

  float getBallY() {
    return ballY;
  }
}

class Segment {
  int numSegments;
  float[] x;
  float[] y;
  float[] angle;
  String music;
  float segLength;
  float targetX, targetY;

  Segment(int baseX, int baseY, int SegNum, int SegLen) {
    numSegments= SegNum;
    segLength = SegLen;
    x = new float[numSegments];
    y = new float[numSegments];
    angle = new float[numSegments];
    x[x.length-1] = baseX;
    y[x.length-1] = baseY;
  }
  
   void update(float ballX, float ballY) {
    reachSegment(0, ballX, ballY);
    for (int i=1; i<numSegments; i++) {
      reachSegment(i, targetX, targetY);
    }
    for (int i=x.length-1; i>=1; i--) {
      positionSegment(i, i-1);
    } 
    for (int i=0; i<x.length; i++) {
      segment(x[i], y[i], angle[i], (i+1)*2);
      
    }
    isOverColor(x[0], y[0], angle[0], ballX, ballY);
  }

  void reachSegment(int i, float xin, float yin) {
    float dx = xin - x[i];
    float dy = yin - y[i];
    angle[i] = atan2(dy, dx);  
    targetX = xin - cos(angle[i]) * segLength;
    targetY = yin - sin(angle[i]) * segLength;
  }

  void positionSegment(int a, int b) {
    x[b] = x[a] + cos(angle[a]) * segLength;
    y[b] = y[a] + sin(angle[a]) * segLength;
  }

//ein blauer Punkt wird ans Ende eines jeden Segments gezeichnet
//es wird ermittelt, ob das Segment am Ball hängt
void isOverColor(float x, float y, float a, float ballX, float ballY){  
    float xPos = x + cos(a) * segLength;
    float yPos = y + sin(a) * segLength; 
    if((int)ballX<(int)xPos+5&&(int)ballX>(int)xPos-5&&(int)ballY<(int)yPos+5&&(int)ballY>(int)yPos-5){
      fill(255, 0, 0, 100);
      ellipse(ballX, ballY, 20, 20);
      fill(255, 0, 0);
    }
    else{
      fill(0, 0, 255);  
    }
    ellipse(xPos, yPos, 5, 5);
    
}

//es wird ermittelt, ob das Segment am Ball hängt
boolean isOver(float x, float y, float a, float ballX, float ballY){  
    float xPos = x + cos(a) * segLength;
    float yPos = y + sin(a) * segLength; 
    if((int)ballX<(int)xPos+5&&(int)ballX>(int)xPos-5&&(int)ballY<(int)yPos+5&&(int)ballY>(int)yPos-5){
      return true;
    }
   return false;    
}

  void segment(float x, float y, float a, float sw) {
    stroke(0,200,0, 100);
    strokeWeight(sw);
    pushMatrix();    
    translate(x, y);
    rotate(a);
    line(0, 0, segLength, 0);
//    float p1 = map(sw, 0, 20, 0, 30);
//    float p2 = map(sw, 0, 20, 0, 20);
//    strokeWeight(sw/2);
//  line(0,-30/sw,-20/sw, 0);
//   line(0,30/sw,-20/sw, 0);
//    line(0,-p1,-p2, 0);
//   line(0,p1,-p2, 0);
    popMatrix();
    noStroke();
  }
}



