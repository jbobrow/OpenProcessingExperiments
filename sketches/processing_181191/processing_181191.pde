
import processing.pdf.*;
boolean saveOneFrame = false;

PFont myFont;

PGraphics pg;
color BACKGROUND_COLOR = color(255);
color PGRAPHICS_COLOR = color(0);

int nummer;
int x, y;
int pixelSize = 4;
int textgroote = 70;

void setup() {
  background(255);
  size(700,800);//P2D
  //frameRate(1);
  
  myFont = createFont("Georgia-Bold", textgroote);
  textFont(myFont);

  nummer+=1;

  // aanmaken van die onzichtbare laag
  pg = createGraphics (width, height, JAVA2D);
  pg.beginDraw();

  //typo erin zetten
  
//  String[] fontList = PFont.list();
//  println(fontList);

  pg.textSize(textgroote);
  pg.textAlign(LEFT, TOP);
  pg.fill(PGRAPHICS_COLOR);
  //pg.text("FLUXUS", pg.width/2, pg.height/2-50);
  pg.endDraw();

  noStroke();
}


void draw() {
  if (saveOneFrame == true) {
    beginRecord(PDF, "Pixel typo mail "+ nummer +".pdf");
  }
//pixelsize+1
  for (int x = 0; x <width; x += pixelSize) {
    for (int y = 0; y <height; y += pixelSize) {
      //als de kleur op het punt x, y in de pg laag gelijk is aan PGRAPHICS_COLOR
      if (pg.get(x, y)== PGRAPHICS_COLOR) {
        //alle kleuren
        fill(random(200,255), random(100,255), 0);


      } else {
        // alleen random zwart wit
        fill(random(100));
      }



      //      /point(x, y);
      rect(x, y, pixelSize, pixelSize);
    }
  }
  /*
 if (x>=width-2) {
   x=1;
   y+=2;
   }
   */
  if (saveOneFrame == true) {
    endRecord();
    saveOneFrame = false;
  }
}

String text = ""; 
void keyReleased() {
  text = text + key;
  println( text );
  pg.beginDraw();
  pg.background(255);

  //typo erin zetten
  pg.text(text, pg.width-width+40, pg.height-height+60);
  pg.endDraw();
}

void mousePressed(){
    saveOneFrame = true; 
    // endRecord();
    // exit();

    // } else if (y>height) {
    //      endRecord();
    //    exit();
  }




