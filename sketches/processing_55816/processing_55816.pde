
class City {
  
  //instance variables
  String name;
  String state;
  Decade[] decades;
  
  
  // constructor
  City(String name_, String state_, Decade[] decades_) {
    name = name_;
    state = state_;
    decades = decades_;
  }
  
  void display(float x, float y) {
        
    // draw column label
    textFont(font);
    textSize(14);
    fill(255);
    String labels = name + ", " + state;
    text(labels, x + indent, y + rowHeight);
      
    // display all decades as columns
    for (int i = 0; i < decades.length; i++) {
      smooth();
      
      // initialize position of rectangle
      float posX = leftMargin + (colWidth + spacer) * i;
      float posY = y;
      noStroke();

      // draw white
      fill(colWhite);
      float segment = colWidth * decades[i].white / 100;
      rect(posX, posY, segment, rowHeight);
      posX = posX + segment; // increment x position
      
      // draw black
      fill(colBlack);
      segment = colWidth * decades[i].black / 100;
      rect(posX, posY, segment, rowHeight);
      posX = posX + segment; // increment x position

      // draw asian
      fill(colAsian);
      segment = colWidth * decades[i].asian / 100;
      rect(posX, posY, segment, rowHeight);
      posX = posX + segment; // increment x position

      // draw hispanic
      fill(colHispanic);
      segment = colWidth * decades[i].hispanic / 100;
      rect(posX, posY, segment, rowHeight);
      posX = posX + segment; // increment x position

      // draw other
      fill(colOther);
      segment = colWidth * decades[i].other / 100;
      rect(posX, posY, segment, rowHeight);
      posX = posX + segment; // increment x position

      // draw twoOrMore
      fill(colTwoOrMore);
      segment = colWidth * decades[i].twoOrMore / 100;
      rect(posX, posY, segment, rowHeight);
    }
  }
}

