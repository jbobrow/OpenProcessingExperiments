
/*
 * Love and Hate
 * The idea is: place your heart in a 2D space between Love, Hate, Hope and desperation
 * Watch the brightness from the heart
 * A crysis in my life gaves me the inspiration making that graphic visualization
 * 1st mouse klick change to paint mode (added after get working basic scetch) 
 * 2nd mouse klick safe a picture and jump back to localice mode
 *
 * the array function for moving the heart is taken from the examples libary
 */

PImage bg; 
/* @pjs preload="love-hate.jpg"; */
int x, y, xold, yold, beat, counter, state;
float dia = 1, diac=1, br1, br2;
float mx[] = new float[40];
float my[] = new float[40];


void setup() {
  size(600, 600);
  bg = loadImage("love-hate.jpg");
  noCursor();
  noStroke();
  colorMode(RGB, height, height, height);
  frameRate(60);
  background(bg);
 }

void draw() {
  
  br1 = map(mouseX, 0, width, 0, height/2);
  br2 = 256-map(mouseY, width, 0,  height/2,0);
  fill(br1+br2,50,0); // get brightness
  
  x = mouseX; // get position & keep in range
  if (x < 60) x = 60;
  if (x > 540) x = 540;
  y = mouseY;
  if (y < 60) y = 60;
  if (y > 540) y = 540;
  
  if (state == 0)
    paint_heart();
  else
    paint_picture();
   xold = x;
   yold = y;
}

void mousePressed() {
    if (state == 0) {// clean up
      fill(0,255);
      rect(40,40,520,520);
      state = 1;
    }
    else {
      //saveFrame("love-#########.png"); safe picture turned off for java script web
      background(bg);
      state = 0;
    }
}

void paint_heart() // painting my 'heart'
{
  if (x == xold && y == yold) // no move
  {

    fill(0,10);
    rect(40,40,520,520);
    //background(bg);
    fill(br1+br2,50,0);
    dia += diac;
    if(dia > 39) diac = -0.6; // make smaler
    if (diac < 0)
    {
      if(beat == 0 && dia < 31) {//2nd heart beat
          diac = 1.5;
          beat = 1;
      }
      else if(beat == 1 && dia < 23) {//1st heart beat
         diac = 1.25;
         beat = 0;
      }
    }
    ellipse(x,y,dia,dia);
  }
 else // moving in state 0
 {
   background(bg);
    int which = frameCount % 40;
    mx[which] = x;
    my[which] = y;
    for (int i = 0; i < 40; i++) {
    int index = (which+1 + i) % 40;
    ellipse(mx[index], my[index], i, i);
    }
  }
}

void paint_picture() // routine taken from the examples, but i do not clear the background
{
  int which2 = frameCount % 40;
  mx[which2] = x;
  my[which2] = y;
  for (int i = 0; i < 40; i++) {
    int index = (which2+1 + i) % 40;
    ellipse(mx[index], my[index], i, i);
  }
}


