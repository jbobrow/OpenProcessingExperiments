
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

PFont font;

Minim minim;
AudioInput in;
AudioRecorder recorder;
AudioPlayer player;
AudioOutput out;

void setup() {
  size(512, 1000);
  
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
  recorder = minim.createRecorder(in, "myrecording.wav", true);
  player = minim.loadFile("myrecording.wav", 512);
  out = minim.getLineOut();

}

void draw() {
  background(180);

  font = loadFont("AkzidenzGrotesk-Bold-180.vlw");
  textFont(font);
  text("SKEW", 10, 140);

  stroke(255);
  pushMatrix();
  translate(0, 140);
  for(int i = 0; i < in.left.size()-1; i++) {
    line(i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50);
    line(i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50);
  }
  popMatrix();
      
    font = loadFont("AkzidenzGrotesk-Bold-108.vlw");
    if (in.hasControl(Controller.MUTE) ) {
    if (player.isPlaying() || recorder.isRecording()) { 
      in.unmute(); }
      else {
        in.mute();
      }
    if ( in.isMuted() )
    {
      text("M", 60, 800);
    }
    else
    {
      text("M", 60, 800);
    }
  }

  if (player.isPlaying()) {
    text("P", 215, 800); }
    else {
      text("P", 215, 800);
    }
  
  if (recorder.isRecording()) {
    ellipse(140, 340, 30, 30);
    text("R", 10, 450); }
    else {
      text("R", 10, 450); }
  
  textFont(createFont("Aril", 12));
  text("v 0.1", 480, 140);
  text("Press R to record your shriek of death", 140, 450);
  
  
}


void keyReleased() {
  if (key == 'r') {
    if (recorder.isRecording()) {
      recorder.endRecord();
      recorder.save();
      println("Done saving."); }
      else {
        recorder.beginRecord();
      }
  }
  if (key == 'p') {
    player.play(); 
  }
  if (key == '1') {
    if (in.hasControl(Controller.VOLUME)) {
      float val = 0.5;
      in.setVolume(val);
      player.play();
      text("The current colume is " + in.getVolume() + ".", 5, 60); }
      else {
        text("There is no volume control for this input.", 5, 60); }
  }
  if (key == 's') {
    recorder.save();
    println("Done saving.");
  }
}

void stop() {
  in.close();
  player.close();
  minim.stop();
}    
      




