
//sketch, listen what is it? 

//images named in spanish , cerca(close), derecho(right), izquierdo(left), lejor(far).
PImage cerca;
PImage derecho;
PImage izquierdo;
PImage lejos;

//miau sounds.
import ddf.minim.*;
Minim minim;
AudioSample miau1; //stereo miau
AudioSample miau2; //right channel miau
AudioSample miau3; //left channel miau
AudioSample miau4; //reverb (far) miau


void setup (){
size (800, 600);

//images to load
cerca = loadImage("cerca.png");
derecho = loadImage("derecho.png");
izquierdo = loadImage("izquierdo.png");
lejos = loadImage("lejos.png");

//miau sounds to load
minim = new Minim(this);
  miau1 = minim.loadSample("miau1.wav");
  miau2 = minim.loadSample("miau2.wav");
  miau3 = minim.loadSample("miau3.wav");
  miau4 = minim.loadSample("miau4.wav");
}


void draw (){
  background (0);
  
  //instructions text
  PFont arial = loadFont ("arial.vlw");
  textFont(arial);
textSize(48);
String hw = "listen";
text (hw, 200, 200);
String hw2 = "what is it?";
text (hw2, 300, 300);
String hw3 = "press, a, b, c, d";
text (hw3, 200, 400);
}
   


void keyPressed(){
  
  //conditions to load miau sounds
   if (key == 'a'|| key == 'A') miau1.trigger();
   if (key == 'b'|| key == 'B') miau3.trigger();
   if (key == 'c'|| key == 'C') miau2.trigger();
   if (key == 'd'|| key == 'D') miau4.trigger();
     
}

void keyReleased () {
  
 ///conditions to load images
 if (key == 'a'|| key == 'A') image(cerca,0,0);
 if (key == 'b'|| key == 'B') image(derecho,0,0);
 if (key == 'c'|| key == 'C') image(izquierdo,0,0);
 if (key == 'd'|| key == 'D') image(lejos,0,0);
 
}

