
// Smokescreen
// 
// Generates text from a TXT file, that is unrecognizable for the most common
// Optical Character Recognition (OCR) software.
// 
// Copyright (c) 2013 Jonathan Ravasz
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.

import processing.pdf.*;
import java.util.Calendar;

int fontSize = 12;
int specificWidth = 500; 
int lineSpacing = 4;
int textHeight;
int count = 4;
PFont font;
String string = "";

void setup() {
  size(640,900,PDF,timestamp()+"_smokescreen.pdf");
  smooth();
  background(255);
  noStroke();
  noLoop();
  font = createFont("Menlo", fontSize);
  textFont(font,fontSize);
}

void draw() {
  String lines[] = loadStrings("data.txt"); 
  string = lines[0];
  String onelongstring = join(lines," ");
  for (int i=0; i<count*calculateTextHeight(onelongstring, specificWidth, fontSize, lineSpacing); i++) {
    float x = random(65,570);
    float y = random(100,calculateTextHeight(onelongstring, specificWidth, fontSize, lineSpacing)+100);
  fill(0);
  rect(x,y,1.5,1.5);
  noStroke();
  }
  fill(0);
  text(onelongstring, 70, 100, specificWidth, 650); 
  fill(255);
  rect(65,750,510,150); 
  exit();
  }
  /*thanks to "steven" for the TextHeight calculator example
  (http://processing.org/discourse/beta/num_1195937999.html)*/
  int calculateTextHeight(String onelongstring, int specificWidth, int fontSize, int lineSpacing) {
    String[] wordsArray;
    String tempString = "";
    int numLines = 0;
    float textHeight;
    wordsArray = split(onelongstring, " ");
  for (int i=0; i < wordsArray.length; i++) {
    if (textWidth(tempString + wordsArray[i]) < specificWidth) {
     tempString += wordsArray[i] + " ";
    }
    else {
     tempString = wordsArray[i] + " ";
     numLines++;
    }
  }
  numLines++;
  textHeight = numLines * (textDescent() + textAscent() + lineSpacing);
  return(round(textHeight));
}
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


