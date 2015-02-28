
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
PImage gritoImg;
AudioPlayer player;
Minim minim;
boolean b = false;
void setup() {
  gritoImg = loadImage("imagem1.jpg");
  println(gritoImg.width);
  println(gritoImg.height);
  size(407,518);
  minim = new Minim(this);
  player = minim.loadFile("aarrgghh.wav", 2048);
  textFont(loadFont("fonte.vlw"));
}

void draw() {
  background(0);
  //println(player.length());
  //b = false;
  //text(g[0],10,10,width-10,height-10);
  text("Eu estava andando por um caminho com dois amigos - o sol estava se pondo - de repente o céu ficou vermelho sangue - eu parei, sentindo-me exausto, e inclinei-me em cima do muro - havia sangue e línguas de fogo acima do fiorde azul-preto e da cidade - os meus amigos andando, e eu fiquei ali a tremer de ansiedade - e senti um grito infinito passando por natureza.", 25, 50, width-50, height);
  text("Edvard Munch, 1893", 225, 300);
  
  if (b == true) {
    image(gritoImg, 0, 0);
  }
 // println(player.isPlaying());
  if(player.isPlaying() == false){
    b = false;
    player.pause();
    player.skip(0);
  }
}

void mouseMoved() {
 player.play(0);
 b = true;
}

void mousePressed(){

}
void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  minim.stop();

  super.stop();
}


