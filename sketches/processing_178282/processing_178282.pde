
PImage [] flyingDragonRight = new PImage[4];
PImage [] flyingDragonLeft = new PImage[4];
int currentFrame = 0;

void setup() {
  size(1040,620, P3D);
  frameRate(30);
 
  minim = new Minim(this);  
  out = minim.getLineOut();
  
  flyingDragonRight[0] = loadImage("dragon1.png");
  flyingDragonRight[1] = loadImage("dragon2.png");
  flyingDragonRight[2] = loadImage("dragon3.png");  
  flyingDragonRight[3] = loadImage("dragon4.png");

  flyingDragonLeft[0] = loadImage("dragonRev1.png");
  flyingDragonLeft[1] = loadImage("dragonRev2.png");
  flyingDragonLeft[2] = loadImage("dragonRev3.png");  
  flyingDragonLeft[3] = loadImage("dragonRev4.png");

}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//                            Stage 1- Creating the piano
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//creating the piano key board top
void pianoTop(){
  fill(50,0,0);
  stroke(50,0,0);
  rect(10, (height/4)+80, width-20, 60);
  fill(255);
  textAlign(CENTER, CENTER);
  PFont font;
  font = createFont("DragonBreath.ttf", 60);
  textFont(font);
  text("Dragon's Den Technologies", (width-20)/2, (height/4)+115);  
}

//global sizes and Y position
static float keyStartingY = 295;
static float keyWidth = 127.5;
static float keyHeight = 270;

//make keyboard keys separately
void keyA() {
  fill(255);
  stroke(0);
  rect(10, keyStartingY, keyWidth, keyHeight);
  fill(0);
  text("A", 10+(keyWidth/2), (height-(height/4))+60);
}

void keyS() {
  fill(255);
  stroke(0);
  rect(137.5, keyStartingY, keyWidth, keyHeight);
  fill(0);
  text("S", 137.5+(keyWidth/2), (height-(height/4))+60);
}

void keyD() {
  fill(255);
  stroke(0);
  rect(265, keyStartingY, keyWidth, keyHeight);
  fill(0);
  text("D", 265+(keyWidth/2), (height-(height/4))+60);
}

void keyF() {
  fill(255);
  stroke(0);
  rect(392.5, keyStartingY, keyWidth, keyHeight);
  fill(0);
  text("F", 392.5+(keyWidth/2), (height-(height/4))+60);
}

void keyH() {
  fill(255);
  stroke(0);
  rect(520, keyStartingY, keyWidth, keyHeight);
  fill(0);
  text("H", 520+(keyWidth/2), (height-(height/4))+60);
}

void keyJ() {
  fill(255);
  stroke(0);
  rect(647.5, keyStartingY, keyWidth, keyHeight);
  fill(0);
  text("J", 647.5+(keyWidth/2), (height-(height/4))+60);
}

void keyK() {
  fill(255);
  stroke(0);
  rect(775, keyStartingY, keyWidth, keyHeight);
  fill(0);
  text("K", 775+(keyWidth/2), (height-(height/4))+60);
}

void keyL() {
  fill(255);
  stroke(0);
  rect(902.5, keyStartingY, keyWidth, keyHeight);
  fill(0);
  text("L", 902.5+(keyWidth/2), (height-(height/4))+60);
}

