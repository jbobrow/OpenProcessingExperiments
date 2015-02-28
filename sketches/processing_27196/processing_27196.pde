
//Ben Marriott Processing Assignment 2011
//virtual piano keyboard - Snythesia

import arb.soundcipher.*; // opens the library 'sound cipher'

SoundCipher sc = new SoundCipher(this);

int fade0 = 100;
int x = 0;

void setup()

{
 size (600,600);
 //background (170,170,170); //grey
 background (255);
  
}



void keyPressed() //created virtual keyboard

{

  //Keys
   if (key == 'a' ) {        //if you press the key 'A'
        sc.playNote(60+x, 200, 0.5);  //Middle C will play
      
        noStroke ();
        fill (217, 150, 131, fade0);
        ellipse(width/2, height/2, 255, 255);
        fill (217, 150, 131, fade0-50);
        ellipse(width/2, height/2, 355, 355);
       
        
    }  
   if (key == 'w' ) {
        sc.playNote(61+x, 200, 0.5); //C#
        noStroke ();
        fill (210, 186, 127, fade0);
        ellipse(width/2, height/2, 255, 255);
         fill (210, 186, 127, fade0-50);
        ellipse(width/2, height/2, 355, 355);
        
    }
   if (key == 's' ) {
        sc.playNote(62+x, 200, 0.5);//D
        noStroke ();
        fill (191, 209, 126, fade0);
        ellipse(width/2, height/2, 255, 255);
         fill (191, 209, 126, fade0-50);
        ellipse(width/2, height/2, 355, 355);
    }
   if (key == 'e' ) {
        sc.playNote(63+x, 200, 0.5);//D#
        noStroke ();
        fill (149, 210, 126, fade0);
        ellipse(width/2, height/2, 255, 255);
         fill (149, 210, 126, fade0-50);
        ellipse(width/2, height/2, 355, 355);
    }
   if (key == 'd' ) {
        sc.playNote(64+x, 200, 0.5);//E
        noStroke ();
        fill (128, 212, 145, fade0);
        ellipse(width/2, height/2, 255, 255);
         fill (128, 212, 145, fade0-50);
        ellipse(width/2, height/2, 355, 355);
    }
   if (key == 'f' ) {
        sc.playNote(65+x, 200, 0.5);//F
        noStroke ();
        fill (125, 209, 108, fade0);
        ellipse(width/2, height/2, 255, 255);
         fill (125, 209, 108, fade0-50);
        ellipse(width/2, height/2, 355, 355);
    }  
   if (key == 't' ) {
        sc.playNote(66+x, 200, 0.5);//F#
        noStroke ();
        fill (126, 190, 211, fade0);
        ellipse(width/2, height/2, 255, 255);
         fill (126, 190, 211, fade0-50);
        ellipse(width/2, height/2, 355, 355);
    }
   if (key == 'g' ) {
        sc.playNote(67+x, 200, 0.5);//G
        noStroke ();
        fill (128, 151, 212, fade0);
        ellipse(width/2, height/2, 255, 255);
         fill (128, 151, 212, fade0-50);
        ellipse(width/2, height/2, 355, 355);
    }
   if (key == 'y' ) {
        sc.playNote(68+x, 200, 0.5);//G#
        noStroke ();
        fill (149, 126, 212, fade0);
        ellipse(width/2, height/2, 255, 255);
         fill (149, 126, 212, fade0-50);
        ellipse(width/2, height/2, 355, 355);
    }
   if (key == 'h' ) {
        sc.playNote(69+x, 200, 0.5);//A
        noStroke ();
        fill (191, 127, 212, fade0);
        ellipse(width/2, height/2, 255, 255);
         fill (191, 127, 212, fade0-50);
        ellipse(width/2, height/2, 355, 355);
    }
   if (key == 'u' ) {
        sc.playNote(70+x, 200, 0.5);//A#
        noStroke ();
        fill (210, 126, 191, fade0);
        ellipse(width/2, height/2, 255, 255);
         fill (210, 126, 191, fade0-50);
        ellipse(width/2, height/2, 355, 355);
    }  
   if (key == 'j' ) {
        sc.playNote(71+x, 200, 0.5);//B
        noStroke ();
        fill (210, 125, 147, fade0);
        ellipse(width/2, height/2, 255, 255);
         fill (210, 125, 147, fade0-50);
        ellipse(width/2, height/2, 355, 355);
    }
   if (key == 'k' ) {
        sc.playNote(72+x, 200, 0.5);//C 5
        noStroke ();
        fill (217, 150, 131, fade0);
        ellipse(width/2, height/2, 255, 255);
         fill (217, 150, 131, fade0-50);
        ellipse(width/2, height/2, 355, 355);
    }
   if (key == 'o' ) {
        sc.playNote(73+x, 200, 0.5);//C#
        noStroke ();
        fill (210, 186, 127, fade0);
        ellipse(width/2, height/2, 255, 255);
         fill (210, 186, 127, fade0-50);
        ellipse(width/2, height/2, 355, 355);
    }
   if (key == 'l' ) {
        sc.playNote(74+x, 200, 0.5);//D
        noStroke ();
        fill (191, 209, 126, fade0);
        ellipse(width/2, height/2, 255, 255);
         fill (191, 209, 126, fade0-50);
        ellipse(width/2, height/2, 355, 355);
    }
   if (key == 'p' ) {
        sc.playNote(75+x, 200, 0.5);//D#
        noStroke ();
        fill (149, 210, 126, fade0);
        ellipse(width/2, height/2, 255, 255);
         fill (149, 210, 1267, fade0-50);
        ellipse(width/2, height/2, 355, 355);
    }
   if (key == ';' ) {
        sc.playNote(76+x, 200, 0.5);//E
        noStroke ();
        fill (128, 212, 145, fade0);
        ellipse(width/2, height/2, 255, 255);
         fill (128, 212, 145, fade0-50);
        ellipse(width/2, height/2, 355, 355);
    }
   if (key == 'z' ) {
        sc.playNote(77+x, 200, 0.5);//F
        noStroke ();
        fill (125, 209, 108, fade0);
        ellipse(width/2, height/2, 255, 255);
         fill (125, 209, 108, fade0-50);
        ellipse(width/2, height/2, 355, 355);
    }
  
  
  //Chords in the C major scale
   if (key == '1' ) {        //if you press the key '1'
       float[] pitches = {72, 64, 67,};  // plays the notes C, E & G
       sc.playChord(pitches, 80, 4);  //C major chord will play   I
   }
    if (key == '2' ) {       
       float[] pitches = {65, 69, 74,};  
       sc.playChord(pitches, 80, 4);  // D Minor   ii
   }
     if (key == '3' ) {       
       float[] pitches = {71, 67, 76,};  
       sc.playChord(pitches, 80, 4);  // E Minor   iii
   }
   if (key == '4' ) {       
       float[] pitches = {65, 69, 72,};  
       sc.playChord(pitches, 80, 4);  // F Major   IV
   }
    if (key == '5' ) {       
       float[] pitches = {67, 71, 62,};  
       sc.playChord(pitches, 80, 4);  // G Major   V
   }
    if (key == '6' ) {       
       float[] pitches = {69, 72, 64,};  
       sc.playChord(pitches, 80, 4);  // A Minor   vi
   }
   if (key == '7' ) {       
       float[] pitches = {71, 74, 65,};  
       sc.playChord(pitches, 80, 4);  // B Augmented 4th vii
   }
   
   
    if (key == '0' ) {        //if you press the space bar
        
      
        noStroke ();
        fill (255);
        ellipse(width/2, height/2, 355, 355);
    }

        if (key == '9' ) {        //if you press 9 octave increases
        x = x+12;
      
        
    }

       if (key == '8' ) {        //if you press 9 octave Decreases
        x = x-12;
      
        
    }


}


void draw() {
  

  
}

