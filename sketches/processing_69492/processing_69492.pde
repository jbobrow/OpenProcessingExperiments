
// Norihioto Yuki
/*I made this animation inspired by a piano piece "Hibari" played by Ryuichi Sakamo. 
The repetition and subtle use of dissonance makes the song distinguished. And as analogy, I adopted pedulums that have different lengths.*/

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;

/* length of the strings */
int[] radius={686,660,636,612,590,570,550,530,512,496,480,464,450,436,422};

/*angles*/
float[] theta={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

/*center of the balls*/
float[] cx={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
float[] cy={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

float c = 0.05;// c is a variable to adjust the speed of the balls

float t = -1;
float g = 9.81; // gravitational accelaration 

void setup() {
  size(700, 700);
  smooth();
  background(255);
  
  minim = new Minim(this);
// this loads mysong.wav from the data folder
song = minim.loadFile("HibariPendulum.mp3");
song.play();
  
}

void draw() {
  if (keyPressed == false){
  translate(350, -200);  // Move the origin
  background(255);//reset
  t = t + 1;
 
 for(int i = 0; i < 15 ; i++){
   theta[i]= (PI/9)*cos(sqrt(g*c/radius[i])*t); 
   cx[i]=  radius[i]*sin(theta[i]);
   cy[i]=  radius[i]*cos(theta[i]);

   strokeWeight(2);
  stroke(220);
  line(0, 0, cx[i], cy[i]);
    fill(120 , random(255));
  ellipse(cx[i], cy[i], 30, 30);

 }
   
}

  else{
     };   
}

void stop()
{
song.close();
minim.stop();

super.stop();
}




