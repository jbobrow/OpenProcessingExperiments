


class Card {
  PImage card;
  PImage mini;
  
  Card(PImage slice, int xfactor, int yfactor) {
    this.card = slice.get();
    this.mini = slice.get();
    mini.resize(xfactor, yfactor);
  }
  
}

