
// delclare a letter
//global variables
Letter [] letters;
Tile [] tiles;
char it = 'a';
float t = 0;
float inc = 0.03;
float tcc=0; //color
float incc=.03; //color
boolean animate = false;

color from=color(204, 2, 0,52);
color to=color(0,102,0);

void setup() {
  size(400, 500);
  fill(0, 0, 0);
  stroke(#ffffff);
  strokeWeight(3);
  char [][] alpha = {
    {
      'd', 's', 'e', 's', 'n', 's', 's', 's', 's', 'a', 'n', 'b'
    },//a
    {
      's', 's', 'e', 's', 's', 'a', 's', 's', 'e', 's', 's', 'a' //ask y float random doesnt work and how you would fix it.
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
      'e', 'n', 'd', 's', 'e', 's', 's', 'b', 's', 's', 'n', 's'
    }
    , //n
    {
      'd', 's', 'e', 's', 'n', 's', 's', 'n', 's', 'b', 's', 'a'
    }
    , //o
    {
      's', 's', 'e', 's', 'n', 's', 's', 's', 'a', 's', 'n', 'n'
    }
    , //p
    {
      'd', 's', 'e', 's', 'n', 's', 's', 'n', 's', 'b', 's', 's'
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
      'd', 'n', 'e', 's', 'n', 's', 's', 'n', 's', 'b', 's', 'a'
    }
    , //u
    {
      'e', 'n', 'd', 's', 'n', 's', 's', 'n', 's', 'b', 's', 'a'
    }
    , //v
    {
      's', 'n', 's', 's', 's', 's', 's', 's', 's', 'a', 'n', 'b'
    }
    , //w
    {
      's', 'n', 's', 'b', 's', 'a', 'd', 's', 'e', 's', 'n', 's'
    }
    , //x
    {
      'e', 'n', 'd', 's', 'n', 's', 'b', 's', 'a', 'n', 's', 'n'
    }
    , //y
    {
      'b', 's', 's', 'n', 'd', 's', 'd', 's', 'a', 's', 's', 'e'
    }
    //z
  };


  letters = new Letter[alpha.length];
  for (int i =0;i<alpha.length;i++) {
    letters[i] = new Letter(alpha[i], 0, 0, width, height);
  }
}

void draw() {
  if (animate) {
    fill(lerpColor(from, to,tcc));
    t+=inc;
    
    tcc+=incc;
    
    // if (tcc>=.01){    //atempt 3
     //tcc=0.0;}
    
    //if(tcc>=1 || tcc<=0){   //atempt 2
      //incc=-incc;}
    
    //if (tcc>=1 || tcc<=1){  //atempt 1
      //incc=-incc;}
    
    
   // test if it gets to one
   //if statement, if tcc is > or = to 1
   //incc=-incc
   //apply to tcc if tcc is less than zero. decriment
    
    /*if(tcc>=1){
      animate=false;}*/

    if (t>=1) {
      animate=false;
    }
  }

  //println(t);
  //  draw the letter
  background(255);
  //test to make sure it does not crash
  if(it>=97&&it;<=122){
  letters[it-97].draw();
  }
}


class Tile {
  // fields (the idea, the mold, the data for the object are stored)
  char type;// one of n,s,a,b,d,e
  int hloc;// horizontal loc in letter grid
  int vloc;
  float transX, transY;
  Letter parent;

  // constructor (creates an examle of the class, relationship between the idea of a chair and an actual chair. (generates the example out of the idea)
  // the duplicates of the mold
  Tile(char t, int h, int v, Letter p) {
    type = t;
    hloc = h;
    vloc = v;
    parent = p;
    //animate blocks
    
    
    transX=random(width/2)+width*cos(random(TWO_PI));
    transY=random(height/2)+height*sin(random(TWO_PI));
   // transX=translate(width/2,height/2)*rotate(PI/3.0);
    //translate(transX/2,transY/2);
    //rotate(PI/3.0);
    
   
    
   /* transX=width/2+ width*cos(random(TWO_PI)); //creates random location
    transY=height/2+height*sin(random(TWO_PI));   */
  }


  // methods is the same as a function (a way to change something, to return a result, to make something appear. (it can set the data, you can use a method to change the state of the data).
  // parameters relate to position and size of letter NOT tile
  void draw() {
    //activate animation
    pushMatrix();
    if (animate) {
      translate(lerp(transX, 0, t), lerp(transY, 0, t));
    }
    // origin of tile
    int xot = parent.x+hloc*parent.w/3;
    int yot = parent.y+vloc*parent.h/4;

    //draw the proper shape
    switch (type) {
    case 's': 
      //draw square
      rect(xot,yot, parent.w/3, parent.h/4); //try random around yot, *3 2 yot
      break;
    case 'a':
      triangle(xot, yot, xot, yot+parent.h/4, xot+parent.w/3, yot);
      //traingle();     
      break;
    case 'b':
      triangle(xot, yot, xot+parent.w/3, yot, xot+parent.w/3, yot+parent.h/4);   
      break;
    case 'd':
      triangle(xot, yot+parent.h/4, xot+parent.w/3, yot+parent.h/4, xot+parent.w/3, yot);     
      break;
    case 'e':
      triangle(xot, yot, xot, yot+parent.h/4, xot+parent.w/3, yot+parent.h/4);     
      break;
    case 'n':
      //nothing
      break;
    }
    popMatrix();
  }
}

class Letter {
  // fields
  int x, y;
  int w, h;
  Tile [] tiles;

  // constructor
  Letter(char[] t, int xx, int yy, int ww, int hh) {
    x = xx;
    y = yy;
    w = ww;
    h = hh;

    //test 12 boxes
    if (t.length == 12) {
      tiles = new Tile[12];
      // loop through and make each tile
      for (int i = 0;i<t.length;i++) {
        tiles[i]=new Tile(t[i], i%3, i/3, this);
      }
    }
    else {
      println("you messed up!");
    }
  }


  // methods
void draw() {  //(add ints x-h)
    //loop through tiles calling each draw method
    // create a for loop, declare a variable(i)
    for (int i=0;i<tiles.length;i++) {
      tiles[i].draw();
    }
  }
}

void keyPressed() {
  it = key;
  t=0;
  tcc=0;
  animate=true;
}
