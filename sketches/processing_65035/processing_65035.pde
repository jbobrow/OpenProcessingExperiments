
import wordcram.*;

size(800, 500);

background(#F5F1E3);

/*
nice serifs: Cochin, AveriaSerif-Regular, Didot
scripts: Apple-Chancery, Cochin-Italic (a bit too straight)
*/

PFont averia = createFont("AveriaSerif-Regular.ttf", 1);
PFont janeAusten = createFont("JaneAust.ttf", 1);

new WordCram(this)
  .fromTextFile("declaration.txt")
  .withFonts(averia, janeAusten)
  .withColors(#B20E0E, #0E12B2)
  .angledAt(0)
  .withWordPadding(1)
  .drawAll();


