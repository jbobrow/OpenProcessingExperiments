
import ddf.minim.*;

//Just a class for each track
class Track {
  String track_name;
  AudioPlayer player;

  PImage fractal;
  boolean isOn =false;
  public Track( Minim minim, String track_name) {
    this.track_name=track_name;
    this.player =  minim.loadFile(track_name);
  }

  //When I wan to play a sample
  public void play() {
    //run it like a loop
    this.player.loop();
    //synchronise with the rest of sound

    this.player.skip(song.position());
    println(song.position() +" : "+ this.player.position()+" "+track_name +"!");
  }

  //If isOn is true put it to false and pause  else put it to true and play
  public void switching() {

    this.isOn = !this.isOn;
    if (this.isOn) {
      play();
    } else {
      this.player.pause();
    }
  }
}


AudioPlayer song ;
AudioPlayer yeah ;

ArrayList<Track> tracks = new ArrayList();

Track breath_Ka ;
Track keyBass ;
Track pad ;
Track percu ;

void setup()
{

  //Initialisation !
  size(800, 600);


  Minim minim = new Minim(this);
  //song is a silence song on ly for synchrnonisation of other tracks
  song = minim.loadFile("Silence.wav");

  // Init track
  pad =new Track(minim, "Pad.wav");
  breath_Ka =new Track(minim, "Breath_Ka.wav");
  keyBass =new Track(minim, "KeyBass.wav");
  percu =new Track(minim, "Percu.wav");

  // Surprise ! Yeah!!
  yeah = minim.loadFile("Yeah.wav");

  //Add al in a list for xhen I want to pause/play everybody
  tracks.add(breath_Ka);
  tracks.add(keyBass);
  tracks.add(pad);
  tracks.add(percu);




  song.play();
  pad.switching();

  song.loop();
}





void keyPressed() {

  //If  space 
  if (key ==' ') {
    //And song is playing  make pause 
    if (song.isPlaying() ) {
      song.pause();
      println("PAUSE");
      for (int i = 0; i < tracks.size (); i++) {
        tracks.get(i).player.pause();
      }
    } else {
      //else play au track which are ON
      println("PLAY");
      song.rewind();
      song.loop();
      for (int i = 0; i < tracks.size (); i++) {
        Track t = tracks.get(i);
        if (t.isOn) {
          t.play();
        }
      }
    }
  } else if (key =='s'|| key =='S') {
    pad.switching();
  } else if (key =='d' || key =='D') {
    breath_Ka.switching();
  } else if (key =='f'|| key =='F') {
    keyBass.switching();
  } else if (key =='g'|| key =='G') {
    percu.switching();
  } else if (key=='@') {
    println("yeah !");
    yeah.rewind();
    yeah.play();
  }
}

//Just put a text fo a track with color option
void trackText(String text, int x, int y, Track t) {

  //If track is on = red

  if (t.isOn) {
    fill(245, 12, 12);
    text(text, x, y);
  } else {
    //If track is white

      fill(255, 255, 255);

    text(text, x, y);
  }
}

void draw()
{
  //println(song.position());

  background(0);
  image(loadImage("Background.jpg"), 0, 0);
  textSize(25);

  //use trackText to choose wich color is the good one
  trackText("S", 650, 300, pad); 
  trackText("D", 650, 350, breath_Ka); 
  trackText("F", 650, 400, keyBass); 
  trackText("G", 650, 450, percu); 


  stroke(#FFD000);
  // draw the waveform 
  for (int i = 0; i < song.bufferSize () - 1; i++)
  {

    //Initiaisation
    float left =yeah.left.get(i);
    ;
    float left_n =yeah.left.get(i+1);

    float right =yeah.right.get(i);
    float right_n =yeah.right.get(i);

    //Make a sum of data of each sample
    for (int j = 0; j < tracks.size (); j++) {
      Track t = tracks.get(j);

      left=left+ t.player.left.get(i);
      left_n=left_n + t.player.left.get(i+1);

      right=right+  t.player.right.get(i);
      right_n =right_n+  t.player.right.get(i+1);
    }    

    //Make lines
    line(i+7, 50 + left*500, i+1, 50 + left_n*500);
    line(i+7, 150 + right*500, i+1, 150 + right_n*500);
  }
}


