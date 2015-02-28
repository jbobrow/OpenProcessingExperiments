
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
FFT fft;

static final float MAX_TILE_ROTATION_DELTA = 0.001;  //inserendo numeri decimali piu piccoli la velocita rallenta
static final float MAX_ROTATION_DELTA = 0.0004;

float tileRotation;
float rotation;
float tileRotationDelta;
float rotationDelta;

boolean ruota;

int x;
color c;


void setup()
{
size(600, 600, P3D);
textMode(SCREEN);

minim = new Minim(this);

song = minim.loadFile("02 - Bangarang feat. Sirah (Original Mix).mp3", 1024);
song.loop();

fft = new FFT(song.bufferSize(), song.sampleRate());
fft.linAverages(80);

ruota=false;
tileRotationDelta = 0;
rotationDelta = 0;

}

//se premo il mouse, l'insieme dei rettangoli ruota, se invece già sta ruotando inverte la rotazione.
void mousePressed() {
if(ruota==false){
tileRotationDelta = random(-MAX_TILE_ROTATION_DELTA, MAX_TILE_ROTATION_DELTA);
rotationDelta = random(-MAX_ROTATION_DELTA, MAX_ROTATION_DELTA);
ruota=true;
}
else{
tileRotationDelta *= -1;
rotationDelta *= -1;
}
}

//se premo il tasto s della tastiera la rotazione si ferma
void keyPressed() {
if(key=='s' || key=='S'){
ruota=false;
tileRotationDelta = 0;
rotationDelta = 0;
}
}

void draw()
{
background(0);
stroke(255);

fft.forward(song.mix);
println(fft.specSize());
int w = int(width/fft.avgSize());
int q = 600-height;

translate(300,300);
tileRotation = (tileRotation + tileRotationDelta + TWO_PI) % TWO_PI;
rotation = (rotation + rotationDelta + TWO_PI) % TWO_PI;

c=color(map(mouseX,0,width,0,255),map(mouseY,0,height,0,255),x);
x=x+10;
if(x>255)
x=10;

for (int i = 0; i < fft.avgSize(); i++)
{
rotate(i);
rotate(rotation);

fill(c);
rectMode(CENTER);
if (i>=fft.avgSize()/2) {
  rect(4,5,50 + fft.getAvg(i)*10,50 + fft.getAvg(i));
} else {
  rect(4,5,50 + fft.getAvg(i),50 + fft.getAvg(i));
}
}
for (int i = 0; i < fft.avgSize(); i++)
{
rotate(i);
rotate(rotation);

fill(c);

if (i>=fft.avgSize()/2) {
  rect(150,100,50 + fft.getAvg(i)*10,50 + fft.getAvg(i));
} else {
  rect(150,100,50 + fft.getAvg(i),50 + fft.getAvg(i));
}
}

fill(255);
}


void stop()
{
song.close();
minim.stop();

super.stop();
}

