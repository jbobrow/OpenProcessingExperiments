

import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;
ArrayList<Goccia> gocce= new ArrayList<Goccia>();
PFont f;

ResetButton resetButton;
 
void setup() {
  size(500, 500);
  f = createFont("helvetica", 16, true);
  minim = new Minim(this); 
  song = minim.loadFile("Adebisi_Shank.mp3", 1024);
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(300);
  bl = new BeatListener(beat, song);
  Goccia g= new Goccia(beat);
  gocce.add(g);
  
  resetButton= new ResetButton();
  
  background(0);
  
  
}
 
void draw() {
  background(0);
  song.play();
  for (int i =0; i< gocce.size();  i++) {
    Goccia g= (Goccia) gocce.get(i);
    g.display();
    g.move();   
  }
  textFont(f, 19);
  fill(255);
  text("Clicca su una goccia!", 10, height-20);
  
  strokeWeight(1);
  stroke(255);
  fill(0);
  resetButton.display();
}
 
void mousePressed() {
  if(resetButton.isClicked(mouseX,mouseY)){
    song.rewind();
    gocce= new ArrayList<Goccia>();
    background(0);
    Goccia g= new Goccia(beat);
    gocce.add(g);
    
  }else{
    boolean trovato= false;
    int i=0;
    while(i<gocce.size()&&!trovato){
      Goccia g= (Goccia) gocce.get(i);
      if (g.contains(mouseX, mouseY)) {
        trovato= true;
        Goccia g2= new Goccia(beat);
        gocce.add(g2);
          
      }
      i++;
    }
  
  }
}

void stop() {
  song.close();
  minim.stop();
  super.stop();
}


