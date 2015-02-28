
//import ddf.minim.spi.*;
//import ddf.minim.signals.*;
import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.ugens.*;
//import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;
AudioPlayer [] noises= new AudioPlayer[12];
//String [] noises;
//


Words[] texts= new Words[12];
String [] data = {
  "I am fleeting", 
  "emotion", 
  "slip through your", 
  "fingers", 
  "spend days chasing", 
  "breath", 
  "kite with snipped string", 
  "paper blowing in the wind", 
  "feather in a Hurricane", 
  "pebble in a typhoon", 
  "pitch black sandstorm", 
  "I fall through endless hands", 
  "I escape from your eyes", 
  "A spark in a forest fire"
};
int [] x = {
  40, 200, 150, 400, 30, 400, 140, 60, 50, 70, 80, 100
};
int [] y = {
  40, 200, 350, 400, 675, 100, 300, 410, 650, 600, 500, 700
};
int index = int(random(12));


void setup() {
  size(800, 800);
  fill(150);

  minim = new Minim(this);
player=minim.loadFile("poem copy.mp3");
player.play();
  noises[0]=minim.loadFile("123 copy.wav");
  noises[1]=minim.loadFile("guitar copy.wav");
  noises[2]=minim.loadFile("gypsyhit copy.wav");
  noises[3]=minim.loadFile("tfade copy.wav");
  noises[4]=minim.loadFile("jh2 copy.wav");
  noises[5]=minim.loadFile("kickhat copy.wav");
  noises[6]=minim.loadFile("coltrane copy.wav");
 noises[7]=minim.loadFile("drumroller copy.wav");
 noises[8]=minim.loadFile("nicosample copy.wav");
 noises[9]=minim.loadFile("blakeyhit copy.wav");
 noises[10]=minim.loadFile("osmutantesvox copy.wav");

//
//player = minim.loadFile("123.wav"); 

  for (int i=0; i<12; i++) {
    texts[i]=new Words(data[i], x[i], y[i]);
  }
}

void draw() {
  //display String text
  //  player.play();
  background(255);
  texts[index].display();
  textSize(random(14, 100));
  frameRate(1);
}
class Words {
  String t;
  float x;
  float y;
  //Constructor
  Words(String thestring, float xLoc, float yLoc) {
    t=thestring;
    x = xLoc;
    y = yLoc;
  }
  void display() {
    fill(0);

    text(t, x, y);
  }
}

void mousePressed() {
  fill(200, 0, 0);
  index++;
  if (noises[index]!=null)
    noises[index].play();

  //test
  if (index==12) {
    fill(10, 5, 200);
    textSize(60);
    text("KEEP PRESSING", 10, 600);
    fill(1, 200, 10);
    text("CLICK", 200, 500);
  }
}
void mouseReleased() {
  index=int(random(12));
  text("HOLD ON", 300, 50);
  fill(0);
}
void stop()
{

  player.close();

  minim.stop();
}



