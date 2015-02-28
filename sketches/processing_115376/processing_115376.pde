
PImage a;

import ddf.minim.*;

Minim minim;
AudioPlayer player1;


void setup () {
size (400,600);

minim = new Minim(this);
a = loadImage ("merlin2.jpg");
player1 = minim.loadFile ("dog.wav");



}


void draw(){
  
image(a,0,0,width,height);
if(mousePressed==true){
        player1.play();
}

}



