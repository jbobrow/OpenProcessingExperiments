
/*
 Autor: Joan Soler-Adillon (www.joan.cat)
 Tutorial de Processing
 */
/*
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
*/

int posX, posY, velX, velY;
int sz = 20;
var audioElement = document.createElement("audio");
/*
Minim minim;//creem un objecte de so
AudioPlayer daSound;//creem un player
*/

void setup() {
  size(400, 300);
  posX = width/2;
  posY = height/2;
  velX = 4;
  velY = 4;
  /*
  minim = new Minim(this);//instanciem l'objecte de so
  daSound = minim.loadFile("poik.mp3");//carreguem l'mp3
  */
}

void draw() {
  background(0);

  //actualitzem posicions
  posX = posX+velX;
  posY = posY+velY;

  //dibuixem
  ellipse(posX, posY, sz, sz);

  //comprovem la posiciÃ³ X
  if ((posX<0)||(posX>width)) {
    velX = -velX;
/*    //posem el so de rebot a zero...
    daSound.cue(0);
    //i disparem el so de rebot
    daSound.play();
    */
  audioElement.setAttribute("src", "poik.mp3");
  audioElement.play();
  } 
  //comprovem la posiciÃ³ Y
  if ((posY<0)||(posY>height)) {
    velY = -velY;
/*    //posem el so de rebot a zero...
    daSound.cue(0);
    //i disparem el so de rebot
    daSound.play();
    */
  audioElement.setAttribute("src", "poik.mp3");
  audioElement.play();
  }
}
/*
//Tanquem les coses de so de java
void stop()
{
  // the AudioPlayer you got from Minim.loadFile()
  daSound.close();
  // the AudioInput you got from Minim.getLineIn()
  minim.stop();

  // this calls the stop method that
  // you are overriding by defining your own
  // it must be called so that your application
  // can do all the cleanup it would normally do
  super.stop();
}
*/


