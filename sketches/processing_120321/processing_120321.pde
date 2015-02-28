
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;
AudioInput input;

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
  40, 200, 150, 400, 400, 400, 140, 150, 50, 170, 180, 100
};
int [] y = {
  40, 200, 350, 400, 700, 100, 300, 410, 750, 600, 500, 700
};

String [][] poems;
//String [] h;
//String [] l;
//String [] z;
//String [] p;

int index = int(random(12));
//int xLoc = 200;
int indent=1;
//int yLoc= 200;


void setup() {
  size(800, 800);
  fill(0);
minim = new Minim(this);
player = minim.loadFile("123.wav");
input = minim.getLineIn();
player.play();

  //Load poem text files  
  poems = new String[4][];
  poems[0] = loadStrings("Ember Tidepoolstext.txt");
  poems[1]  = loadStrings("how to crack a safetext.txt");
  poems[2]  = loadStrings("prologuetext.txt");
  poems[3]  = loadStrings("fibonaccitext.txt");

  for (int i=0; i<12; i++) {
    texts[i]=new Words(data[i], x[i], y[i]);
  }
}

void draw() {
  //display String text
  background(255);
  texts[index].display();
  textSize(30);
  frameRate(1);
  //  if (yLoc > height+indent) {
  //    yLoc = 30;
  //    xLoc=0;
  //    background(0);
  //  }
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
    //    stroke(255);
    fill(0);
    text(t, x, y);
    //    text(t, width/2, height/2);
  }
}

void mousePressed() {
  //When mouse is pressed, data words change to next sentence and loaded text pops up
  if (frameCount % 8 == 2) {
    //    yLoc+=30;
    //    xLoc+=10;
    text(
    poems[0] [(int) random(poems[0].length)] + 
      " " +
      poems[1] [(int) random(poems[1].length)] + 
      " " +
      poems[2] [(int) random(poems[2].length)] +
      " " +
      poems[3] [(int) random(poems[3].length)], 
    width/2, height/2);
  }
  index=int(random(12));
  fill(200, 0, 0);
  index++;

  //test
  //When sentences 0 and 5 from index are clicked flash words HELP and CLICK and grow text to size 200
  if (index==12) {
    index=0;
    index=5;
    index=10;
    fill(10, 5, 200);
    textSize(60);
    text("HELP HELP HELP HELP HELP", 10, 700);
    fill(1, 200, 10);
    text("CLICK", 200, 500);
  }
}
void mouseReleased() {
  index=int(random(12));
  text("HOLD ON", 600, 100);
  fill(0);
}



