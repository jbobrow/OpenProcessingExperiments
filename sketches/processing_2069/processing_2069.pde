
import traer.physics.*;

import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

static final String MP3_FILE = "Revolve.mp3";
// "Revolve" by hisboyelroy 2005 - Licensed under Creative Commons

static final int MAX_PARTICLES = 2500;

ParticleSystem physics;
// Audio
Minim minim;
AudioPlayer player;

// Echonest Analysis
ArrayList segments = new ArrayList();
ArrayList sections = new ArrayList();
ArrayList timbreRangeList = new ArrayList();
int segIdx = 0;             // Current segment
int sectionIdx = 0;         // Current section
float currentColor = 0;     // Current color
int timbreIdx = 1;          // Current timbre start
float lastTime = 0;         // Last song position in seconds

public void setup() {
  size(800, 600);
  background(20,20);
  smooth();
  colorMode(HSB);

  physics = new ParticleSystem(0.2f, 0.001f);

  loadMp3(MP3_FILE);
  loadEchoNestAnalysis(MP3_FILE);

  player.loop();
}

void loadMp3(String filename) {
  // start up Minim
  minim = new Minim(this);        
  player = minim.loadFile(filename);        
}

void loadEchoNestAnalysis(String filename)  {

  String[] lines = loadStrings(MP3_FILE + ".en");        

  for (int i = 0; i < lines.length; i++) {
    String line = lines[i];
    if (line.startsWith("#")) {
      continue;
    }
    if (line.startsWith("SECTION")) {
      String[] sec = line.split(" ");
      Section section = new Section(Float.parseFloat(sec[1]), Float.parseFloat(sec[2]));
      sections.add(section);
    } 
    else if (line.startsWith("SEGMENT")) {
      String[] seg = line.split(" ");
      float start = Float.parseFloat(seg[1]);
      float loudness = Float.parseFloat(seg[2]);
      Segment segment = new Segment();
      segment.setStart(start);
      segment.setMaxLoudness(loudness);

      float[] pitches = new float[12];
      for (int j = 0; j < 12; j++) {
        pitches[j] = Float.parseFloat(seg[3 + j]);
      }
      segment.setPitches(pitches);

      float[] timbre = new float[12];
      for (int j = 0; j < 12; j++) {
        timbre[j] = Float.parseFloat(seg[15 + j]);
      }
      segment.setTimbre(timbre);
      segments.add(segment);                
    }
  }

  // Get min/max values for timbre
  for (int i = 0; i < 12; i++) {
    ValueRange vr = new ValueRange();
    timbreRangeList.add(vr);
    for( int j=0; j < segments.size(); j++ ) {
      Segment seg = (Segment) segments.get(j);
      float t = seg.getTimbre()[i];
      if (t < vr.minValue) {
        vr.minValue = t;
      }
      if (t > vr.maxValue) {
        vr.maxValue = t;
      }
    }
  }
}

public void stop() {
  player.close();
  minim.stop();
  super.stop();
}

public void draw() {

  // determine the current time in seconds
  float curTime = player.position() / 1000f;
  if (curTime < lastTime) {
    sectionIdx = 0;
    segIdx = 0;
  }
  lastTime = curTime;

  // cheap blur effect
  if (frameCount % 10 == 0) {
    noStroke();
    fill(0, 40);
    rect(0, 0, width, height);
  }
 
  // change which timbre colors to use when the section changes
  if (sectionIdx < sections.size() - 1 && curTime > ((Section)(sections.get(sectionIdx))).getStart()) {
    sectionIdx++;
    timbreIdx = (timbreIdx + 1) % 6;
  }

  // find the current segment
  if (segIdx < segments.size() - 1 && curTime > ((Segment)(segments.get(segIdx))).getStart()) {

    Segment seg = (Segment) segments.get(segIdx);
    segIdx++;
    
    // convert dB to voltage to determine the velocity of particles
    float voltage = pow(10, seg.getMaxLoudness() / 10);
    float size = voltage * 1000f;
    //
    // Calculate current color based on mapped timbre
    //
    ValueRange vr1 = (ValueRange) timbreRangeList.get(timbreIdx);
    ValueRange vr2 = (ValueRange) timbreRangeList.get(timbreIdx + 1);
    int color1 = (int) map(seg.getTimbre()[timbreIdx], vr1.minValue, vr1.maxValue, 0, 255);
    int color2 = (int) map(seg.getTimbre()[timbreIdx + 1], vr2.minValue, vr2.maxValue, 0, 255);
    currentColor = blendColor(color1, color2, BLEND);

    if (physics.numberOfParticles() < MAX_PARTICLES ) {
      float yvel = map(constrain(size, 0, 140), 0, 140, 1, -10);
      for (int pitch = 0; pitch < 12; pitch++) {
        float pval = seg.getPitches()[pitch];
        if (pval > .75) {
          int numParticles = (int) (constrain(size * pval, 0, 50));
          for (int i = 0; i < numParticles; i++) {
            Particle p = physics.makeParticle(1, 60 + (pitch * 60), height - 50, 0);
            p.setVelocity(random(-2, 2), random(yvel - 5, yvel + 2), 0);
          }
        }
      }
    }
  }

  physics.tick();

  noStroke();
  for (int i = 0; i < physics.numberOfParticles(); ++i) {
    Particle p = physics.getParticle(i);
    fill(currentColor, 200, 255, 255 / (p.age() + 1));
    ellipse(p.position().x(), p.position().y(), 5, 5);
    if (p.age() > 128 || p.position().y() > height) {
      p.kill();
    }
  }

}

class ValueRange {

  public float minValue = Float.MAX_VALUE;
  public float maxValue = Float.MIN_VALUE;
}


