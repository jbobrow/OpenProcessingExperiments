
import ddf.minim.*;

Minim minim;
AudioPlayer song;

float x;
float y;

void setup () {
  size (displayWidth,displayHeight);
  smooth();

  x = 100;
  y = 100;
  background(#eeeeee);

  minim = new Minim (this);
  // Load the audio file
  song = minim.loadFile ("x.wav");
  song.play ();
  song.loop();
}

void draw () {
  fill(#eeeeee, 30);

  float di = song.mix.level() * 250;
  float c = map(di, 0, 200,0, 200);

  for (int a = 0; a < width; a= a+ 150) { 
    for (int b= 0; b < height; b = b+150) { 
      
      strokeWeight(random(5));
      noFill(); 
      stroke(64,64,64);
      ellipse(a-100,b,c,c);
      stroke(0,103,242);
      rect(a, b, 70, 70); 
      stroke(13,53,108); 
      ellipse(a+40, b, c, c); 
      stroke(136,150,170); 
      rect(a+140, b+40, 50, 50);
      stroke(23,27,131);
      rect(a-10, b-10, c,c);  
      stroke(51,59,70); 
      ellipse(a+40, b+150, 50, 50); 
      stroke(173,176,252);
      rect(a+15, b+15, 20, 20);
    } 
  } 
    }


void keyPressed() {
  if (key=='q') exit();
}

void stop() {
  song.close();
  minim.stop();
  super.stop();
}



