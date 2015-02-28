
// Gashapon_coloured_text.pde
// TERESA YUNG FEB 2011
// YSDN 2005 W11
//
// SOURCE CODE TAKE FROM:
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/**
 * pixel mapping. each pixel is translated into a new element (letter)
 * 
 * KEYS
 * 1                 : toogle font size mode (dynamic/static)
 * 2                 : toogle font color mode (color/b&w)
 * arrow up/down     : maximal fontsize +/-
 * arrow right/left  : minimal fontsize +/-
 * s                 : save png
 * p                 : save pdf
 */

import processing.pdf.*;
boolean savePDF = false;

String inputText = "Gashapon machines are similar to the coin-operated toy vending machines seen outside of grocery stores and other retailers in other countries. While American coin-operated vending toys are usually cheap, low-quality products, sold for a quarter, 50¢, or sometimes 75¢[dubious – discuss], Japanese gashapon can cost anywhere from ¥100–500 (approx. US$1–6) and are normally a much higher quality product. They are often constructed from high-grade PVC plastic, and contain more molding detail and carefully painted features. Many gashapon are considered collector's items, with rare ones fetching extremely high prices in secondhand market. Gashapon toys are often based on popular character licenses from Japanese manga, video games, anime, popular icons and a few American entertainment licenses. These highly detailed toys have found a large following among all generations in Japan, and the trend is filtering to the world, especially among adult collectors, with other popular culture influences such as anime and manga. It is not at all uncommon to see sets based on licenses explicitly for adults, with figures of near-naked women. Virtually all gashapon are released in sets—each series will have a number of figures to collect. They are, by nature, a 'blind purchase'; people insert coins and hope to get the toy or figure they desire. Such an amusement element may become frustrating, as one risks obtaining the same capsule repeatedly.";
float fontSizeMax = 35;
float fontSizeMin = 4;
float spacing = 10; // line height
float kerning = 0.25; // between letters

boolean fontSizeStatic = false;
boolean blackAndWhite = false;

PFont font;
PImage img;

void setup() {
  size(533,769);
  smooth(); 
  
  font = createFont("Helvetica",10);
  
  img = loadImage("pic.png");
  println(img.width+" x "+img.height);
}

void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  background(255);
  textAlign(LEFT,CENTER);
  //textAlign(LEFT,CENTER); //// also nice!

  float x = 0, y = 10;
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
      // greyscale to fontsize
      float fontSize = map(greyscale, 0,255, fontSizeMax,fontSizeMin);
      fontSize = max(fontSize, 1);
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

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
  
  
  //if font size is equal to or less than 20, increase fornt size
  //else if font size is greater than or equal to 20, decrease font size
  if (fontSizeMax<=20) {
    fontSizeMax += 1;
  }
  else if (fontSizeMax>=20) {
    fontSizeMax -= 1;
  }
}


void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == 'p' || key == 'P') savePDF = true;
  // change render mode
  if (key == '1') fontSizeStatic = !fontSizeStatic;
  // change color stlye
  if (key == '2') blackAndWhite = !blackAndWhite;
  println("fontSizeMin: "+fontSizeMin+"  fontSizeMax: "+fontSizeMax+"   fontSizeStatic: "+fontSizeStatic+"   blackAndWhite: "+blackAndWhite);
}

void keyPressed() {
  // change fontSizeMax with arrowkeys up/down 
  if (keyCode == UP) fontSizeMax += 1;
  if (keyCode == DOWN) fontSizeMax -= 1; 
  // change fontSizeMin with arrowkeys left/right
  if (keyCode == RIGHT) fontSizeMin += 1;
  if (keyCode == LEFT) fontSizeMin -= 1; 

  //fontSizeMin = max(fontSizeMin, 2);
  //fontSizeMax = max(fontSizeMax, 2);
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}































