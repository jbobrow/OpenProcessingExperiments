

/** Exported with Ai2Processing on Fri Oct 21 2011 02:04:36 GMT-0700 **/
/** See: http://bezier.de/processing/ai2p/ **/

void setup()
{
  float colorz;
  size(800, 800);
  smooth();
}

void draw()
{
  float elec = map(mouseX, 0, width, 0, 255);
  float r1 = map(mouseX, 0, width, 25, 165);
  float g1 = map(mouseY, 0, width, 160, 55);
  float b1 = map(mouseX, 0, width, 80, 45);
  float ranx = random(-5,5);
  float rany = random(-4,4);
  background(255);
  
  pushMatrix();
  translate(width/4,height/4);
  pikachu();
  popMatrix();
  
  pushMatrix();
  translate(width/8,height/8);
  electric(r1, g1, b1, elec, ranx, rany);
  popMatrix();
}

// Pikachu
void pikachu()
{
  fill(254,243,123);
  float x=0;
  float y=0;
  float a = map(mouseX, 0, width, 0, 19);
  float a1 = map(mouseX, 0, width, 0, 110);
  float a2 = map(mouseX, 0, width, 0, 100);
  float a3 = map(mouseX, 0, width, 0, 123);
  float a4 = map(mouseX, 0, width, 0,43);
  float a5 = map(mouseX, 0, width, 0, 50);
  float b = map(mouseX, 0, width, 0, 30);
  float b1 = map(mouseX, 0, width, 0, 85);
  float c = map(mouseX, 0, width, 0, 10);
  float c1 = map(mouseX, 0, width, 0, 25);
  float d = map(mouseX, 0, width, 0, 58);
  float e = map(mouseX, 0, width, 0, 70); 
 
    noStroke();
    beginShape();
      vertex( 6, 154+b );
      bezierVertex( 0, 151+b, -3, 121+b, 6, 94+b);
      bezierVertex( 16, 68+b, 54, 0+b, 54, 0+b);
      vertex( 45, 58+b );
      vertex( 103, 58+b );
      vertex( 160, 0+b );
      bezierVertex( 160, 0+b, 137, 52+b, 130, 71+b);
      bezierVertex( 123, 90+b, 124, 135+b, 120, 143+b);
      bezierVertex( 117, 151+b, 110, 166+b, 103, 168+b);
      bezierVertex( 108, 176+b, 124+c, 207-d, 129+c, 215-e);
      bezierVertex( 133+a, 223-b1, 140+a4, 250-a1, 140+a4, 250-a1);
      vertex( 102+a1, 200-a5 );
      bezierVertex( 102+a1, 200-a5, 114+a2, 277-a3, 116+a2, 281-a3);
      bezierVertex( 123+a2, 277-a3, 170+a2, 245-a3, 170+a2, 245-a3);
      vertex( 158+a2, 215-a3 );
      vertex( 298+a2, 122-a3 );
      vertex( 320+a2, 213-a3 );
      vertex( 202+a2, 231-a3 );
      vertex( 202+a2, 255-a3 );
      vertex( 117+a2, 298-a3 );
      bezierVertex( 117+a2, 298-a3, 117+a1, 307-a5, 115+a1, 324-a4);
      bezierVertex( 112+a1, 340-a5, 106+a1, 372-a5, 106+a1, 372-a5);
      vertex( 99+a1, 301-a5 );
      vertex( 79+a1, 301-a5 );
      vertex( 66+a1, 301 );
      vertex( 54+a3, 301-a5 );
      vertex( 42+a4, 301-a4 );
      vertex( 29+a5, 372-a5 );
      bezierVertex( 29+a5, 372-a5, 23+a5, 303, 19+a5, 256);
      bezierVertex( 18+a5, 233, 17+c1, 216+a4, 17+c1, 214+a4);
      vertex( 0+b, 269+a4 );
      bezierVertex( 0+b, 269+a4, 6, 177+b, 11, 171+b);
      bezierVertex( 11, 171+b, 18, 158+b, 6, 154+b);
    endShape();
}

void electric(float r, float g, float b, float s, float x, float y)
{
        strokeWeight(1);
        stroke(r, g, b, s);
        noFill();
        beginShape();
    vertex( 60 + x , 73 + y );
        vertex( 79 + x, 151+ y );
        vertex( 0 + x, 180 + y);
        vertex( 74 + x, 182 + y);
        vertex( 10 + x, 250 + y);
        vertex( 70+ x , 247 + y);
        vertex( 12 + x, 312 + y);
        vertex( 83+ x , 312 + y);
        vertex( 35 + x, 393 + y);
        vertex( 90 + x, 377+ y );
        vertex( 88 + x, 441 + y);
        vertex( 116 + x, 418+ y );
        vertex( 147 + x, 477 + y);
        vertex( 167 + x, 442 + y);
        vertex( 225 + x, 491 + y);
        vertex( 232 + x, 428+ y );
        vertex( 286 + x, 479 + y);
        vertex( 307 + x, 425+ y );
        vertex( 343 + x, 437 + y);
        vertex( 365 + x, 402+ y);
        vertex( 436 + x, 427 + y);
        vertex( 411 + x, 365 + y);
        vertex( 471 + x, 333 + y);
        vertex( 436 + x, 298+ y);
        vertex( 506 + x, 269 + y);
        vertex( 491 + x, 240 + y);
        vertex( 546 + x, 235 + y);
        vertex( 540 + x, 213 + y);
        vertex( 577 + x, 183 + y);
        vertex( 549 + x, 172 + y);
        vertex( 565 + x, 118 + y);
        vertex( 538 + x, 123+ y );
        vertex( 533 + x, 65 + y);
        vertex( 495 + x, 70 + y);
        vertex( 472 + x, 16 + y);
        vertex( 431 + x, 89 + y);
        vertex( 394 + x, 25 + y);
        vertex( 372 + x, 87 + y);
        vertex( 349 + x, 17+ y );
        vertex( 316 + x, 71 + y);
        vertex( 278 + x, 29 + y);
        vertex( 250 + x, 85+ y);
        vertex( 231 + x, 27 + y);
        vertex( 197 + x, 80 + y);
        vertex( 172 + x, 0 + y);
        vertex( 156 + x, 74 + y);
        vertex( 124 + x, 29 + y);
        vertex( 132 + x, 94 + y);
        vertex( 104 + x, 45 + y);
        vertex( 103 + x, 117 + y);
    endShape( CLOSE );
}

