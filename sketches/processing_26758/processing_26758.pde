
/*********************************************************************************************
tonality
(NomBot)
This sketch generates random "music" based on pitch classes, and displays the generated tones.
The x-axis represents midi pitch, and the y-axis represents the cumulative hits on each pitch. 
The color of each dot represents its place within the 12-tone pitch class, red equaling C etc.
Uses souncipher library.
*/
import arb.soundcipher.*;

SoundCipher sc = new SoundCipher(this);

float pitch = 60;
float played = 0;
float vel = 100;
int tosh = 1;
int[] dup = new int[128];

void setup() {

// make color dodecaphonic ;)  
  colorMode(HSB, 12);
// tempo  
  frameRate(6);
// allow for 128 tones  
  size(1280,640);
// on black  
  background(0);
  smooth();
// pick instrument
  sc.instrument(sc.PIANO);  
 
}


void draw() {


if (tosh>0){
// fade last note  
  fill(played%12, 12, 4);
  ellipse(played * 10,  dup[(int)played] * 10 , 8, 10);
// show new note   
  fill(pitch%12, 12, 12);
  ellipse(pitch * 10,  dup[(int)pitch] * 10 + 10, 8, 10);
// remember hit  
  dup[(int)pitch]++;
// play new note  
  sc.playNote(pitch, vel, 1);
}

// what to play next
  tosh = (int)random(7);
// more memorization 
if (tosh>0){played=pitch;}
// play a new note
  switch(tosh) {
  case 0: 
    // rest
    break;
  case 1: 
    pitch = sc.pcRandomWalk(pitch, 7, sc.MINOR_PENTATONIC);
    vel=100;
    break;
  case 2: 
    pitch = sc.pcRandomWalk(pitch, 7, sc.MINOR_TRIAD);
    vel=120;
    break;    
  case 3: 
    pitch = sc.pcRandomWalk(pitch, 5, sc.MINOR);
    vel=110;
    break; 
  case 4: 
    pitch = sc.pcRandomWalk(pitch, 3, sc.CHROMATIC);
    vel=70;
    break;    
  case 5: 
    pitch = sc.pcRandomWalk(pitch, 7, sc.MINOR);
    vel=80;
    break;          
  default:
    // repeats same pitch & vel
    break;
}
//  88 key piano restraint
if (tosh>0){ 
if(pitch < 21) {  
    pitch += 3;
  }
if(pitch > 108) {  
    pitch -= 3;
  }
}
}

