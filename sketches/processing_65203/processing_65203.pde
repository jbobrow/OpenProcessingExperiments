
import processing.pdf.*;
boolean savePDF = false;

import fullscreen.*; 

FullScreen fs; 
PFont font, fontPoem;

final int w = 1280;
final int h = 720;
final int unitSize = w/10;

final int xGrid = w / unitSize;
final int yGrid = (h / unitSize) - 1;

String common[];
String verbs[];
String repertoire[];

String words[][] = new String[yGrid][xGrid];
int colors[][] = new int[yGrid][xGrid];

ArrayList<String> poem;

boolean presentPoem = false;

void setup() {
  size(1280, 720);
  noStroke();
  textAlign(CENTER);
  rectMode(CENTER);

  font = loadFont("Vollkorn-Regular-14.vlw"); 
  fontPoem = loadFont("Vollkorn-Italic-24.vlw");

  common = loadStrings("common.txt");
  verbs = loadStrings("verbs.txt");
  repertoire = loadStrings("words.txt");

  setWordArray();
  setColorArray();

  poem = new ArrayList<String>();
  
  fs = new FullScreen(this); 
  //fs.enter(); 
}

void  setWordArray() {
  for ( int y = 0; y < yGrid; y++) {
    for ( int x = 0; x < xGrid; x++) {
      words[y][x] = getRandomWord();
    }
  }
}

void setColorArray() {
  for ( int y = 0; y < yGrid; y++) {
    for ( int x = 0; x < xGrid; x++) {
      colors[y][x] = getRandomColor();
    }
  }
}

String getRandomWord() {
  if ( random(1.0) <= 0.5 ) {
    return repertoire[ (int)random(0, repertoire.length) ];
  } 
  else {
    if ( random(1.0) <= 0.5 ) {
      return verbs[ (int)random(0, verbs.length) ];
    } 
    else {
      return common[ (int)random(0, common.length) ];
    }
  }
}

int getRandomColor() {
  return (int)random(255);
}

void changeWord() {
  int rx = (int)random(xGrid-1);
  int ry = (int)random(yGrid-1);

  words[ry][rx] = getRandomWord();
  colors[ry][rx] = getRandomColor();
}


final int rectOffset = 3;

int timer = 0;
final int timerLimit = 25;

void draw() {
  if (savePDF) {
    beginRecord(PDF, "poem_" + timestamp()+".pdf");
  }

  background(255);

  pushMatrix();

  int xpos, ypos;
  float d;

  drawPoem();

  timer++;
  if (timer > timerLimit ) {
    timer = 0;
    changeWord();
  }

  textFont(font); 
  textAlign(CENTER);

  translate(unitSize/2, unitSize/2);

  for ( int y = 0; y < yGrid; y++) {

    pushMatrix();
    for ( int x = 0; x < xGrid; x++) {

      stroke(128);

      xpos = unitSize/2 + x*unitSize;
      ypos = unitSize/2 + y*unitSize;

      d = dist(xpos, ypos, mouseX, mouseY);

      colorMode(HSB, 255);

      fill( colors[y][x], map( d, 0, 200, 255, 50 ), 255 );

      if (!presentPoem && mousePressed == true && d < unitSize/2) {

        if ( poem.size() == 0 ) {
          poem.add( words[y][x] );
        } 
        else if ( !poem.get( poem.size()-1 ).equals(words[y][x]) ) {
          poem.add( words[y][x] );
        }
      }

      if (d < unitSize/2) {
        strokeWeight(3);
        stroke(255, 0, 0);
      } 
      else {
        noStroke();
      }

      rect(rectOffset, rectOffset, unitSize-rectOffset, unitSize-rectOffset);
      colorMode( RGB );

      fill(0);

      text(words[y][x], 0, 5);

      translate(unitSize, 0);
    }
    popMatrix();

    translate(0, unitSize);
  }

  popMatrix();

  if (presentPoem) {
    rectMode(LEFT);
    fill(0, 200);
    rect(0, 0, w, h);

    rectMode(CENTER);  

    fill(255, 255);
    rect(w/2, h/2, w*0.8, h*.8);

    fill(0, 255);
    textFont( fontPoem );
    textAlign(CENTER);

    final int hstart = (int) (h * 0.15);
    final int lineH = 35;

    for ( int i = 0; i < entirePoem.size(); i++) {
      text( entirePoem.get(i), width/2, hstart + lineH*i );
    }

    text( poemLine, width/2, hstart + lineH*entirePoem.size() );
  }

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}


ArrayList<String> entirePoem = new ArrayList<String>();
String poemLine = new String();

void drawPoem() {
  final int numberOfVisibleLines = 5;

  if ( entirePoem.size() <= 16 ) {
    entirePoem = new ArrayList<String>();

    poemLine = "";
    for ( String poemPart : poem ) {
      if (poemPart == "\n" || poemLine.length() >= 100 ) {
        poemLine += "\n";

        entirePoem.add( poemLine );
        poemLine = "";
      } 
      else {
        poemLine += poemPart + " ";
      }
    }
  }

  textFont( fontPoem );
  textAlign( CENTER );

  colorMode(RGB, 255);

  fill(0, 255);  
  text( poemLine, width/2, height - (120) );

  if ( entirePoem.size() > 0 ) {
    for ( int i = 0; i < numberOfVisibleLines; i++) {
      int currentLine = entirePoem.size() - 1 - i;

      if (currentLine >= 0) {
        fill(0, 255 - i*50);  
        text( entirePoem.get( currentLine ), width/2, height - (120 - (i+1)*30) );
      }
    }
  }
}

void keyPressed() {
  if ( key == ' ' ) {
    poem.add( "\n" );
  } 
  else if ( key == ',' ) {
    poem.add( "," );
  } 
  else if ( key == ';' ) {
    poem.add( ";" );
  } 
  else if ( key == '.' ) {
    poem.add( "." );
  } 
  else if ( key == 's' || key == 'S' ) {
    presentPoem = !presentPoem;
  } 
  else if (key == 'p' || key == 'P') {
    //savePDF = true;
    save( "poem_" + timestamp()+".png" );
  } 
  else if (key == 'n' || key == 'N') {
    poem = new ArrayList<String>();
    entirePoem = new ArrayList<String>();
  } 
  else if (key == RETURN || key == ENTER) { 
    poem.add( "\n" );
  } 
  else if (key == BACKSPACE ) {
    poem.remove( poem.size()-1 );
  }
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}