//bring all keyboard pieces together
void drawKeyBoard() {
  pianoTop();
  
  PFont standFont;
  standFont = createFont("arial.ttf", 20);
  textFont(standFont);
  
  keyA();
  keyS();
  keyD();
  keyF();
  keyH();
  keyJ();
  keyK();
  keyL();
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//                          Stage 2- Sound Implementing
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;

class SineInstrument implements Instrument {
  Oscil wave;
  Line  ampEnv;
  
  SineInstrument(float frequency) {
    wave   = new Oscil(frequency, 0, Waves.SINE);
    ampEnv = new Line();
    ampEnv.patch(wave.amplitude);
  }
  
  void noteOn(float duration) {
    ampEnv.activate(duration, 0.8f, 0);
    wave.patch(out);
  }

  void noteOff() {
    wave.unpatch(out);
  }
}


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//                          Stage 3- keyPressed Option
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
void keyPressed(){
  if(key == 'a'){
    fill(0);
    rect(10, keyStartingY, keyWidth, keyHeight);
    fill(255);
    text("A", 10+(keyWidth/2), (height-(height/4))+60);   
    
    out.playNote( 0.0, 0.9, new SineInstrument( Frequency.ofPitch( "C" ).asHz() ) );
  }
  if(key == 's'){
    fill(0);
    rect(137.5, keyStartingY, keyWidth, keyHeight);
    fill(255);
    text("S", 137.5+(keyWidth/2), (height-(height/4))+60);  

    out.playNote( 0.0, 0.9, new SineInstrument( Frequency.ofPitch( "D" ).asHz() ) );
  }
  if(key == 'd'){
    fill(0);
    rect(265, keyStartingY, keyWidth, keyHeight);
    fill(255);
    text("D", 265+(keyWidth/2), (height-(height/4))+60);

    out.playNote( 0.0, 0.9, new SineInstrument( Frequency.ofPitch( "E" ).asHz() ) );
  }
  if(key == 'f'){
    fill(0);
    rect(392.5, keyStartingY, keyWidth, keyHeight);
    fill(255);
    text("F", 392.5+(keyWidth/2), (height-(height/4))+60);

    out.playNote( 0.0, 0.9, new SineInstrument( Frequency.ofPitch( "F" ).asHz() ) );
  }
  if(key == 'h'){
    fill(0);
    rect(520, keyStartingY, keyWidth, keyHeight);
    fill(255);
    text("H", 520+(keyWidth/2), (height-(height/4))+60);

    out.playNote( 0.0, 0.9, new SineInstrument( Frequency.ofPitch( "G" ).asHz() ) );
  }
  if(key == 'j'){
    fill(0);
    rect(647.5, keyStartingY, keyWidth, keyHeight);
    fill(255);
    text("J", 647.5+(keyWidth/2), (height-(height/4))+60);

    out.playNote( 0.0, 0.9, new SineInstrument( Frequency.ofPitch( "A" ).asHz() ) );
  }
  if(key == 'k'){
    fill(0);
    rect(775, keyStartingY, keyWidth, keyHeight);
    fill(255);
    text("K", 775+(keyWidth/2), (height-(height/4))+60);

    out.playNote( 0.0, 0.9, new SineInstrument( Frequency.ofPitch( "B" ).asHz() ) );
  }
  if(key == 'l'){
    fill(0);
    rect(902.5, keyStartingY, keyWidth, keyHeight);
    fill(255);
    text("L", 902.5+(keyWidth/2), (height-(height/4))+60);  

    out.playNote( 0.0, 0.9, new SineInstrument( Frequency.ofPitch( "C5" ).asHz() ) );
  }
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//                          Stage 4- Adding Pictures
//                              in setup & draw
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
float yPos = 20;
String dir = "right";

void flapDragonWings() { 
  currentFrame = (currentFrame+1) % 4; 
  for (int x = -100; x < width; x += flyingDragonRight[0].width) { 
    if(yPos >= 20 && yPos < width-100 && dir == "right") {
      image(flyingDragonRight[(currentFrame) % 4], yPos, 50);
      yPos += 1;
    }
    else if(yPos >= 20 && yPos < width-100 && dir == "left") {
      image(flyingDragonLeft[(currentFrame) % 4], yPos, 50);
      yPos -= 1;
    }
    else if(yPos >= width-100) {
      image(flyingDragonLeft[(currentFrame) % 4], yPos, 50);
      dir = "left";
      yPos -= 1;
    }
    else if(yPos < 20) {
      image(flyingDragonRight[(currentFrame) % 4], yPos, 50);
      dir = "right";
      yPos += 1;
    }
  }  
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//                                 Draw Function
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void draw() {  
  background(0);
  stroke(255,0,0);
  
  for(int i = 0; i < out.bufferSize() - 1; i++) {
    line( i, 50 + out.left.get(i)*50, i+1, 50 + out.left.get(i+1)*50 );
    line( i, 150 + out.right.get(i)*50, i+1, 150 + out.right.get(i+1)*50 );
  }

  flapDragonWings();
  drawKeyBoard();
}


