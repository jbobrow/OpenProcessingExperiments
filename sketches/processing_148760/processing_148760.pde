
import ddf.minim.*;

Minim minim;
AudioPlayer song;
float x = 0;
float y = 0;

void setup () {
size (600, 600);
noStroke ();

// Load an audio file into the player
minim = new Minim (this);
song = minim.loadFile("Don't Stop Movin'_S Club 7_Sunshine.mp3");
song.play ();
}

void draw () {
// Black semi-transparent background
   background(0);
 float d= song.mix.level() *250;
    for (int i = 0; i < 1024; i = i +110) {
    for (int j = 0; j < 768; j = j +110) {

      pushMatrix(); 
      rectMode(CENTER);
      fill(255);   
      rect(i, j, d+30, d+30);
      fill(#BFB5C7,500);
      noStroke();  
      rect(i, j, 50, 50);
   
      fill(#614A73,500);  
      rect(i-20, j-10, d, d);
       
      stroke(255);
      strokeWeight(2);
      fill(#BFB5C7,500);
      ellipse(i-50, j-3, 50, 50);
  
       
      noStroke();
      fill(#3A3763);
      ellipse(i-50, j-3, d, d);
  
      fill(255);
      ellipse(i, j+50, 50, 50);
       
      fill(0);
      ellipse(i, j+50, 30, 30);
       
      fill(255);
      ellipse(i, j+50, d, d);

      
      fill(#2F2C67);   
      rect(i, j, d, d);
      popMatrix();
    }
  }    
}
