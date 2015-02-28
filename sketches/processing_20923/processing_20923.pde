
/*

Carolyn Schuetz
Art 479 Algorithmic VCD
Final Project Schedule
Due: 2/15/11

Tues  2/15/11  Have familiarity with audio library
Thur  2/17/11  Practice using audio library with mp3s
               Try different forms of exporting
Tues  2/22/11  Have a system for gathering information about audio
               Decide characteristics to be represented
               Decide how to visual characteristics
Thur  2/24/11  Pick diverse mp3s to show data
               Practice exporting mp3s and data
               Start to make hypothesises with visualizations and data
Tues  3/01/11  After looking through visuals critique design aesthetic
               Tweak programming to reflect critique
Thur  3/03/11  Have audio files selected, rendered and reviewed
Tues  3/08/11  Make any final changes to visualizations
Thur  3/10/11  Have several poster options for personal critique
Tues  3/15/11  FINAL PROJECT TURN IN

*/



/*

Carolyn Schuetz
Art 479 Algorithmic VCD
Final Project Pseudocode
Due: 2/15/11

Song song;

main class {
  import beads.*;
  
  void setup() {
    new canvas that is 200x200
    song = new Song(audiofile.mp3);    
  }
  
  void draw() {
    for(float i = 0; until i > song.length; i+= .01){
      song.display((millis(i));
  }
}

class Song {
  import beads.*
  String audioFile;
  SamplePlayer player;
  millis time;

  Song(String tempAudioFile) {
    audioFile = tempAudioFile;
    player = new SamplePlayer(other arguments including audioFile);
  }
    
  void display(millis tempTime) {
    time = tempTime;
    use methods within SamplePlayer class to visualize aspect A of audio at time
      print out 5x5 .png of image
    use methods within SamplePlayer class to visualize aspect B of audio at time
      print out 5x5 .png of image
    use methods within SamplePlayer class to visualize aspect C of audio at time
      print out 5x5 .png of image
  }
}
