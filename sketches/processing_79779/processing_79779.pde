
Letter [] letters;
char it = 'a';

void setup() {
  size(300, 400);
  //noLoop();
  fill(#080D27);
  stroke(#ffffff);
  strokeWeight(3);

    char [][] alpha = {
    {
      'd', 's', 'e', 's', 'n', 's', 's', 's', 's', 'a', 'n', 'b'
    }
    , //a
    {
      's', 's', 'e', 's', 's', 'a', 's', 's', 'e', 's', 's', 'a'
    }
    , //b
    {
      'd', 's', 'e', 's', 'n', 'n', 's', 'n', 'n', 'b', 's', 'a'
    }
    , //c
    {
      's', 's', 'e', 's', 'n', 's', 's', 'n', 's', 's', 's', 'a'
    }
    , //d
    {
      's', 's', 'e', 's', 'e', 'n', 's', 'a', 'n', 's', 's', 'a'
    }
    , //e
    {
      's', 's', 'a', 's', 'n', 'n', 's', 'a', 'n', 's', 'n', 'n'
    }
    , //f
    {
      'd', 's', 'e', 's', 'n', 'n', 's', 'd', 'e', 'b', 's', 'a'
    }
    , //g
    {
      'e', 'n', 'd', 's', 'n', 's', 's', 's', 's', 's', 'n', 's'
    }
    , //h
    {
      'n', 's', 'n', 'n', 's', 'n', 'n', 's', 'n', 'n', 's', 'n'
    }
    , //i
    {
      'n', 'n', 'd', 'n', 'n', 's', 'n', 'e', 's', 'n', 's', 'a'
    }
    , //j
    {
      's', 'd', 'a', 's', 's', 'n', 's', 's', 'n', 's', 'b', 'e'
    }
    , //k
    {
      'e', 'n', 'n', 's', 'n', 'n', 's', 'n', 'n', 's', 's', 'a'
    }
    , //l
    {
      'e', 'n', 'd', 's', 's', 's', 's', 's', 's', 's', 'n', 's'
    }
    , //m
    {
      'e', 'n', 'd', 's', 'e', 's', 's', 'e', 's', 's', 'n', 's'
    }
    , //n
    {
      'd', 's', 'e', 's', 'n', 's', 's', 'n', 's', 'e', 's', 'a'
    }
    , //o
    {
      's', 's', 'e', 's', 'n', 's', 's', 's', 'a', 's', 'n', 'n'
    }
    , //p
    {
      'd', 's', 'e', 's', 'n', 's', 's', 'n', 's', 'e', 's', 's'
    }
    , //q
    {
      's', 's', 'e', 's', 's', 'a', 's', 's', 'e', 's', 'n', 's'
    }
    , //r
    {
      'd', 's', 'e', 'b', 's', 'e', 'n', 'b', 's', 'd', 's', 'a'
    }
    , //s
    {
      's', 's', 's', 'n', 's', 'n', 'n', 's', 'n', 'n', 'a', 'n'
    }
    , //t
    {
      's', 's', 's', 'n', 's', 'n', 'n', 's', 'n', 'n', 'a', 'n'
    }
    , //u
  };

  letters = new Letter[alpha.length];
  for (int i =0;i<alpha.length;i++) {
    letters[i] = new Letter(alpha[i]);
  }
}


  void draw() {
    background(255);
    letters[it-97].display(0, 0, width, height);
  }

  class Letter {
    // fields
    char [] tiles;

    // constructor
    Letter(char[] t) {
      //test 12 boxes
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
          triangle(xot, yot, xot, yot+h/4, xot+w/3, yot);
          //traingle();     
          break;
        case 'b':
          triangle(xot, yot, xot+w/3, yot, xot+w/3, yot+h/4);   
          break;
        case 'd':
          triangle(xot, yot+h/4, xot+w/3, yot+h/4, xot+w/3, yot);     
          break;
        case 'e':
          triangle(xot, yot, xot, yot+h/4, xot+w/3, yot+h/4);     
          break;
        case 'n':
          //nothing
          break;
        }
      }
    }
  }


  void keyPressed() {
    it = key;
  }



  /*
create triangles using rect language.
   remeber, center of triangle may not necessairly be at the center so maybe i need to print.
   tile grid is 
   012
   012
   012
   012
   
   
   
   //a=newLetter(c);n  //remake four loop    in draw loop, i would need something different than a.display (0,0), need something to display based on what key is pressed. void keypressed. display the appropriate element hte array created.
   
   println(int('A')-97);
   println(int('ke')-97);
   
   void draw(){
   alspha[int9key0-97].draw();
   }
   
   char [][] alpha = {
   {'d', 's', 'e', 's', 'n', 's', 's', 's', 's', 'a', 'n', 'b'},//a
   {'s', 's', 'e', 's', 's', 'a', 's', 's', 'e', 's', 's', 'a'},//b
   {'d', 's', 'e', 's', 'n', 'n', 's', 'n', 'n', 'b', 's', 'a'},//c
   {'s', 's', 'e', 's', 'n', 's', 's', 'n', 's', 's', 's', 'a'},//d
   {'s', 's', 'e', 's', 'e', 'n', 's', 'a', 'n', 's', 's', 'a'},//e
   {'s', 's', 'a', 's', 'n', 'n', 's', 'a', 'n', 's', 'n', 'n'},//f
   {'d', 's', 'e', 's', 'n', 'n', 's', 'd', 'e', 'b', 's', 'a'},//g
   {'e', 'n', 'd', 's', 'n', 's', 's', 's', 's', 's', 'n', 's'},//h
   {'n', 's', 'n', 'n', 's', 'n', 'n', 's', 'n', 'n', 's', 'n'},//i
   {'n', 'n', 'd', 'n', 'n', 's', 'n', 'e', 's', 'n', 's', 'a'},//j
   };
   
   println(alphabet[2]);
   
   */
