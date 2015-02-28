
Letter a;

void setup() {
  size(300, 400);
  noLoop();
  fill(#080D27);
  stroke(#ffffff);
  strokeWeight(3);
  char [] c = {
    'd', 's', 'e', 's', 'n', 's', 's', 's', 's', 'a', 'n', 'b'
    
  };
  a = new Letter(c);
}
void draw() {
  background(255);
  a.display(0, 0, width, height);
}




/*
A
 {'d','s','e','s','n','s','s','s','s','a','n','b'}
 
 */

class Letter {
  // fields
  char [] tiles;

  // constructor
  Letter(char[] t) {
    if (t.length == 12) {
      tiles = t;
    }
    else {
      println("you messed up!");
    }
  }
  // methods

  void display(int x, int y, int w, int h) {
    //loop through tiles calling each draw method
    // create a for loop, declare a variable(i)
    for (int i=0;i<tiles.length;i++) {
      //translate to proper tile
      int hloc = i%3;
      int vloc = i/3;
      println(hloc + " " + vloc);
      int xot = x+hloc*w/3;
      int yot = y+vloc*h/4;
      //draw the proper shape
      switch (tiles[i]) {
      case 's': 
        //draw square
        rect(xot, yot, w/3, h/4);
        break;
      case 'a':
      triangle(xot,yot,xot,yot+h/4,xot+w/3,yot);
 //traingle();     
        break;
      case 'b':
   triangle(xot,yot,xot+w/3,yot,xot+w/3,yot+h/4);   
        break;
      case 'd':
      triangle(xot,yot+h/4,xot+w/3,yot+h/4,xot+w/3,yot);     
        break;
      case 'e':
      triangle(xot,yot,xot,yot+h/4,xot+w/3,yot+h/4);     
        break;
      case 'n':
      //nothing
        break;
      }
    }
  }
}
