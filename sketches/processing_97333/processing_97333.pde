
import processing.dxf.*; 
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer mp3;

AudioOutput out;
SineWave sine;

boolean export;

int x;
int y;
float outerRad;
float innerRad;


void setup() {
  size(600, 600, P3D);
  minim = new Minim(this);


  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440, 0.3, out.sampleRate());
  sine.portamento(200);
  out.addSignal(sine);

  export = false;
  noFill();
  stroke(255);
  
   x = width/2;
  y = height/2;
  outerRad = min(width, height) * 0.2;
  innerRad = outerRad * 0.3;
}



void draw() {
  if (export == true) {
    //   beginRaw(out);
    beginRaw(DXF, "audioExport.dxf");
  }

  background(0);
  translate(0, 0);

  int pts = int(map(mouseX, 0, width/2, 10, 20));
  float rot = 180.0/pts;
  float angle = 0;
 
 for (int j = 0; j < 10; j++) {
  beginShape(TRIANGLE_STRIP); 
  for (int i = 0; i <= pts; i++) {
    float px = x + cos(radians(angle)) * outerRad;
    float py = y + sin(radians(angle)) * outerRad;
    angle += rot;
    vertex(px, py, j*20);
    px = x + cos(radians(angle)) * innerRad;
    py = y + sin(radians(angle)) * innerRad;
    vertex(px, py, j*20); 
    angle += rot;
  }
  endShape();
  }
  
  if (export == true) {
    endRaw();
    export = false;
  }
}

void keyPressed() {
  if (key == 'e') {
    export = true;
  }
}
