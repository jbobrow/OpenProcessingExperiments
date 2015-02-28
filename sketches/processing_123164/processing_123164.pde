
import rita.wordnet.*;
import java.util.*;

RiWordnet wordnet;
PFont font1, font2;
String word, hypos[];


float vSpacing ;

WordColor[] wColors ;

void setup() 
{
  size(600, 600);  
  noStroke();
  fill(255);
  rect(0, 0, 600, 600); 
  font1 = createFont("arial", 12);
  font2 = createFont("arial", 36);
  wordnet = new RiWordnet(this);
  frameRate(80);


  String val = "this is pong" ;  
  String[] vals = split(val, " ") ;

  wColors = new WordColor[vals.length] ;


  for (int i=0; i<vals.length; i++) {
    wColors[i] = new WordColor() ;
    wColors[i].word = vals[i];

    String[] senses = wordnet.getPos(wColors[i].word) ;

    for (int j=0; j<senses.length; j++) {
      println(senses[j]) ;

      if (senses[j].equals("n")) {
        // Do something
        wColors[i].b = wordnet.getDistance(wColors[i].word, "blue", "n");
        println(wColors[i].b);
        wColors[i].r = wordnet.getDistance(wColors[i].word, "red", "n");
        println(wColors[i].r);
        wColors[i].g = wordnet.getDistance(wColors[i].word, "green", "n");
        println(wColors[i].g);
      }

      if (senses[j].equals("v")) {
        // Do something
        wColors[i].b = wordnet.getDistance(wColors[i].word, "blue", "v");
        println(wColors[i].b);
        wColors[i].r = wordnet.getDistance(wColors[i].word, "red", "v");
        println(wColors[i].r);
        wColors[i].g = wordnet.getDistance(wColors[i].word, "green", "v");
        println(wColors[i].g);
      }

      if (senses[j].equals("adj")) {
        // Do something
        wColors[i].b = wordnet.getDistance(wColors[i].word, "blue", "adj");
        println(wColors[i].b);
        wColors[i].r = wordnet.getDistance(wColors[i].word, "red", "adj");
        println(wColors[i].r);
        wColors[i].g = wordnet.getDistance(wColors[i].word, "green", "adj");
        println(wColors[i].g);
      }
    }
    vSpacing = 400/wColors.length ;
  }
  // println(wordnet.getPos("sad") );
  //println(wordnet.getDistance("pencil", "blue", "n") ) ;
}

class WordColor {
  float r ;
  float g ;
  float b ;
  String word = "" ;
  String sense = "" ;



  color getBestColorMatch() {
    float red  = map(r, 0.0, 1.0, 0, 255) ;
    float green = map(g, 0.0, 1.0, 0, 255) ;
    float blue =  map(b, 0.0, 1.0, 0, 255) ;

    color c1 = color(255);

    if (red <= blue && red <= green) {  
      c1 = color(red, 0, 0);
    }

    if (green <= red && green <= blue) {
      c1 = color(0, green, 0);
    }


    if (blue <= red && blue <= green) {
      c1 = color(0, 0, blue);
    }

    return c1 ;
  }
}

void draw() 
{  

  //fill(255,40);
  //rect(0,0,width,height);
  for (int i=0; i < wColors.length; i++) {
    fill(wColors[i].getBestColorMatch()) ;
    noStroke();
    rect(100, 75 + (vSpacing*i), 400, vSpacing) ;
  }
}

void mousePressed() {
  saveFrame();
}





