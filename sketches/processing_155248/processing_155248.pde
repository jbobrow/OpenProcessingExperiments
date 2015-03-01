
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

Maxim maxim;
AudioPlayer player;
float power=0;
//float threshold = 0.35;// vary this until the square appears on the beats
float threshold = 0.25;// vary this until the square appears on the beats
int wait = 0;
boolean playit = false;
float magnify = 300; // This is how big we want the rose to be.
float rotation = 0; // rotation : this is basically how far round the circle we are going to go
float radius = 0; // radius : this is basically how far from the origin we are.
int elements = 256;// This is the number of points and lines we will calculate at once. 1000 is alot actually. 
float speed=1;
float volume=50;
void setup() {
  //iPad portrait. Swap the numbers for landscape. 
  size(768, 640);
  rectMode(CENTER);
  colorMode(HSB);
  frameRate(20); // this is the framerate. Tweak for performance.
  maxim = new Maxim(this);
  player = maxim.loadFile("mybeat.wav");
  player.setLooping(true);
  player.setAnalysing(true);
  rectMode(CENTER);
  background(0);
}

void draw() {
  if (playit) {
    // Start player
    player.play(); 
    // Get power average
    power = player.getAveragePower(); 
    // Set radius and rotation
    radius = map(power*power*power, 0, 1, 0, 10);
    rotation = map(power*random(5), 0, 1, 0, 10);
    float spacing = TWO_PI/elements; // this is how far apart each 'node' will be - study it. 
    translate(width*0.5, height*0.5);// we translate the whole sketch to the centre of the screen, so 0,0 is in the middle.
    noFill();
    strokeWeight(2);
    // 
    if (power>threshold && wait < 0) {
      background(255);
      wait=4;
    }
    else{
      background(0);
    }
    wait--;
    for (int i = 0; i < elements; i++) {
      stroke(i, 255, 255);
      pushMatrix();
      rotate(i*sin(spacing*i*rotation));
      translate(tan(spacing*i*radius)*magnify*power, 0);
      if (i%2==0) {
        ellipse(0, 0, 50*power, 50*power);
      } else {
        rect(random(10), random(10), 20*power, 20*power);
      }
      popMatrix();
      stroke(i, 255*cos(i)*tan(i), 255*sin(i), tan(i)*i);
      pushMatrix();
      rotate(-i*sin(spacing*i*rotation)*cos(i));
      translate(sin(spacing*i*radius)*magnify*cos(power), tan(i));
      ellipse(0, 0, i*sin(power), i*cos(power));
      popMatrix();
    }
    
  }


}

void mousePressed() {

  playit = !playit;

  if (playit) {

    player.play();
  } else {

    player.stop();
  }
}





