
/**
 * template for assignment 4: the garden of good and evil
 * prepared by schien@mail.ncku.edu.tw (2009-04-26)
 */


void setup(){
  size(1000,400);
  background(200);
  PFont fontA = loadFont("Skia-Regular-12.vlw");
  textMode(SCREEN);
  textFont(fontA, 12);
  //textSize(9);
  loadData();

  //noLoop();
}

void draw() {
  drawData();
  fill(50);
  noStroke();
  rect(0, height-50, width, 50);
  noLoop();
}

class StockQuote {
  String name = "";
  float openPrice = 0;
  float askPrice = 0;
  float bidPrice = 0;
  float change = 0;
  float yearLow = 0;
  float yearHigh = 0;

  void draw(float ox, float oy) {
    stroke(0);
    line(ox, oy, ox, oy-openPrice);
    
    fill(0, 0, 150);
     text(name, ox, oy-openPrice);
     if (change < 0) {
     fill(255, 0, 0, 50);
     } else {
     fill(0, 255, 0, 50);
     }
     noStroke();
     ellipseMode(CENTER);
     float dia = abs(askPrice - yearLow);
     ellipse(ox, oy-openPrice, dia, dia);
     
  }
}





