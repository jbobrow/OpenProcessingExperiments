
/* 
 Elizabeth Umbrino 
 August 3, 2011
 Geometry Homework
 */
PFont myDisplayFont;

void setup() {
  size (150, 115);
  background(255);
  smooth();
  fill(10);
  myDisplayFont = loadFont("Baskerville-Italic-48.vlw"); 
  textFont(myDisplayFont, 10); 
  textAlign(RIGHT);
}

void draw() {
  colorMode(RGB);
  


  fill(79, 133, 72);
  rect(0, 70, 32, 43);
  // (x, y, w, h)

  // fill(106,129,72);
  // rect(width/2, height/2, 52, 46);
  // what is width/#?

  fill(106, 129, 72);
  rect(33, 67, 52, 46);

  fill(78, 101, 62);
  rect(85, 67, 64, 46);


  fill(37, 42, 43);
  rect(0, 0, 32, 72);


  fill(109, 173, 40);
  rect(33, 0, 30, 24);

  fill(83, 141, 74);
  rect(33, 24, 30, 17);

  fill(148, 193, 44);
  rect(33, 38, 30, 28);
  
    fill(51, 55, 57);
  rect(	64, 0,	87, 69);
  
    fill(194, 221, 82);
  rect(85, 0, 40, 6);

fill(75, 128, 90);
  rect(72, 0, 15, 6);
  


fill(113, 151, 130);
  rect(117, 0, 32, 43);


    text("Good Enough", 120 , 65);
  
}


