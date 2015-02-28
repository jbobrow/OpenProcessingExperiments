
//Fun with food

PImage mauritius;
import ddf.minim.*;
Minim minim;
AudioSample seggae;
AudioSample seggae1;
AudioSample seggae2;
AudioSample seggae3;
AudioSample seggae4;
AudioSample seggae5;
AudioSample seggae6;

//First I chose the picture of a colourful market hall, from my holiday in Mauritius a few years ago. 
//In GIMP I've used some effects to make the photo a bit strange, you'll have to look twice before noticing all. 
//In Soundation I chose a few WAV files from the library, that made a beat, resembling the seggae music from Mauritius with lively market sounds.
//That file has been modified slightly in Audacity, and you can hear it as "seggae"; the six other files are the WAV files from Soundation.
void setup() {
 size(960, 720);
 mauritius = loadImage("project3.png"); 
 minim = new Minim(this);
 seggae = minim.loadSample("mixdown project3.wav"); 
 seggae1 = minim.loadSample("140bongossp21.mp3");
 seggae2 = minim.loadSample("100beatreggaeton.mp3");
 seggae3 = minim.loadSample("110bassreggaec.mp3");
 seggae4 = minim.loadSample("110drumsreggae.mp3");
 seggae5 = minim.loadSample("fxcafeschlossgartenosnabrueckcafe.mp3");
 seggae6 = minim.loadSample("fxflohmarktfleamarket.mp3"); 
 }

//As this piece is called "Fun with food", you should be able to play with it (code very losely based on Generative Gestaltung, P_4_0_01). 
//When your mouse is in the top left corner, you see the picture as it's supposed to be.
//Drag the mouse to another place on the canvas, and you'll see a lot of market halls, until it hurts your eyes.
void draw() {
  float tileCountX = mouseX/50+1;
  float tileCountY = mouseY/50+1;
  float stepX = width/tileCountX;
  float stepY = height/tileCountY;
  for (float gridY = 0; gridY < height; gridY += stepY){
    for (float gridX = 0; gridX < width; gridX += stepX){
      image(mauritius, gridX, gridY, stepX, stepY);
    }
  }
 }
 
//And of course you can save your picture, with a simple keyboard command.
void keyReleased() {
  if (key=='s' || key=='S') saveFrame("_##.png");
} 

//But just dragging the mouse would be boring, so here is the music.
//You can choose: by pressing the k on your keyboard, you'll hear the complete audio file. You can stop it with the b.
//When you want to create your own eclectic piece, just press the numbers 1-6, and make it the loudest market hall you've even seen!
void keyPressed() {
  if (key=='k' || key=='K') seggae.trigger();
  if (key =='b' || key=='B') seggae.stop();
  if (key=='1') seggae1.trigger();
  if (key=='2') seggae2.trigger();  
  if (key=='3') seggae3.trigger();
  if (key=='4') seggae4.trigger();
  if (key=='5') seggae5.trigger();  
  if (key=='6') seggae6.trigger();
}

//Have fun :)



