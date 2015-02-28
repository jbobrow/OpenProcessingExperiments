
// funções do processing que comunicam com o computador
// e devolvem a hora, minutos e segundos
// agora vamos escalar
import ddf.minim.*;

Minim minim;
AudioSample player;
PFont myFont;
PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
void setup() {
  size(600, 600);
  minim = new Minim(this);

player = minim.loadSample("soundmagic.wav",2048);
  img = loadImage("nyan-cat.gif");
  img1 = loadImage("straberrnyan.png");
  img2 = loadImage("cookienyan.png");
  img3 = loadImage("bolonyan.png");
  img4 = loadImage("IMG_0955post.jpg");
  myFont = createFont("Arial-Black-48", 50, true);
  textFont(myFont, 30);
} 

void draw() {
  

  background(55, 0, 58);
  image(img4,0,0);
  image(img,340, 200);
  fill(201,81,91);
  text("NyanScore",440, 70);
 
  

  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23

  int sM =  (int) map (s, 0, 59, 0, 400); // mapear os valores de 0,59, para o tamaho da largura da janela
  int mM =  (int) map (m, 0, 59, 0, 400);
  int hM =  (int) map (h, 0, 24, 0, 400);

  //float
  //println(h);  
  fill(201,81,91);
  text( h,  500-50, height/6);
  int hH = (int) map (hM, 0, width, 0, 360); // converter os segundos em Hue
  image(img3, hH, 370);
  //imagem

  //println(m);
  fill(201,81,91);
  text( m, 550-50, height/6);
  int mH = (int) map (mM, 0, width, 0, 360); // converter os segundos em Hue
  image(img2, mH, 350);
  //imagem

//  println(s);
  fill(201,81,91);
  text( s, 600-50, height/6);
  int sH = (int) map (sM, 0, width, 0, 360); // converter os segundos em Hue
  image(img1, sH, 330);
  //imagem
  
  if (s==59 || m==59 || h==23){
    player.trigger();
  }
}


