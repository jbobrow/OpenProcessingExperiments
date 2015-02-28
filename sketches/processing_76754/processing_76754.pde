
 import ddf.minim.*;
 PImage a;

AudioPlayer player;
AudioPlayer player1;
AudioPlayer player2;

Minim minim;

void setup(){
size(1200, 900);
a = loadImage("4.jpg");
minim = new Minim(this);

player=minim.loadFile("2.wav", 2048);

player1=minim.loadFile("33568__erh__grod-11-animal-5.wav", 2048);

player2=minim.loadFile("30988__unclesigmund__ahhh.wav", 2048);


}

void draw(){
  background(0);


}
void stop(){
  player.close();
  minim.stop();
  
  super.stop();
}


void mouseReleased(){
if(mouseX>=0 && mouseX<= 600) {
player.play();
}
if(mouseX>=600 && mouseX<= 1200) {
player1.play();
}
if(mouseX>=400 && mouseX<= 800 && mouseY>=450 && mouseY<=900) {
player2.play();
}
}

void mousePressed(){
loop();
}

