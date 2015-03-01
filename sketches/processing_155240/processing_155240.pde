
import wordcram.*;
 
void setup() {
  size(900, 500);
  colorMode(HSB);
}
 
void draw() {
  background(68);
  color red = color(0, 255, 255);
  color mustard = color(30, 255, 255);
   
  new WordCram(this)
    .fromWebPage("http://en.wikipedia.org/wiki/Barcamp")
    .withColors(color(0, 0, 0), 
                color(0, 0, 255), 
                mustard) // red)
    .withFonts(PFont.list())
    .withAngler(moreRandomByWeight())
    .withPlacer(crazyPlacer())
    .sizedByWeight(8, 100)
    .maxNumberOfWordsToDraw(300)
    .drawAll();
}
 
WordAngler moreRandomByWeight() {
  return new WordAngler() {
    public float angleFor(Word w) {
      float range = (1-w.weight) * PI;
      return random(-range, range);
    }
  };
}
 
WordPlacer crazyPlacer() {
  return new WordPlacer() {
    public PVector place(Word w, int rank, int words, 
                        int ww, int wh, int fw, int fh) {
      float x = (fw-ww) * (1-w.weight);
      float y = random(fh-wh);
      return new PVector(x, y);
    }
  };
}

