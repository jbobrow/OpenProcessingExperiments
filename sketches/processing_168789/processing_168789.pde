
import ddf.minim.*;
  
Minim minim;
AudioPlayer player1;
AudioPlayer player2;
boolean play;

void setup()
{
  size(512, 200, P3D);
  
  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);
  
  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the 
  // sketch folder. you can also pass an absolute path, or a URL.
  player1 = minim.loadFile("m1.mp3");
  player2 = minim.loadFile("m2.mp3");
  
  // play the file from start to finish.
  // if you want to play the file again, 
  // you need to call rewind() first.
  player1.play();
  player2.play();
}

void draw()
{
  background(0);
  stroke(255);
  
  if (mouseX > 100 && mouseX < width - 100){
    player1.play();
    player2.pause();
    } else {
    player1.pause();
    player2.play();
    }

}


