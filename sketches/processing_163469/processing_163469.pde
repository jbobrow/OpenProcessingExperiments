
// import modes.java.libraries.sound.bin.processing.sound.SoundFile;
// import processing.sound.*;

// SoundFile soundfile;

float angle=0;
float h=0;
// int colorCircle=200;
void setup() {
  size(600, 600);
  // soundfile = new SoundFile(this, "vibraphons.aiff");
  // println("SFSampleRate= " + soundfile.sampleRate() + " Hz");
  // println("SFSamples= " + soundfile.frames() + " samples");
  // println("SFDuration= " + soundfile.duration() + " seconds");
  // soundfile.loop();
}

void draw() {
  // soundfile.rate(map(mouseX, 0, width, 0.5, 0.9));  
  // soundfile.amp(map(mouseY, 0, width, 0.05, 1.0));
  background(200,mouseX+50,mouseY);
  fill(10,10,10);
  ellipse(300,300,4,4);
  fill(80,mouseX-500,mouseY-300,40);
  drawCircle(300, 300, 600);
  angle=angle+mouseX*0.0004;
  h=0.003*(mouseY+30);
  // angle=angle+0.0004*(mouseX-300);
  // h=0.003*(mouseY+30);
  // colorCircle=colorCircle-1;
  // drawCircle(width/2,300-(1-0.5*sqrt(2))*100,(sqrt(2)-1)*100);
}

void drawCircle(float x, float y, float d) {
  pushMatrix();
  translate(x,y);
  noStroke();
  scale(h);
  rotate(angle);
  // int g=100;
  // int b=100;
  // fill(random(100,200),50);
  ellipse(0, 0, d, d);
  float R=(1-0.5*sqrt(2))*d;
  if (d>5) {
    d=(sqrt(2)-1)*d;
    // g=g+50;
    // b=b+100;
    // fill(random(100,200),50);
    drawCircle(0, -R, d);
    drawCircle(0, +R, d);
    drawCircle(-R, 0, d);
    drawCircle(+R, 0, d);
  }
  popMatrix();
  // ellipse(x,y-R,d,d);
  // ellipse(x,y+R,d,d);
  // ellipse(x+R,y,d,d);
  // ellipse(x-R,y,d,d);
}


