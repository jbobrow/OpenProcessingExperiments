
/**
 * KEYS
 * 1                 : toogle font size mode (dynamic/static)
 * 2                 : toogle font color mode (color/b&w)
 * arrow up/down     : maximal fontsize +/-
 * arrow right/left  : minimal fontsize +/-
 */

 
String inputText = "Here we go/ You wear your smile like a summer sky just shining down on me and you I swear your heart is a, a free bird on a lazy SUnday afternoon/ I love the way that you were up for anything never worried 'bout what people say, that's right oh, that's right, what we got it/ Just like driving on an open highway never knowing what we're gonna find just like two kids, baby, always trying to live it up whoa, yeah, that's our kind of love/ Mmm, that's our kind of love/ Skipping rocks and leaving footprints down there on the riverbank always holding hands, never making plans just living in the moment, babe/ You get me laughing with those funny faces you somehow always know just what to say, that's right whoa, that's right, what we got is/ Just like driving on an open highway never knowing what we're gonna find just like two kids, baby, always trying to live it up whoa, yeah, that's our kind of love/ That's our kind of love/ Oh, that's right, baby, you and I what we got is/ Just like driving on an open highway never knowing what we're gonna find just like two kids, baby, always trying to live it up whoa, oh, oh yeah/ Just like driving on an open highway never knowing what we're gonna find just like two kids, baby, always trying to live it up whoa, yeah, that's our kind of love/ Ooh, that's our kind of love whoa, that's our kind of love/ 1, 2, 3, here we go ooh, yeah that's our kind of love, girl don't ya know it?";
float fontSizeMax = 13;
float fontSizeMin = 3;
float spacing = 7; // line height
float kerning = 0.5; // between letters
 
boolean fontSizeStatic = false;
boolean blackAndWhite = false;
 
PFont font;
PImage img;
 
void setup() {
  size(800,500);
  smooth();
   
  font = loadFont("Baskerville-13.vlw");
   
  
   
  img = loadImage("IMG_0381.jpg");
  println(img.width+" x "+img.height);
}
 
void draw() {
 
  background(255, 255, 232);
  textAlign(LEFT);
 
  float x = 0, y = 0;
  int counter = 0;
 
  while (y < height) {
    // translate position (display) to position (image)
    int imgX = (int) map(x, 0,width, 0,img.width);
    int imgY = (int) map(y, 0,height, 0,img.height);
    // get current color
    color c = img.pixels[imgY*img.width+imgX];
    int greyscale = round(red(c)*0.222 + green(c)*0.707 + blue(c)*0.071);
 
    pushMatrix();
    translate(x, y);
 
    if (fontSizeStatic) {
      textFont(font, fontSizeMax);
      if (blackAndWhite) fill(greyscale);
      else fill(c);
    }
    else {
      float fontSize = map(greyscale, 0,255, fontSizeMax,fontSizeMin);
      fontSize = max(fontSize, 2);
      textFont(font, fontSize);
      if (blackAndWhite) fill(0);
      else fill(c);
    }
 
    char letter = inputText.charAt(counter);
    text(letter, 0, 0);
    float letterWidth = textWidth(letter) + kerning;
    // for the next letter ... x + letter width
    x = x + letterWidth; // update x-coordinate
    popMatrix();
 
    // linebreaks
    if (x+letterWidth >= width) {
      x = 0;
      y = y + spacing; // add line height
    }
 
    counter++;
    if (counter > inputText.length()-1) counter = 0;

  }
 
}
 
 
void keyReleased() {
  // change render mode
  if (key == '1') fontSizeStatic = !fontSizeStatic;
  // change color stlye
  if (key == '2') blackAndWhite = !blackAndWhite;
  println("fontSizeMin: "+fontSizeMin+"  fontSizeMax: "+fontSizeMax+"   fontSizeStatic: "+fontSizeStatic+"   blackAndWhite: "+blackAndWhite);
}
 
void keyPressed() {
  // change fontSizeMax with arrowkeys up/down
  if (keyCode == UP) fontSizeMax += 3;
  if (keyCode == DOWN) fontSizeMax -= 3;
  // change fontSizeMin with arrowkeys left/right
  if (keyCode == RIGHT) fontSizeMin += 3;
  if (keyCode == LEFT) fontSizeMin -= 3;
 
  //fontSizeMin = max(fontSizeMin, 2);
  //fontSizeMax = max(fontSizeMax, 2);
}


