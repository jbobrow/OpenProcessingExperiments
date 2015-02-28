
/**
 * Guitar Hero Complete
 * by Roman Usatin.
 *  
 * This sketch demonstrates how to use keys to play sounds. 
 * The song is "Silent Night" with an option to play "Twinkle Twinkle Little Star"
 * To edit this program effectivly, save new versions with v1,v2 at then end
 * Example: guitarHero_v1, guitarHero_v2
 * If you have any questions, please email me: roman@usatin.com
 */

import ddf.minim.*;

Minim minim;
HashMap pianoMap;

String sequence;
String toPlay;
int tracker = 0;
boolean songDone = false;
int score = 0;

void setup()
{
  size(1000, 150);
  minim = new Minim(this);
  pianoMap = new HashMap(); 
  
  // loading the piano and mapping it to the keyboard key
  pianoMap.put('a', minim.loadFile("a.mp3", 2048));
  pianoMap.put('b', minim.loadFile("b.mp3", 2048));
  pianoMap.put('c', minim.loadFile("c.mp3", 2048));
  pianoMap.put('d', minim.loadFile("d.mp3", 2048));
  pianoMap.put('e', minim.loadFile("e.mp3", 2048));
  pianoMap.put('f', minim.loadFile("f.mp3", 2048));
  pianoMap.put('g', minim.loadFile("g.mp3", 2048));
  
  sequence = "";
  
  // Silent night
  toPlay = "GAGEGAGEDDBCCGAACBAGAGEDDFDBCECGEGFDC".toLowerCase(); 
  // Twinkle Twinkle Star (also ABC song)
  //toPlay = "CCGGAAGFFEEDDCGGFFEEDGGFFEEDCCGGAAGFFEEDDC".toLowerCase(); 

  textFont(createFont("AgencyFB-Reg-48", 30));
}

void draw()
{
  background(0);
  
  fill(200,0,200);
  text("To Play: " + toPlay, 15, 30);
  text("Now Playing: " + sequence, 15, 70);
  
  fill(0,200,200);
  text("To Play: " + toPlay.substring(0, tracker), 15, 30); // progress of player
  text("Score: " + score, 15, 120); // progress of player
}

void keyPressed()
{
  if ( key >= 'a'  && key <= 'g') 
  {
    playKey((AudioPlayer)pianoMap.get(key));
  }
  
}

void playKey(AudioPlayer pianoKey)
{
  //checks if song is done
    if(tracker == toPlay.length())
      songDone = true;
      
      
    pianoKey.play();
    pianoKey.rewind();
    String keyPlayed = pianoKey.getMetaData().title();
    
    sequence += keyPlayed;
    
    if(!songDone)
    {
      checkIt(keyPlayed);
      tracker++;
    }
    
    
}

// This function checks the current key against the song and changes background

void checkIt(String played)
{
   if(toPlay.substring(tracker,tracker+1).equals(played))
     score++;    
   else
     score /= 2;  
     
}
  
void stop()
{
  // always close Minim audio classes when you finish with them
  minim.stop();
  
  super.stop();
}


