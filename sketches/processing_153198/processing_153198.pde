
// Konkuk University  


// Department of Dynamic Media  


// SOS iDesign  


// Name: SHIN seo i


// ID: pcwkdrn


  


import ddf.minim.*;  


Minim minim;  


AudioPlayer song;  


float x = 0;  


float y = 0;  


  





float xoff; 


void setup() {
  
   size (600, 600);  


  noStroke ();  


  minim = new Minim (this);  


  song = minim.loadFile("overdose.mp3");  
,

  song.play (); 


 }




  




  


void draw () {  


 // Size of the rect in relation to the volume of the audio file.  


  float dimension = song.mix.level() * 100;  


  


  


  background(0);  


  for (int a = 10; a<700; a = a+100) {  


  for (int b = 10; b<700; b = b+100) {  


  


  


  stroke(255);  


  strokeWeight(random(50));  


    fill(#834DE8);  


      ellipse(a, b, dimension, dimension); 


     


    } 


  } 


}  

