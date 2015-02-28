
import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioInput input;

int counter = 0;
ArrayList<String> arr;
void setup() {  //setup function called initially, only once
  size(400, 400);
  minim = new Minim(this);
  player = minim.loadFile("a.wav");
  //input = minim.getLineIn();
    //if (frame != null) {
    //frame.setResizable(true);
    //}
}

void draw() {  //draw function loops 
  arr = new ArrayList<String>();
  arr.add("Happy Birthday Stan, Prece Space to Continyu");
  arr.add("A surprise is waiting for you.");
  arr.add("A song that occurs everytime.");
  arr.add("And also, there is...");
  arr.add("some special code that you can find");
  arr.add("at the bottom of all of this");
  arr.add("Hopefully the colors didn't kill you.");
  arr.add("Well, that is all I had to say.");
  arr.add("Oh yeah, that suprise I said earlier.");
  arr.add("It was a lack of any real surprise.");
  arr.add("Anyway, Happy Birthday, have a good one.");
  
  background(random(255),random(255),random(255));
  fill(random(255),random(255),random(255));
  textSize(16);
  textAlign(CENTER);
  text(arr.get(counter),width / 2,height / 2);
}

void keyPressed() {
  if (keyCode == 32) {
      if (counter < arr.size() - 1) {
        counter++; 
        player.play();
      }
  }
}

void stop()
{
// the AudioPlayer you got from Minim.loadFile()
player.close();
// the AudioInput you got from Minim.getLineIn()
input.close();
minim.stop();

// this calls the stop method that
// you are overriding by defining your own
// it must be called so that your application
// can do all the cleanup it would normally do
super.stop();
}


