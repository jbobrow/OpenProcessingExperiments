
import arb.soundcipher.*;

SoundCipher sc = new SoundCipher(this);
SCScore score = new SCScore();
float beatCount = 0;
float pitch = 60;
float duration = 0.5;
float dynamic = 60;
float tempo = 300;
float beatSize = 200;
float r,g,b;

void setup() {
  noLoop();
  size(400,400);
  background(255,0,255);
   sc.instrument(sc.GUITAR);
  score.tempo(tempo);
  score.addCallbackListener(this);
  score.addCallback(0.5, 1);
  score.play(-1);
  redraw();
}

void draw() {
  if (beatCount * beatSize > width) {
    background(255,255,0);
    beatCount = 0;
  }
  stroke(255 - dynamic*2);
  fill(r,g,b);
  r = random(255); g = random(255); b = random(255);
  rect(beatCount * beatSize , height - pitch + 1, 
    beatCount * beatSize + duration * beatSize, height - pitch + 1);
    ellipse(beatCount * beatSize , height + pitch + 5, 
    beatCount * beatSize + duration * beatSize, height - pitch + 35);
  sc.playNote(pitch, dynamic, duration);
}

void handleCallbacks(int callbackID) {
  redraw();
  // compute new values
  background (255,0,0);
  beatCount += duration;
  if (beatCount%4 == 0 || random(10) < 2) {
    duration = 0.5;
    pitch = sc.pcRandomWalk(pitch, 4, sc.MINOR_TRIAD);
  } else  {
    background (0,255,255);
    duration = 0.5;
    pitch = sc.pcGaussianWalk(pitch, 3, sc.MINOR);
    
  }
  dynamic = cos(PI * 3 * beatCount) * 150 + 90;
  // refresh score with new values
  score.empty();
  score.addCallback(duration, 2);
  
}
