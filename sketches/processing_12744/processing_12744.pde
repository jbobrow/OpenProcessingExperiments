
import rita.*;
import ddf.minim.*;

/*
 * @desc Creates a haiku using a clever grammar.
 */

RiText[] rts;
RiGrammar grammar;
  PImage b;
  Minim minim;
AudioPlayer in;

void setup()
{
  frameRate(0.5); 
  size(1024,768);
  rts = new RiText[8];
  RiText.setDefaultAlignment(LEFT);
  RiText.setDefaultFont("AppleBraille-32.vlw");
  for (int i = 0; i < 8; i ++)
  {
      rts[i] = new RiText(this, 70, 150 + i*45);
  }
  grammar = new RiGrammar(this, "grammar.g");
  
  b = loadImage("beach.jpg");
  minim = new Minim(this);
  in = minim.loadFile("Spring.mp3");
  in.play();
  
  // grammar.openGrammarEditor(); // for dev
}


void draw()
{
  background(255);
    image(b, 0, 0);
  String result = grammar.expand();
  String[] lines = result.split("%");
  for (int i = 0; i < rts.length; i++) {
    rts[i].fadeToText(lines[i].trim(), 1.0f);
  }
}

void stop()
{

  in.close();
  // always stop your Minim object
  minim.stop();
  super.stop();
}


