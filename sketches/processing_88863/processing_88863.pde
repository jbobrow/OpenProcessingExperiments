
/**
 * It's the Duck Duck Go Duck 
 * playing the Saxophone to today's greatest hits,
 * what more do you want?
 */

/* @pjs preload="duckhead.png,duckwing.png,sax.png,mainstage.png"; */
import netscape.javascript.*;
import ddf.minim.analysis.*;
import ddf.minim.*;
Minim minim;
AudioPlayer player;
FFT fftLin;

PImage head, hand, sax, main;

String []  songs = {"Epic Sax", "Careless Whisper", "Benny Hill"};
float rollingFft = 0;
int selection = int(random(songs.length));
int saxBand = 0;
float amplitude = 1;
float dropThresh = -.7;

PFont font;

void setup() {
  size(1270, 720);
  minim = new Minim(this);
  player = minim.loadFile(songs[selection]+".mp3", 1024);
  main = loadImage("mainstage.png");
  sax  = loadImage("sax.png");
  hand = loadImage("duckwing.png");
  head = loadImage("duckhead.png");
  player.loop();
  frameRate(40);
  
  fftLin = new FFT( player.bufferSize(), player.sampleRate() );
  
  // calculate the averages by grouping frequency bands linearly. use 30 averages.
  fftLin.linAverages( 30 );
  font = loadFont("ArialMT-12.vlw");
} 

void draw(){
  textFont(font);
  
  fftLin.forward( player.mix );
  image(main, 0,0);
  rollingFft = weightedAvg(fftLin.getAvg(saxBand),.5);
    
    pushMatrix();
    translate(954, 457);
    rotate(amplitude*sin(map(rollingFft, 0, 50, 0, PI/4)));
    fill(0);
    image(sax,-580,-210);
    image(hand,-470,140);
    image(head, -322, -423);
    popMatrix();
   
  fill(255, 128);
  rect(250, 200, 30, -fftLin.getAvg(saxBand)*4);
  textSize(50);
  text("Song Title:\n  "+ songs[selection],300,50);
  textSize(18);
  text("FFT Band: " + saxBand, 250, 220);
  text("Amplitude: " + amplitude, 250, 240);
  text("mouseX: " + mouseX + "\nmouseY: " + mouseY,250,260);
  loadPixels();
  color pix = pixels[mouseY*width + mouseX];
  text("color: " + red(pix) + ", " + green(pix) + ", " + blue(pix), 250,320);
  text("Song: U (stop), P (play)\n         I/O (for/rev)\nFFT Band: K/L (for/rev)\nAmp: A/Z (up/down)", 20,20);
}

float weightedAvg(float signal, float weight) {
  return (signal*weight + rollingFft)/(weight+1);  
}

void keyPressed(){
  switch(key) {
    case 'k':
      saxBand--;
      if(saxBand == -1) {saxBand = 0;}
      break;
    case 'l':
      saxBand++;
      if(saxBand == 21) {saxBand = 20;}
      break;
    case 'a':
      amplitude += 0.1;
      break;
    case 'z':
      amplitude -= 0.1;
      break;
    case 's':
      dropThresh += 0.1;
      break;
    case 'x':
      dropThresh -= 0.1;
      break;
    case 'u':
      player.close();
      break;
    case 'p':
      player = minim.loadFile(songs[selection]+".mp3", 1024);
      player.loop();
      break;
    case 'o':
      if(selection == songs.length - 1){
        break;
      }
      else {
        selection++;
        break;
      }
    case 'i':
      if(selection == 0) {
        break;
      }
      else {
        selection--;
        break;
      }
  }
}

