
/*INSTRUCTIONS: 
-The four keys to be pressed are "1, 2, 3, 4."
-Press 1 after hearing the first camera click.
-Press 2 after hearing the second camera click.
-Press 3 after hearing the third camera click.
-Press 4 after hearing the fourth camera click.
-When "That's a wrap!" is heard, the piece is finished.
*/


import ddf.minim.*;

Minim minim;
AudioPlayer audio;

PImage photo1;
PImage photo2;
PImage photo3;
PImage photo4;

void setup (){
  size (1280, 720);
  background (#766F76);
  minim = new Minim(this);
  audio = minim.loadFile("P3_Jaclyn_Lattanza.wav");
  audio.play();
  photo1 = loadImage("P3_Jaclyn_Lattanza_1.png");
  photo2 = loadImage("P3_Jaclyn_Lattanza_2.png");
  photo3 = loadImage("P3_Jaclyn_Lattanza_3.png");
  photo4 = loadImage("P3_Jaclyn_Lattanza_4.png");
}

void draw (){ 
 fill(0); 
 rect(0,0,1280,100);
 rect(0,620,1280,100);
 stroke(0);
 strokeWeight(5);
 line(293,30,293,720);
 line(640,30,640,720);
 line(950,30,950,720);
 if (key == '1') image(photo1,30,190);
 if (key == '2') image(photo2,320,190);
 if (key == '3') image(photo3,665,190);
 if (key == '4') image(photo4,975,190);    
}



