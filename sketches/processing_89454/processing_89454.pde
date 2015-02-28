
/* chameleon. Everytime the background changes color, the text will slowly
 change the color to the same one as the background but slightly slower so that
 you can see the change. 
 
 The text will also be moving about. */

PFont font;
float x =0;
int colorchange = 10;
float xpos, ypos;

//------ speed of the textNow you see me, now you don'tNow you see me, now you don't
float xspeed = 1.8; 
float yspeed = 3;

//----- direction
int xdirection = 1; // left to right
int ydirection =1; // top to bottom

//----- fade

float fade;
int passedTime;
int maxTime = 50;
boolean boolFade;
boolean bFadeIn;



void setup () {
  size(500, 500);
  colorMode(HSB);
  font = loadFont ( "GillSans-20.vlw" );
  textFont (font);
  textAlign (CENTER);
  
  //starting position of text
  xpos = width/2;
  ypos = height/2;
  
}

void draw () {
  background(colorchange, 180, 200);
  textFade ();


  //----- text

  fill(colorchange, fade);
  text("Now you see me, now you don't!", xpos, ypos, 160, 100 );



  //----- movement
  xpos = xpos + (xspeed * xdirection);
  ypos = ypos + (yspeed * ydirection);
  if (xpos > width-160 || xpos <= 0) {
    xdirection *= -1;
  }
  if (ypos >= height-80 || ypos <= 0) {
    ydirection *= -1;
  }
}

//----- BG colour changes with every click
void mousePressed() {
  colorchange+=86;
  colorchange%=255;
  boolFade = true;
  bFadeIn = !bFadeIn;
}

//----- fade

void textFade() {
  if (boolFade) {
    passedTime++;
    if (bFadeIn) {
      fade = map(passedTime, 0, maxTime, 255, colorchange);
    } 
    else {
      fade = map(maxTime - passedTime, 0, maxTime, colorchange, 255);
    }
    //    println(bFadeIn + " " + passedTime + " " + fade);
    if (fade > 254 || fade < 1) {
      boolFade = false;
      passedTime = colorchange;
    }
  }
}


