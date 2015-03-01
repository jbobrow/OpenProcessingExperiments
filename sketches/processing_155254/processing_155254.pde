
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


//When running on the iPad or iPhone, you won't see anything unless you tap the screen.
//If it doesn't appear to work first time, always try refreshing the browser.


Maxim maxim;
AudioPlayer player;

float magnify = 300; // This is how big we want the rose to be.
float phase = 0; // Phase Coefficient : this is basically how far round the circle we are going to go
float amp = 0; // Amp Coefficient : this is basically how far from the origin we are.
int elements = 400;//This is the number of points and lines we will calculate at once. 1000 is alot actually. 
float threshold = .35;//Try increasing this if it jumps around too much
int wait=0;
boolean playit;
float time = 0;

void setup() {
  size(612, 612);
  maxim = new Maxim(this);
  player = maxim.loadFile("droost.mp3");
  player.setLooping(true);
  player.volume(1.0);
  player.setAnalysing(true);
  background(0);
}

void draw() {
 float power = 0;
  if (playit) {
    player.play();
    power = player.getAveragePower();
    //detect a beat
    if (power > threshold && wait<0) {
      phase+=power*10; 
      wait+=10; //let's wait a bit before we look for another beat
    }
    wait--;// counting down...
  }
  amp += 0.05;//get the mouse Y coordinate and use it to set the current amp coefficient
  frameRate(15);
  background(0);
  stroke(255);
  translate(width*0.5, height*0.5);// we translate the whole sketch to the centre of the screen, so 0,0 is in the middle.
  noFill();
  time=time+0.005; /* update the value in the variable 'time'. This means that we add 1 to 'time' every frame */
  for (int i = 0;i < elements; i++) { /* this for loop organises the drawing. It will do the drawing 20 times (between 0 and 19)  */
    rotate(time+power/100); /* rotate the coordinate system a bit */
    /* this is the actual drawing.
    This says 'Draw a line, starting from i,i (x and y location), and being of size i*5 in both width and depth
    because it's in a for loop, it gets 'called' (used) 20 times, with a different value for 'i' each time */
    ellipse(i,i,power*100,power*100);
  }
}

void mousePressed() {

  playit = !playit;

  if (playit) {

    player.play();
  } 
  else {

    player.stop();
  }
}



