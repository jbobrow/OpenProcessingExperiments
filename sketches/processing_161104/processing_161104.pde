
/*
This sketch shows how to make a WordCram from any webpage.
It uses the WordCram blog, and was used to make the image in
the javadocs (http://wordcram.googlecode.com/svn/javadoc/index.html).

Minya Nouvelle font available at http://www.1001fonts.com/font_details.html?font_id=59
 */

import wordcram.*;

size(800, 400);
colorMode(HSB);
background(255);

new WordCram(this)
  .fromWebPage("http://www.earj.com.br")
  .withFont(createFont("GurmukhiMN-20.vlw", 1))
  .withColorer(Colorers.twoHuesRandomSatsOnWhite(this))
  .sizedByWeight(7, 100)
  .drawAll();


