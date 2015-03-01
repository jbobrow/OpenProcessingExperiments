
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
import ddf.minim.spi.*;

//FinalProject Nicole
//Learn 5 words in Hebrew
//prees key 1-5 To hear the word in Hebrew
Minim minim;
AudioSample toda;
AudioSample shalom;
AudioSample ahava;
AudioSample betsefer;
AudioSample luaah;
AudioPlayer song;

//LoadingIMages

PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6; //word_glitter

//setup()
void setup() 
{
  size(900,900);
  // working with text();
textSize(16);
textAlign(CENTER);
text("Learn Hebrew  Press 1,2,3,4,5 to hear the words!", 450, 20);
  colorMode(HSB, width, height, 100);
  

  img = loadImage("bg_5words.jpg");
  img1 = loadImage("shalom.gif");
  img2 = loadImage("ahava.gif");
  img3 = loadImage("betsefer.gif");
  img4 = loadImage("luaah.gif");
  img5 = loadImage("toda.gif");
  img6 = loadImage("word.gif");
  

  

  //Play Audio
   minim = new Minim(this); 
  song = minim.loadFile("song.wav");
  song.play();
  
   //shalom
  minim = new Minim (this);
  shalom = minim.loadSample("shalom.wav");
  
  //ahava
  minim = new Minim (this);
  ahava = minim.loadSample("ahava.wav");
  
  //betsefer
  minim = new Minim (this);
  betsefer = minim.loadSample("betsefer.wav");
  
  //luaah
  minim = new Minim (this);
  luaah = minim.loadSample("luaah.wav");
   
 //toda
  minim = new Minim (this);
  toda = minim.loadSample("toda.wav");
   
}


void draw() {
  image(img, 50, 25);
  image(img1, 100, 600);
  image(img2, 220, 600);
  image(img3, 400, 600);
  image(img4, 570, 600);
  image(img5, 670, 600);
  
}

void keyPressed () {
  //Words Trigger
  
  //Shalom
  if (key == '1') shalom.trigger();
   if (key == '1') image(img6, 100, 600);
  if (key == '1') println("shalom");
  
  //Ahava
  if (key == '2') ahava.trigger();
   if (key == '2') image(img6, 220, 600);
  if (key == '2') println("ahava");
  
  //Bet Sefer
  if (key == '3') betsefer.trigger();
   if (key == '3') image(img6, 400, 600);
  if (key == '3') println("betsefer");
  
  //Luaah
  if (key == '4') luaah.trigger();
  if (key == '4') image(img6, 570, 600);
  if (key == '4') println("luaah");
  
  //TODA
  if (key == '5') toda.trigger();
  if (key == '5')  image(img6, 670, 600);
  if (key == '5') println("toda");
 

}

  

void keyReleased() {
  switch(key) {
  case 'a':
    background(#F0A79E);
    break;
   case 'b':
    background(#F04B9E);
    break;
   case 'c':
    background(#604B9E);
    break;
   case 'd':
    background(#134B9E);
    break;
   case 'e':
    background(#554BAB);
    break;
      case 'f':
    background(#F0A79E);
    break;
   case 'g':
    background(#F04B9E);
    break;
   case 'h':
    background(#604B9E);
    break;
   case 'i':
    background(#134B9E);
    break;
   case 'k':
    background(#554BAB);
    break;
     case '6':
    background(#F04B9E);
    break;
   case '7':
    background(#604B9E);
    break;
   case '8':
    background(#134B9E);
    break;
   case '9':
    background(#554BAB);
    break;
    case 'q':
    background(#554BAB);
    break;
      case 'w':
    background(#554BAB);
    break;
     case 'z':
    background(#F04B9E);
    break;
  }
}



 

