
// delclare a letter
Letter myletter;

void setup() {
//  create letters and enter data for them
  
}
void draw() {
//  draw the letter
  myletter.draw();
}


class Tile {
  // fields (the idea, the mold)
  char type;// one of n,s,a,b,d,e
  int hloc;// horizontal loc in letter grid
  int vloc;
  Letter parent;

  // constructor (creates an examle of the class, relationship between the idea of a chair and an actual chair. (generates the example out of the idea)
  // the duplicates of the mold
  Tile(char t, int h, int v) {
    type = t;
    hloc = h;
    vloc = v;
  }


  // methods
  void draw() {
    // origin of tile
    int xot = parent.x+hloc*parent.w/3;
    int yot = parent.y+vloc*parent.h/4;
    switch(type) {
    case 's': 
      //draw square
      rect(xot, yot, parent.w/3, parent.h/4);
      break;
    case 'a':
    }
  }
}

class Letter {
  // fields
  int x, y;
  int w, h;
  Tile [] tiles;

  // constructor
  Letter() {
  }
  // methods


  void setTiles() {
  }

  void draw() {
    //loop through tiles calling each draw method
    // create a for loop, declare a variable(i)
    for (int i=0;i<tiles.length;i++) {
      tiles[i].draw();
    }
  }
}
