
/*On this project I wanted to use all that we have seen on the course, creating a mix of sound, figures and colors.
The user is capable of choose his own rythm for the figures to appear and the music helps to choose it as well.
*/

/*Intructions
Play the song by pressing the 'P' or 'p' (from play) key on your keyboard and stop it by pressing the 'S' or 's' (from stop) key.
You make the figures appear by moving the mouse on the screen.
*/
//color palettes
color[]palette={#FFFFFF,#552863,#A0DC43,#D50055,#297895,#00A695,#FF3300,#FF6600,#FFA600,#FFD900};
//general variables
int value = 0;

//audio file
import ddf.minim.*;
Minim minim;
AudioSample fract;

//background image
PImage planets;

//setup
void setup(){ 
size(1000,800);
planets=loadImage("planetas.jpg");
minim= new Minim(this);
fract= minim.loadSample("fract.mp3");
}

//draw
void draw(){
image(planets,0,0,1000,800);

}

//mouse functions
void mouseMoved() {

  value = value + 20;
  while(value>1000){value=0;}
   stroke(palette[int(random(10))]);
   strokeWeight(9);
   noFill();
   rect(random (700), random(500),random(300), random(300));
   ellipse(random(800),random(600),random (500), random(500));
}

//keyboard functions
 void keyPressed() {
   if (keyPressed==true) {
   if (key == 'p' || key=='P') fract.trigger(); 
   if (key == 's' || key=='S') fract.stop();
   if (key == 's' || key=='S') println("You stoped the music");
if (key== 'p' || key=='P') println("You triggered the music");
}
 }



