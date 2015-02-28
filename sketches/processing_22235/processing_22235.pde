
// P_4_3_2_01.pde
// 
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

String inputText = " Ukudigada Ma'as Salaam Totsiens Hooroo Abar Dekha Hobe Donadagohvi Zai Jian, Zai Hui, Bai Bai Zai Geen Na Shledanou, Ahoj Do viđenja, Zbogom Farvel, Hej Tot Ziens, Doei Bye Näkemiin, Heippa Ni Sa Moce, Moce Mada Au Revoir, À bientôt Ba’adan Mibinamet, Khoda Hafiz, Be Omide Didar Auf Wiedersehen Kan Ga Waanaa Aavjo Aloha Shalom Alvida, Namaste, Chalte Hain Arrivederci, Addio Slán, Slán Leat Le-Hitra-Ot, Lehit Sayonara Annyong-hi Kashipshio Vale, Valete Adiós, Ya Da Ma Ha Det, Vi snakes Sige Adeus Do Widzenia Dasvidania, Ashen Devlesa La Revedere, A damaun Adiós, Hasta la Vista, Hasta Pronto, Hasta mañana, Nos Vemos Kwa Heri Hejdå, Synes Tschüss Mikonan Selavu Sawatdi Eyvallah, Allaha Ismarladik, Elveda Do Pobatchenya, Bud Zdorov Khuda Hafiz Xin chào ông Hwyl, Da Boch Rhonanai Ambera Zay Gesunt Hamba Kahle.";
float fontSizeMax = 10;
float fontSizeMin = 5;
float spacing = 3; // line height
float kerning = 0.1; // between letters

boolean fontSizeStatic = false;
boolean blackAndWhite = false;

PFont font;
PImage img;

void setup() {
  size(800,531);
  smooth(); 
  
  font = loadFont("AGaramond-Italic-11.vlw");
  
 
  
  img = loadImage("byeone.png");
  println(img.width+" x "+img.height);
}

void draw() {
  //if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  background(255);
  textAlign(LEFT);
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

