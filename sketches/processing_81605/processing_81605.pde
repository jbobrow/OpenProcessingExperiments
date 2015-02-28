
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/47667*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
import ddf.minim.*;//declare
PImage img;
int angle = 46;
int count = 0;
float rotateDeg = 0;
AudioPlayer player;
Minim minim;
 
void setup(){
  img=loadImage("record.png");
  size(640,480,P2D);
  minim=new Minim(this);
 player=minim.loadFile("aruarian.mp3");//locate file

}
 
void draw(){
  smooth();
  noStroke();
    image(img,0,0);
   if (mousePressed==true){// click to play music
  player.play();
  
  
  //red circle spin
  for (int m=1; m<8; m++) {
    redWindmill (m);
  }


  translate(width/2, height/2);  

  //SPIN text
  if (mousePressed == true) {
    for (int count=1; count<12; count++) {
      fill(0, 0, 0, 100);
      rotate (radians(36+rotateDeg));
      
    }
  }
  else {
    pushStyle();
    fill(0);
        popStyle();
  }

  //spinning triangle
  for (int q=1; q<10; q++) {
    spinTri (q);
  }

  //EVERYTHING THAT ROTATES COMES AFTER THIS



  //spinning rectangle
  rectMode(CENTER);
  rotate(rotateDeg);
  noStroke();
  fill (0, 0, 0, 25);
  rect(0, 0, 350, 350);
  rotateDeg+=0.07;

}

   }  


void keyPressed()
{
  //mutes music
  if (key == 'm')
    {  
      player.mute();
         }

 if (key == 'u')
    {  
      player.unmute();
         }
}
//END DRAW LOOP


//red windmill function
void redWindmill (int m) {
  fill(200, 0, 0, 30);
  arc(width/2, height/2, 300, 300, map(mouseY, 300, 400, 0, radians(360/m)), map(mouseY, 400, 700, radians(360/m), 0));
}


//spinning triangles
void spinTri (int q) {
  fill (0, 0, 0);
  rotate (radians(45));
  triangle (200, 0, 300, 25, 250, 50);
}




