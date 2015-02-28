
Info i;
void setup() {
  size(500,500);
  rectMode(CENTER);
  i = new Info();
  Board b = new Board(i);
  b.display();
  i.addboard(b);
  text("Enter a number--how many spaces to move--and then hit return.  At any time, you may repeat this.", 250,25,200,50);
}

void draw() {
  //b.display();
  
}

void mousePressed() {
  //println(i.myboard.tiles[18].havepiece);
   Tile selected = null;
   for (Tile t: i.myboard.tiles) {
     if (t.isover()) {
        selected = t;
        //println(selected.id + " 1");
     }
  }
  if (selected != null) {
     if (selected.havepiece) {
       if (i.piececlicked == false) {
         i.piececlicked = true;
       } else {
       i.piececlicked = false; 
       }
     } else {
     if (i.piececlicked && selected.canbereached(i.movenumber)) {
        i.piececlicked = false;
        i.tilewithpiece.havepiece = false;
        selected.havepiece = true;
        i.tilewithpiece = selected;
     } }
  } else {
    piececlicked = false; 
  }
  i.myboard.display();
}
class Tile {
  static int radius = 30;
  Tile a;
  Tile b;
  int id;
  Info state;
  //Tile c;  I shall make just a triangluar board for the purposes of the demo
  //Piece p;  A boolean switch shall suffice due to the nature binary.
  boolean havepiece = false;
  int xcenter;
  int ycenter;
  //int id;
  Tile (int x, int y, int i, Info inf) {
     xcenter = x;
     ycenter = y;
     //this.id = id;
     this.id = i;
     state = inf;
  }
  boolean isover() {
     return (radius/2)*(radius/2) > ((mouseX - xcenter)*(mouseX - xcenter) + (mouseY - ycenter)*(mouseY - ycenter) );   //dist formula also "radius" is actually diameter. My bad. Went full retard there
  }
  boolean canbereached(int dist) {
      if (dist == 0) {
        if (this.havepiece) {
          return true;
        } else {
          return false;
        } 
      } else {
        return a.canbereached(dist - 1) || b.canbereached(dist - 1);
      }
  }
  void display() {
      if (havepiece) {
        fill(255,0,0);
      } else {
        fill(0,255,0); 
      }
      if (i.piececlicked && canbereached(i.movenumber)) {
        fill(0,0,255); 
      }
      ellipse(xcenter, ycenter, radius, radius);
      if (havepiece) {
         fill(155);
         rect(xcenter, ycenter, 10, 25);
      }
  }
}
/*
class Figure {
   int myX;  //center X coord 
   int myY;  //center Y coord
   Figure(int x, int y) {
      myX = x;
      myY = y; 
   }
   static int sizeX = 10;
   static int sizeY = 25;
   boolean isover() {
      return mouseX>(myX - .5*sizeX)&&mouseX<(myX + .5*sizeX)&&mouseY>(myY - .5*sizeY)&&mouseY<(myY + .5*sizeY);  //ze bounds
   }
} */
class Board {
  Info context;
  Tile [] tiles = new Tile[27];
  int index = 0;
  void display() {
    for (Tile t: tiles) {
     t.display();
  }
  }
  Board (Info i) {
  context = i;
  for (int i = 100; i<400; i+=30) {
    tiles[index] = new Tile(i,400,index,context);
    index++;
  }
  int k=100;
  int l=400;
  int k1 = 100 + 9*30  ;
  int l1 = 400  ;
  for (int i=0; i<9;i++){
    tiles[index] = new Tile(k+30*cos(PI/3),l-30*sin(PI/3),index,context);
    k = k+30*cos(PI/3);
    l = l-30*sin(PI/3);
    index++;
  }
  for (int i=0; i<8;i++){
    tiles[index] = new Tile(k1-30*cos(PI/3),l1-30*sin(PI/3),index,context);
    k1 = k1-30*cos(PI/3);
    l1 = l1-30*sin(PI/3);
    index++;
  }
  for (int i=1; i<=8; i++) {
     tiles[i].a = tiles[i-1];
     tiles[i].b = tiles[i+1]; 
  }
  for (int i=11; i<=17; i++) {
    tiles[i].a = tiles[i-1];
    tiles[i].b = tiles[i+1];
  }
  for (int i=20; i<=25; i++) {
    tiles[i].a = tiles[i-1];
    tiles[i].b = tiles[i+1];
  }
  tiles[0].a = tiles[1];
  tiles[0].b = tiles[10];
  
  tiles[10].a = tiles[0];
  tiles[10].b = tiles[11];
  
  tiles[9].a = tiles[8];
  tiles[9].b = tiles[19];
  
  tiles[19].a = tiles[9];
  tiles[19].b = tiles[20];
  
  tiles[18].a = tiles[17];
  tiles[18].b = tiles[26];
  
  tiles[26].a = tiles[18];
  tiles[26].b = tiles[25];
  
  tiles[18].havepiece = true;
  context.tilewithpiece = tiles[18];

 }
  
  
}
String accumulatedisplay = "0";
void keyPressed() {
  
 
  if (key == '\n') {
       
       i.movenumber = float(accumulatedisplay);
       accumulatedisplay = "";
     
  } else  {
      accumulatedisplay = accumulatedisplay.concat(key); 
   } 
   fill(255);
   rect(150,100,300,20);
   rect(150,130,300,20);
   fill(155);
  text("You are entering: " + accumulatedisplay, 150,100,300,20);
  text("You can move " + i.movenumber + " spaces",150,130,300,20);
}
class Info {
  Board myboard;
  
  Tile tilewithpiece = null;
  boolean piececlicked = false;
  int movenumber = 5;
  Info() {
  }
  void addboard(Board b) {
    myboard = b; 
  }
}
//class Inputhandler {
    
//}
//class Piece() {
  
//}


