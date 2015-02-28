
//press p to play music and s to stop the music

//defining what will be in the sketch
PImage record;
float angle;
float c = 0;
PImage transparency;
float xpos;
float ypos;
float drag = 30.0;
PImage needle;
import ddf.minim.*;

Minim minim;
AudioSample stop;
AudioSample music;


//how the sketch will be setup
void setup() {
size(600,400);
record = loadImage("record.png");
transparency = loadImage("transparency.jpg");
needle = loadImage("needle.png");
minim = new Minim(this);
stop = minim.loadSample("BD.mp3", 2048);
music = minim.loadSample("music.mp3", 2048);
smooth();
noStroke();
fill(255);
//framerate, how many frames per second
frameRate(30);
}
//determines what will be put in the sketch in order of what is written first

void draw() {
//draw background
background(transparency);
//rotation
if (c > 6) {
c = 0;
} else {
c = c + 0.2;
}
println(c);
//moves spinning record
translate(200, 200);
rotate(c);
//point about which image spins
image(record, -250,-250);
//triggers for playing and stopping music
}void keyPressed()
{
if ( key == 's' ) stop.trigger();
if ( key == 'p' ) music.trigger();
}

void stop()
{
  //closes music tracks
music.close();  
stop.close();
minim.stop();

super.stop();
}

