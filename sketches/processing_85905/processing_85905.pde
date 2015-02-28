
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;
color c;

void setup() {
size(400, 300);
smooth();
background(0);
minim = new Minim(this);

// specify 361 for the length of the sample buffers
song = minim.loadFile("song.mp3", 361);
song.loop();
}

void draw(){
noStroke();

// draw an alpha background for fading effect
fill(0,50);
rect(0,0,width,height);
/*
we draw the wave by connecting neighbor values (every 5 ponits) with a line.
we map each of the values by 0 tp 100 for distance.values in the buffers have to normalized.
hey are values between -1 and 1.
*/
filter(BLUR); // Blur effect. if you dont want it, just mark it!

// for left Channel
pushMatrix(); // for transfering
translate(width/2-100, height/2);

// make a new color of wave based on buffered values;
c = color(map(abs(song.left.get(0)),0,1,200,50),map(abs(song.left.get(120)),0,1,200,50),map(abs(song.left.get(240)),0,1,200,50));
stroke(c);

for(int i = 0; i < 360; i+=5){
  int nexti = (i+5 >= 360)?0:i+5; // for last point.
  line(cos(radians(i))*map(song.left.get(i),-1,1,0,100), sin(radians(i))*map(song.left.get(i),-1,1,0,100),cos(radians(i+5))*map(song.left.get(nexti),-1,1,0,100), sin(radians(i+5))*map(song.left.get(nexti),-1,1,0,100));
}
popMatrix();


// for right Channel
pushMatrix(); // for transfering
translate(width/2+100, height/2);
// make a new color of wave based on buffered values;
c = color(map(abs(song.right.get(0)),0,1,200,50),map(abs(song.right.get(120)),0,1,200,50),map(abs(song.right.get(240)),0,1,200,50));
stroke(c);

for(int i = 0; i < 360; i+=5){
  int nexti = (i+5 >= 360)?0:i+5; // for last point.
  line(cos(radians(i))*map(song.right.get(i),-1,1,0,100), sin(radians(i))*map(song.right.get(i),-1,1,0,100),cos(radians(i+5))*map(song.right.get(nexti),-1,1,0,100), sin(radians(i+5))*map(song.right.get(nexti),-1,1,0,100));
}
popMatrix();
}

// Music by DJ Yahel - Bomb Creator 


