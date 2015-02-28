
import arb.soundcipher.*;

SoundCipher sc = new SoundCipher(this);
SoundCipher sc2 = new SoundCipher(this);

SoundCipher sc3 = new SoundCipher(this);
float[] pitchSet = {57, 60, 60, 60, 62, 64, 67, 67, 69, 72, 72, 72, 74, 76, 79};
float setSize = pitchSet.length;
float keyRoot = 0;
float density = 0.8;
void setup() {
  size(400, 400);
  frameRate(5);
  sc.instrument(92);
  sc2.instrument(11);
  sc3.instrument(10);
}




void draw() {

    if (frameCount%24 == 0) {
    float[] pitches = {pitchSet[(int)random(setSize)]+keyRoot-12, pitchSet[(int)random(setSize)]+keyRoot-12};
    sc.playChord(pitches, random(40)+30, 8.0);
    background(random(255),255,random(255));
   }
  
  
  if (frameCount%8 == 0) {
    float[] pitches = {pitchSet[(int)random(setSize)]+keyRoot-12, pitchSet[(int)random(setSize)]+keyRoot-12};
    sc2.playChord(pitches, random(70)+30, 4.0);
    background(255, 255,random(255));

   }
  
if (frameCount%16 == 0) {
    float[] pitches = {pitchSet[(int)random(setSize)]+keyRoot-12, pitchSet[(int)random(setSize)]+keyRoot-12};
    sc3.playChord(pitches, random(70)+30, 8.0);
        background(random(255));
    background(255,random(255), 255);

   }


  
  if (frameCount%40 == 0) {
    
   if( minute() >= random(30)){
     sc.instrument(int(random(100)));
     print(sc.instrument);
   }
    if( minute() <= random(30)){
     sc2.instrument(int(random(100)));
          print(sc2.instrument);

     
   } if( second() == random(30)){
     sc.instrument(10);
     sc2.instrument(10);
     sc3.instrument(10);
   }
   
  }
  


}

