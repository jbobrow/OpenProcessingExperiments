
// HUI Wang Chuen 53077809
// CMS3 Coding for Interactivity
// Assignment 4
// An interactive game for children traning visual and listening literacy.

//coding for reference :
//Examples in the week 4 lecture notes, especially the MINIM LIBRARY part
//http://processing.org/reference/mouseClicked_.html
//http://processing.org/reference/rect_.html
//http://www.learningprocessing.com/examples/chapter-5/example-5-3/

//audio credits:
//the 8 audio files I used are all from :
//http://www.daimi.au.dk/~jones/dsp/sounds/singlenote/Piano.ff.F3.wav
//http://cd.textfiles.com/mmplus/MEDIA/WAV/EFFECTS/BP_JZZPN.WAV
//http://appsrv.cse.cuhk.edu.hk/~wmszeto/dafx05/DU1-M3-72-V70_79-V70-1-est.wav
//http://www.eborg2.com/Sounds/Sounds-Dark/PianoNote.wav
//http://appsrv.cse.cuhk.edu.hk/~wmszeto/cmmr05/DU1-M3-36-V70_43-V70-1-est1.wav
//http://nhttp://www.vibrationdata.com/Petrov_D.mp3
//http://appsrv.cse.cuhk.edu.hk/~wmszeto/dafx05/DU1-M3-60-V70_84-V70-1-res.wav
//http://appsrv.cse.cuhk.edu.hk/~wmszeto/dafx05/DU1-M3-72-V70_76-V70-1-org.wav



float colorR,colorG,colorB,alpha; // set RGB and alpha as floating value
import ddf.minim.*; // declare that audio is impotred
Minim minim;
AudioSample special1,special2,special3,special4,special5,special6,special7,special8,special9; // declare that those audio is inserted into the sketch



void setup (){
 size (400,400); // the size of display window
 background (255); // color of background
 minim = new Minim (this) ; 
 special1 = minim.loadSample("Piano.mp3"); // declare following 
 special2 = minim.loadSample("BP_JZZPN.mp3");
 special3 = minim.loadSample("DU1_M3_60_V70_84_V70_1_res.mp3");
 special4 = minim.loadSample("DU1_M3_72_V70_76_V70_1_org.mp3");
 special5 = minim.loadSample("g_piano2.mp3");
 special6 = minim.loadSample("Petrov_D.mp3");
 special7 = minim.loadSample("piano (2).mp3");
 special8 = minim.loadSample("PianoNote.mp3");
 smooth (); // make the stroke smoother
 }


void draw (){
 colorR = random (255); // set value of random digits
 colorG = random (255); 
 colorB = random (255); 
 alpha = random (255); 
 stroke  (colorR,colorG,colorB,alpha); // random color of stroke
 strokeWeight (25); // the thickness of stroke
}

 
 void mouseMoved() 
 // if we changing one coordinate by moving mouse, the audio will play once only, however, we move faster, a series of sound as melody will commence.
 // if we put the mouseMoved part, the loop of audio will occur as it is not a separating order which under the control of void draw().
 // also, the color of rect will repeatedly updated even the mouse leave the window. Order will be looped according to the previous data as the newwst coordinate.

 {
   if (mouseX <50 && mouseY < 600)
 {special1.trigger ();
  rect (0,0,50,600); // in order to keep the entire file in the sketch and loop the muic when moving
  fill (0);
 }

  else if (mouseX <100 && mouseY < 600)
 {special2.trigger ();
  rect (50,0,50,600);
  fill (0);
 }



 else if  (mouseX <150 && mouseY < 600)
 {special3.trigger ();
  rect (100,0,50,600);
  fill (0);
 }


 else if  (mouseX <200 && mouseY < 600)
 {special4.trigger ();
  rect (150,0,50,600);
  fill (0);
 }

 else if  (mouseX <250 && mouseY < 600)
 {special5.trigger ();
  rect (200,0,50,600);
  fill (0);
 }


 else if  (mouseX <300 && mouseY < 600)
 {special6.trigger ();
  rect (250,0,50,600);
  fill (0);
 }


  else if  (mouseX <350 && mouseY < 600)
 {special7.trigger ();
  rect (300,0,50,600);
  fill (0);
 }


  else if  (mouseX <400 && mouseY < 600)
 {special8.trigger ();
  rect (350,0,50,600);
  fill (0);
 }

}



