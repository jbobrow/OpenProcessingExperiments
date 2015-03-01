

void setup()
{
  setupAudio();
  size(600,750);
  PFont myFont;
  myFont = createFont("arial",25);
  textFont(myFont);
  fill(0);
}

void draw()
{
  background(255,255,255); 
  getVolume(); // this call fetches the mic volume for the current frame.
  float Y = map(volume, 0,100, 2,120);  // now we can use it for something!
  drawCircle();   
}

void drawCircle() {
  float Y = map(volume, 0,300, 2,120);
  ellipse(300, 400,Y+Y+200,Y+Y+200);
  stroke(0);
  strokeWeight(3);
  noFill();
  ellipse(273,371,Y+15,2.5*Y+30);
  ellipse(328,371,Y+15,2.5*Y+30);
  line(Y+355,400,Y+375,400);
  line(-Y+225,400,-Y+245,400);
  text("HSKB",300,580+1.5*Y);
  textAlign(CENTER);
  textSize(1.5*Y+25);
}

// Don't worry about understanding the stuff below!
import ddf.minim.*;
 
Minim minim;
AudioInput in;
float volume = 0;
float volumeF = 0; 
 
//-------------------------------------
void setupAudio(){
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 512);
}
 
//-------------------------------------
void getVolume(){
  volumeF = in.right.level()*1000;
  volume = 0.8*volume + 0.2*volumeF;
}
 
//-------------------------------------
void stop(){
  in.close();
  minim.stop();
  super.stop();
}


