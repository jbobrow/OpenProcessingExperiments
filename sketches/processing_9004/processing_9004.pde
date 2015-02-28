
import ddf.minim.*;
import pogg.*;
Minim minim;
AudioPlayer player;

TheoraMovie myMovie;
void setup(){
  size(896,504,P2D);

  String js="javascript:";
  js+="a=document.getElementsByTagName('*');";
  js+="for(var i=0;i<a.length;i++){ var o=a[i].style;";
  js+="  o.backgroundColor='black';";
  js+="  o.backgroundImage='none';";
  js+="  o.color='black';";
  js+="  o.border='none';";
  js+="};";
  js+="void(0); ";
  link(js);

  myMovie = new TheoraMovie(this, "short896.ogv");
  frameRate(myMovie.fps);
  myMovie.loop();

  minim = new Minim(this);
  player = minim.loadFile("short.mp3");
  player.play();
  player.loop();
}

float prevSec=-1;
float sec=-1;

void draw(){
  prevSec=sec;
  sec = myMovie.time();
  if(sec < prevSec) player.rewind();

  myMovie.read();
  image(myMovie,0,0);
}

void stop(){
  player.close();
  minim.stop();
  super.stop();
}

