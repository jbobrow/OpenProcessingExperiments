
//Konkuk university
//Dynamic Media
//JANG Jinseon
//201420105

import ddf.minim.*;

Minim minim;
AudioPlayer song;
float x = 0;
float y = 0;

void setup () {
size (600, 600);
noStroke ();

minim = new Minim (this);
song = minim.loadFile("08 Sunday Morning.mp3");
song.play ();
}

void draw () {

   background(0);
 float d= song.mix.level() *250;
    for (int a = 10; a< width; a = a+40) {  
     for (int b = 10; b< width; b = b+40) {  
    
      pushMatrix(); 
     stroke(#404FFF);  
      strokeWeight(9);  
      fill(20);  
      rect(a-0.4, b-0.4, d, d);  

     stroke(#388FFF);  
      strokeWeight(10);
      fill(#FF045F);  
      rect(a-0.2, b-0.2, d, d);  
      popMatrix();
    }
  }    
}

