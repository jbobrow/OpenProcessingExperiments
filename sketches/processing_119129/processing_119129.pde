
import ddf.minim.*;
PImage a;
PImage b;

Minim minim;
AudioPlayer player1;
AudioPlayer player2;

void setup () {
  size (380, 230);
  background (10);
  minim = new Minim(this);
  a = loadImage ("2.jpg");
  b = loadImage ("1.jpg");
  player1 = minim.loadFile ("Choppa.mp3");
  player2 = minim.loadFile ("2.mp3");
}

void draw(){
  image(a, 0, 0, a.width/2, a.height/2);
  image(b, 200, 0, b.width/2, b.height/2);
  
if(mousePressed == true){
  if(mouseX < width/2 && mouseY < height/2){
    player1.pause();
    player2.play();
  }
  
}
    
if(mousePressed == true){
  if(mouseX > width/2 && mouseY < height/2){
    player2.pause();
    player1.play();
    
  }
}

}


