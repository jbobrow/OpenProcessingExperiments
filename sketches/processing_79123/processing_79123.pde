
//load minim libraries
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.effects.*;

//minim variables
Minim minim;
AudioOutput out;
SineWave sine1;
SineWave sine2;

//object variables
Histsound camsound;

// Import the video library
import processing.video.*;

// Declare a Capture object
Capture video;


void setup() {
  size(640,480);
  // Initialize Capture object via Constructor
  video = new Capture(this,640,480,12);
  //  Initialize minim
  minim = new Minim(this);
  //add sound stuff
  out = minim.getLineOut(Minim.STEREO, 9000);
//  sine1 = new SineWave(400, .5, 44100);
  sine2 = new SineWave(400, .5, 44110);
  sine2.portamento(200);
//  out.addSignal(sine1);
  out.addSignal(sine2);
}

void draw() {
  float[] hist = new float[256];
  float[] section = new float[13];
  // Check to see if a new frame is available
  if (video.available()) {
    //  Read the image from the camera.
    video.read();
  }
  //  display video
 image(video,0,0);
 //reindialize class everytime draw loop runs
 camsound = new Histsound();
 //operate on object
 camsound.brightSound();
 camsound.brightAmp();
 camsound.brightPan();
  
}

class Histsound {

  int[] hist = new int[256];
  int[] histR = new int[256];
  int[] histG = new int[256];
  int[] histB = new int[256];
  float[] section = new float[13];
  float[] sectionR = new float[13];
  float[] sectionG = new float[13];
  float[] sectionB = new float[13];
  int total = 256;
  int numNotes = 13;
  int perNote;
  int gIndex;
  
  Histsound() {
  // Calculate the histogram
  for (int i = 0; i < video.width; i+= 8) {
    for (int j = 0; j < video.height; j+= 8) {
      int bright = int(brightness(get(i, j)));
      hist[bright]++; 
    }
  }
  
//  for (int i = 0; i < video.width; i+= 5) {
//    for (int j = 0; j < video.height; j+= 5) {
//      int bright = int(red(get(i, j)));
//      histR[bright]++; 
//    }
//  }
//  for (int i = 0; i < video.width; i+= 5) {
//    for (int j = 0; j < video.height; j+= 5) {
//      int bright = int(green(get(i, j)));
//      histG[bright]++; 
//    }
//  }
//  for (int i = 0; i < video.width; i+= 5) {
//    for (int j = 0; j < video.height; j+= 5) {
//      int bright = int(blue(get(i, j)));
//      histB[bright]++; 
//    }
//  }


    // splits histogram up into 13 sections. 1 section corisponsidese to 1 note. fills section[] 
    //to find the greatest section, which is the played note. 
    int tot = 0;
    int perNote = total/numNotes;
    for(int i=0; i<numNotes; i++) {
     int start = i*perNote;
     for(int j=start; j<start+perNote; j++) {
      tot = tot + hist[j];
      section[i] = tot;
    }
  }
  }

//    for(int i=0; i<_numNotes; i++) {
//     int start = i*perNote;
//     for(int j=start; j<start+perNote; j++) {
//      tot = tot + histR[j];
//      sectionR[i] = tot;
//    }
//  }
//    for(int i=0; i<_numNotes; i++) {
//     int start = i*perNote;
//     for(int j=start; j<start+perNote; j++) {
//      tot = tot + histG[j];
//      sectionG[i] = tot;
//    }
//  }
//    for(int i=0; i<_numNotes; i++) {
//     int start = i*perNote;
//     for(int j=start; j<start+perNote; j++) {
//      tot = tot + histB[j];
//      sectionB[i] = tot;
//    }
//    }
  
  
  //sets the frequency of note
  void brightSound() {
    float[] noteFreq = new float[13];
    float MAX_section = MIN_INT;
    int index = 0;
    float percent;
  
    for(int i=0; i < section.length; i++) {
      if(section[i]>MAX_section) {
        MAX_section=section[i];
        index = i;
        gIndex = index;
      }
    }
    //http://en.wikipedia.org/wiki/Piano_key_frequencies
  int tot1 = 0;
  int tot2 = 0;
  int tot3 = 0;
  int tot4 = 0;
  int tot5 = 0;
  int tot6 = 0;
  int tot7 = 0;
  int tot8 = 0;
  int tot9 = 0;
  int tot10 = 0;
  int tot11 = 0;
  int tot12 = 0;
  int tot13 = 0;

    for (int j=0; j<21; j++) {
      tot1 = tot1 + hist[j];
      section[0]=tot1;
    }
    for (int j=21; j<42; j++) {
      tot2= tot2 + hist[j];
      section[1]=tot2;
    }
    for (int j=42; j<64; j++) {
      tot3= tot3 + hist[j];
      section[2]=tot3;
    }
    for (int j=64; j<85; j++) {
      tot4= tot4 + hist[j];
      section[3]=tot4;
    }
    for (int j=64; j<85; j++) {
      tot5= tot5 + hist[j];
      section[4]=tot5;
    }
    for (int j=85; j<106; j++) {
      tot6= tot6 + hist[j];
      section[5]=tot6;
    }
    for (int j=106; j<128; j++) {
      tot7= tot7 + hist[j];
      section[6]=tot7;
    }
    for (int j=128; j<149; j++) {
      tot8= tot8 + hist[j];
      section[7]=tot8;
    }  
    for (int j=149; j<170; j++) {
      tot9= tot9 + hist[j];
      section[8]=tot9;
    }  
    for (int j=170; j<192; j++) {
      tot10= tot10 + hist[j];
      section[9]=tot10;
    }  
    for (int j=192; j<213; j++) {
      tot11= tot11 + hist[j];
      section[10]=tot11;
    }  
    for (int j=192; j<213; j++) {
      tot12= tot12 + hist[j];
      section[11]=tot12;
    } 
  
//    for (int j=213; j<255; j++) {
//      tot13= tot13 + hist[j];
//      section[12]=tot13;
//    }  
    
    for(int i=0; i < section.length; i++) {
    if(section[i]>MAX_section) {
      MAX_section=section[i];
      index = i;
    }
  }
     if (index == 0) {
    sine2.setFreq(262);
  } else if (index == 1) {
     sine2.setFreq(277);
  } else if (index == 2) {
      sine2.setFreq(294);
  } else if (index == 3) {
      sine2.setFreq(311);
  } else if (index == 4) {
      sine2.setFreq(330);
  } else if (index == 5) {
      sine2.setFreq(349);
  } else if (index == 6) {
      sine2.setFreq(370);
  } else if (index == 7) {
      sine2.setFreq(392);
  } else if (index == 8) {
      sine2.setFreq(415);
  } else if (index == 9) {
      sine2.setFreq(440);
  } else if (index == 10) {
      sine2.setFreq(446);
  } else if (index == 11) {
        sine2.setFreq(494);}
   else if (index == 12) {
      sine2.setFreq(523);
  }
  println(index);

  }
  //sets amp according to percentage of the MAX section to all pixels
  void brightAmp() {
   float percent;
   percent = section[gIndex]/4800;
   sine2.setAmp(percent);
  }
  
  //sets pan to MAX index of hist[]
  void brightPan() {
    float MAX_hist = MIN_INT;
    float index = 0;
    for(int i=0; i < hist.length; i++) {
      if(hist[i]>MAX_hist) {
        MAX_hist=hist[i];
        index = i;
      }
    }
  
  float pan = map(index,0,255,-1,1);
  sine2.setPan(pan);
  }


}


