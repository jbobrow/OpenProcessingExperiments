
import controlP5.*;
ControlP5 cp5;
//type random and press enter for random

int[][] myArray = {  {0, 1, 0, 1, 0, 1, 0, 1}, //array of board
                     {1, 0, 1, 0, 1, 0, 1, 0},
                     {0, 1, 0, 1, 0, 1, 0, 1},
                     {1, 0, 1, 0, 1, 0, 1, 0}, 
                     {0, 1, 0, 1, 0, 1, 0, 1},
                     {1, 0, 1, 0, 1, 0, 1, 0},
                     {0, 1, 0, 1, 0, 1, 0, 1},
                     {1, 0, 1, 0, 1, 0, 1, 0}  };
                     
                     
int[][] pieces  = {  {8, 9, 10, 11, 12, 10, 9, 8}, //array of pieces
                     {7, 7, 7, 7, 7, 7, 7, 7},
                     {0, 0, 0, 0, 0, 0, 0, 0},
                     {0, 0, 0, 0, 0, 0, 0, 0}, 
                     {0, 0, 0, 0, 0, 0, 0, 0},
                     {0, 0, 0, 0, 0, 0, 0, 0},
                     {1, 1, 1, 1, 1, 1, 1, 1},
                     {2, 3, 4, 5, 6, 4, 3, 2}};
                    
//int[][] pieces  = {  {0, 9, 9, 0, 12, 9, 9, 0}, // you can do a different type of game, 
//                     {0, 0, 0, 0, 7, 0, 0, 0},
//                     {0, 0, 0, 0, 0, 0, 0, 0},
//                     {0, 0, 0, 0, 0, 0, 0, 0}, 
//                     {0, 0, 0, 0, 0, 0, 0, 0},
//                     {0, 0, 0, 0, 0, 0, 0, 0},
//                     {1, 1, 1, 1, 1, 1, 1, 1},
//                     {0, 0, 0, 0, 6, 0, 0, 0}};
                     

 
PImage whitePawn; // load in images
PImage whiteCastle;
PImage whiteKnight;
PImage whiteBishop;
PImage whiteQueen;
PImage whiteKing;

PImage blackPawn;
PImage blackCastle;
PImage blackKnight;
PImage blackBishop;
PImage blackQueen;
PImage blackKing;

boolean selected;
int tempX;
int tempY;
int tempPiece;
boolean whiteAlive;
boolean blackAlive;
boolean whiteTurn;
boolean whiteCastling;
boolean blackCastling;
boolean whiteCastlingTrue;
boolean blackCastlingTrue;




int n; //size of each square                     

void setup()
{
  size(400, 400); 
  
  PFont font = createFont("arial", 1);

  cp5 = new ControlP5(this); //text box

  cp5.addTextfield("input")
    .setPosition(-49, -49)
      .setSize(55, 55)
        .setFont(font)
          .setFocus(true)
            .setColor(color(255, 0, 0))
              ;
  n= 50;
  whitePawn = loadImage("whitePawn.png"); //load images
  whiteCastle = loadImage("whiteCastle.png");
  whiteKnight = loadImage("whiteKnight.png");
  whiteBishop = loadImage("whiteBishop.png");
  whiteQueen = loadImage("whiteQueen.png");
  whiteKing = loadImage("whiteKing.png");

  blackPawn = loadImage("blackPawn.png");
  blackCastle = loadImage("blackCastle.png");
  blackKnight = loadImage("blackKnight.png");
  blackBishop = loadImage("blackBishop.png");
  blackQueen = loadImage("blackQueen.png");
  blackKing = loadImage("blackKing.png");

  selected = false;
  whiteTurn = true;
  blackAlive = false;
  whiteAlive = false;
  whiteCastling = false;
  blackCastling = false;
  whiteCastlingTrue = true;
  blackCastlingTrue = true;

}

void draw()
{
  background(255);
  drawBoard(); //draws board
  whatPiece(); //selects piece
  whiteAlive = false;
  blackAlive = false; 
 

  for (int y=0; y<8; y++) {  //loop to determine if it is game over, no king left
    for (int x=0; x<8; x++) {
     if (pieces[y][x] == 6)
     {
       whiteAlive = true; 
     }
     if (pieces[y][x] == 12)
     {
       blackAlive = true; 
     }
     
    }
  } 
  if(!whiteAlive)
  {
    println("black wins");
    delay(10);
    background(random(0,255));
  }
  if(!blackAlive)
  {
    println("white wins");
    delay(10);
    background(random(0,255));

  }
  
}

 void keyPressed() //not cheats
{
  if (key == ENTER)
  {
    if ((cp5.get(Textfield.class, "input").getText()).equals ("whitepawn"))
    {
      for (int y=0; y<8; y++) {  
        for (int x=0; x<8; x++) { 
          if (pieces[y][x] == 1)
          {
            pieces[y][x] = 5;
          }
        }
      }
    }
    if ((cp5.get(Textfield.class, "input").getText()).equals ("random"))
    {
      for (int y=0; y<8; y++) {  
        for (int x=0; x<8; x++) { 
          
            pieces[y][x] = floor(random(0,13));
          
        }       
      }
      pieces[0][4] = 12;
      pieces[7][4] = 6;

    }
    if ((cp5.get(Textfield.class, "input").getText()).equals ("blackpawn"))
    {
      for (int y=0; y<8; y++) {  
        for (int x=0; x<8; x++) { 
          if (pieces[y][x] == 7)
          {
            pieces[y][x] = 11;
          }
        }
      }
    }
    if ((cp5.get(Textfield.class, "input").getText()).equals ("whitesecretagent"))
    {
    }
  }
}




void drawBoard() //draws the boards
{
  
  for (int y=0; y<8; y++) {  // loop through rows

    for (int x=0; x<8; x++) { // loop through columns

      fill(255); // default white fill

      if (myArray[y][x] == 0) {
        fill(255);
      }
      if (myArray[y][x] == 1) {
        fill(50);
      }
      if (myArray[y][x] == 2) {
        fill(255, 255, 0);
      }
      if (myArray[y][x] == 3) {
        fill(255, 0, 0);
      }

      rect(x*n, y*n, n, n); // draw piece
    }
  }
} 
boolean place_free(int xx, int yy) {
  yy = int(floor(yy/ 50));
  xx = int(floor(xx/ 50));
  if ( xx > -1 && xx < pieces[0].length && yy > -1 && yy < pieces.length ) {
    if ( pieces[yy][xx] == 0 ) {
      return true;
    }
  }
  return false;
}


void mousePressed() {

  if ( mouseButton == LEFT && !place_free(mouseX, mouseY)&& !selected) //showing where a piece can go
  {
    myArray[int(floor(mouseY/50))][int(floor(mouseX/50))] = 2;
    selected = true;
    tempPiece = pieces[int(floor(mouseY/50))][int(floor(mouseX/50))];
    tempX = int(floor(mouseX/50));
    tempY = int(floor(mouseY/50));
    if (whiteTurn)
    {
    if (pieces[tempY][tempX] == 1) //white pawn
    {
      whitePawn();
    }
    if (pieces[tempY][tempX] == 2) //white castle
    {
      whiteCastle();
    }
    if (pieces[tempY][tempX] == 3) //white knight
    {
      whiteKnight();
    }
    if (pieces[tempY][tempX] == 4) //White bishop
    {
      whiteBishop();
    }
    if (pieces[tempY][tempX] == 5) //white queen
    {
      whiteCastle();
      whiteBishop();
    }
    if (pieces[tempY][tempX] == 6) //White king
    {
      whiteKing();
    }
    }
    else
    {
    if (pieces[tempY][tempX] == 7) //black pawn
    {
      blackPawn();
    }
    if (pieces[tempY][tempX] == 8) //black castle
    {
      blackCastle();
    }
    if (pieces[tempY][tempX] == 9) //black knight
    {
      blackKnight();
    }    
    if (pieces[tempY][tempX] == 10) //Black bishop
    {
      blackBishop();
    }
    if (pieces[tempY][tempX] == 11) //black queen
    {
      blackCastle();
      blackBishop();
    }
    
    if (pieces[tempY][tempX] == 12) //Black king
    {
      blackKing();
    }
    }
    
  }



  else if ( mouseButton == LEFT && !place_free(mouseX, mouseY)&& selected && tempY == int(floor(mouseY/50))&& tempX == int(floor(mouseX/50))) //deselecting
  {
    selected = false; 
    int j;
    int i; 
    int k;
    if (int(floor(mouseX/50))+1 > 7)
    {
      i = myArray[int(floor(mouseY/50))][int(floor(mouseX/50))-1];
    }
    else
    {
      i = myArray[int(floor(mouseY/50))][int(floor(mouseX/50))+1];
    }

    if ( i == 1)
    {
      j= 0 ;
      k=1;
    }
    else
    {
      j = 1;
      k = 0;
    }

    myArray[int(floor(mouseY/50))][int(floor(mouseX/50))] = j;
  }
  else if ( mouseButton == LEFT && myArray[int(floor(mouseY/50))][int(floor(mouseX/50))] == 3) //placing down piece
  {
    if(pieces[tempY][tempX] == 6)
    {
      whiteCastlingTrue = false; 
    }
    
   
    
     if(pieces[tempY][tempX] == 12)
    {
      blackCastlingTrue = false; 
    }
    
    if(pieces[tempY][tempX] == 1 && tempY == 0)
    {
      pieces[tempY][tempX] = 5;
    }
    if(pieces[tempY][tempX] == 7 && tempY == 7)
    {
      pieces[tempY][tempX] = 11;
    }
    
    int i;
    int j;
    int k;
    if (tempX > 6)
    {
      i = myArray[tempY][tempX-1];
    }
    else
    {
      i = myArray[tempY][tempX+1];
    }

    if ( i == 1)
    {
      j= 0 ;
      k=1;
    }
    else
    {
      j = 1;
      k = 0;
    }
    pieces[int(floor(mouseY/50))][int(floor(mouseX/50))] = tempPiece;
    selected = false;
    if(pieces[tempY][tempX] == 1 && tempY == 0)
    {
      pieces[tempY][tempX] = 5;
    }
    pieces[tempY][tempX] = 0;
    
     if(whiteCastling == true)
    {
       pieces[tempY][tempX] =2;
       whiteCastling = false;
    }
    
    if(blackCastling == true)
    {
       pieces[tempY][tempX] = 8;
       blackCastling = false;
    }
    myArray[tempY][tempX] = k;
    for (int y=0; y<8; y++) { 
      for (int x=0; x<8; x++) {
        if (y%2 ==0 && x %2 == 0)
        {
          myArray[y][x] = 0;
        }
        else if (y%2 !=0 && x %2 != 0)
        {
          myArray[y][x] = 0;
        }
        else
        {
          myArray[y][x] = 1;
        }
       
      }
    }
     whiteTurn = !whiteTurn;
  }
  if (selected == false)
  {
    for (int y=0; y<8; y++) {  
      for (int x=0; x<8; x++) {
        if (y%2 ==0 && x %2 == 0)
        {
          myArray[y][x] = 0;
        }
        else if (y%2 !=0 && x %2 != 0)
        {
          myArray[y][x] = 0;
        }
        else
        {
          myArray[y][x] = 1;
        }
      }
    }
  }
}

//boolean pieceFree(int xx,int yy) {
//  yy = int(floor(yy/ 12.0));
//  xx = int(floor(xx/ 12.0));
//  if ( xx > -1 && xx < pieces[0].length && yy > -1 && yy < pieces.length ) {
//    if ( pieces[yy][xx] == 0 ) {
//      return true;
//    }
//  }
//  return false;
//}






void whatPiece() //puts down the correct piece
{
  int letter;
  for (int y=0; y<8; y++) {  
    for (int x=0; x<8; x++) {
      letter = pieces[y][x];
      switch(letter) {
      case 0: 
        // println("nothing");   
        break;

      case 1: 
        // println("white pawn");   
        image(whitePawn, x*n, y*n);
        break;

      case 2: 
        // println("white castle"); 
        image(whiteCastle, x*n, y*n);  
        break;

      case 3: 
        // println("white knight"); 
        image(whiteKnight, x*n, y*n);  
        break;

      case 4: 
        // println("white bishop");  
        image(whiteBishop, x*n, y*n); 
        break;

      case 5: 
        // println("white queen");   
        image(whiteQueen, x*n, y*n);
        break;

      case 6: 
        // println("white king");
        image(whiteKing, x*n, y*n);   
        break;

      case  7: 
        // println("black pawn");
        image(blackPawn, x*n, y*n);   
        break;

      case  8: 
        // println("black castle"); 
        image(blackCastle, x*n, y*n);   
        break;

      case  9: 
        // println("black knight");
        image(blackKnight, x*n, y*n);      
        break;

      case  10: 
        // println("black bishop");
        image(blackBishop, x*n, y*n);   
        break;

      case  11: 
        // println("black queen ");
        image(blackQueen, x*n, y*n);   
        break;

      case  12: 
        // println("black king");
        image(blackKing, x*n, y*n);   
        break;

      default:
        // println("Zulu");    
        break;
      }
    }
  }
}


//after this is all the pieces ansd the code for where it can move
 
void whitePawn()
{
  if (tempY -1 >= 0)
  {
    if (pieces[tempY-1][tempX] == 0) 
    {
      myArray[tempY-1][tempX] = 3;
      if (tempY == 6 && pieces[tempY-2][tempX] == 0)
      {
        myArray[tempY-2][tempX] = 3;
      }
    }
    if (tempY-1 > -1 && tempX - 1 > -1 )
    {
      if (pieces[tempY-1][tempX -1] != 0 && pieces[tempY-1][tempX -1] > 6)
      {
        myArray[tempY-1][tempX-1] = 3;
      }
    }
    if (tempY-1 > -1 && tempX + 1 < 8 && pieces[tempY-1][tempX +1] > 6)
    {
      if (pieces[tempY-1][tempX +1] != 0)
      {
        myArray[tempY-1][tempX+1] = 3;
      }
    }
  }
  if(tempY == 0)
  {
    pieces[tempY][tempX] = 5; 
  }
}
void blackPawn()
{
  if (tempY +1 <= 7)
    if (pieces[tempY+1][tempX] == 0)
    {
      myArray[tempY+1][tempX] = 3;
      if (tempY == 1 && pieces[tempY+2][tempX] == 0)
      {
        myArray[tempY+2][tempX] = 3;
      }
    }

  if (tempY+1 < 8 && tempX - 1 > -1 && pieces[tempY+1][tempX -1] <7 )
  {
    if (pieces[tempY+1][tempX -1] != 0)
    {
      myArray[tempY+1][tempX-1] = 3;
    }
  }     
  if (tempY+1 < 8 && tempX + 1 < 8 && pieces[tempY+1][tempX +1] <7 )
  {
    if (pieces[tempY+1][tempX +1] != 0)
    {
      myArray[tempY+1][tempX+1] = 3;
    }
  }
}
void whiteKnight()
{
  if (tempY-2 >= 0)
  {
    if (tempX-1 >= 0 && (pieces[tempY-2][tempX-1] == 0 || pieces[tempY-2][tempX-1] > 6))
    {
      myArray[tempY -2][tempX -1] = 3;
    }
    if (tempX+1 <= 7 && (pieces[tempY-2][tempX+1] == 0 || pieces[tempY-2][tempX+1] > 6))
    {
      myArray[tempY -2][tempX +1] = 3;
    }
  }
  if (tempY-1 >= 0)
  {
    if (tempX-2 >= 0 && (pieces[tempY-1][tempX-2] == 0 || pieces[tempY-1][tempX-2] > 6))
    {
      myArray[tempY -1][tempX -2] = 3;
    }
    if (tempX+2 <= 7 && (pieces[tempY-1][tempX +2] == 0 || pieces[tempY-1][tempX+2] > 6))
    {
      myArray[tempY -1][tempX +2] = 3;
    }
  }

  if (tempY+2 <= 7)
  {
    if (tempX-1 >= 0 && (pieces[tempY+2][tempX-1] == 0 || pieces[tempY+2][tempX-1] > 6))
    {
      myArray[tempY +2][tempX -1] = 3;
    }
    if (tempX+1 <= 7 && (pieces[tempY+2][tempX+1] == 0 || pieces[tempY+2][tempX+1] > 6))
    {
      myArray[tempY +2][tempX +1] = 3;
    }
  }

  if (tempY+1 <= 7)
  {
    if (tempX-2 >= 0&& (pieces[tempY+1][tempX-2] == 0 || pieces[tempY+1][tempX-2] > 6))
    {
      myArray[tempY +1][tempX -2] = 3;
    }
    if (tempX+2 <= 7&& (pieces[tempY+1][tempX+2] == 0 || pieces[tempY+1][tempX+2] > 6))
    {
      myArray[tempY +1][tempX +2] = 3;
    }
  }
}
void blackKnight()
{
  if (tempY-2 >= 0)
  {
    if (tempX-1 >= 0 && (pieces[tempY-2][tempX-1] == 0 || pieces[tempY-2][tempX-1] < 7))
    {
      myArray[tempY -2][tempX -1] = 3;
    }
    if (tempX+1 <= 7 && (pieces[tempY-2][tempX+1] == 0 || pieces[tempY-2][tempX+1] < 7))
    {
      myArray[tempY -2][tempX +1] = 3;
    }
  }
  if (tempY-1 >= 0)
  {
    if (tempX-2 >= 0 && (pieces[tempY-1][tempX-2] == 0 || pieces[tempY-1][tempX-2] < 7))
    {
      myArray[tempY -1][tempX -2] = 3;
    }
    if (tempX+2 <= 7 && (pieces[tempY-1][tempX +2] == 0 || pieces[tempY-1][tempX+2] < 7))
    {
      myArray[tempY -1][tempX +2] = 3;
    }
  }

  if (tempY+2 <= 7)
  {
    if (tempX-1 >= 0 && (pieces[tempY+2][tempX-1] == 0 || pieces[tempY+2][tempX-1] < 7))
    {
      myArray[tempY +2][tempX -1] = 3;
    }
    if (tempX+1 <= 7 && (pieces[tempY+2][tempX+1] == 0 || pieces[tempY+2][tempX+1] < 7))
    {
      myArray[tempY +2][tempX +1] = 3;
    }
  }

  if (tempY+1 <= 7)
  {
    if (tempX-2 >= 0&& (pieces[tempY+1][tempX-2] == 0 || pieces[tempY+1][tempX-2] < 7))
    {
      myArray[tempY +1][tempX -2] = 3;
    }
    if (tempX+2 <= 7&& (pieces[tempY+1][tempX+2] == 0 || pieces[tempY+1][tempX+2] < 7))
    {
      myArray[tempY +1][tempX +2] = 3;
    }
  }
}
void whiteCastle()
{
  boolean up =  false;
  boolean down= false;
  boolean left= false;
  boolean right= false;
  for (int i = 1; i < 8; i ++)
  {

    if (tempX + i > 7 || (pieces[tempY][tempX + i] <7 && pieces[tempY][tempX + i] !=0 ) || right == true)
    {
      break;
    } 
    else 
    {
      myArray[tempY][tempX +i] = 3;
    }

    if (pieces[tempY][tempX + i] > 6)
    {
      right = true;
    }
  }

  for (int i = 1; i < 8; i ++)
  {
    if (tempX-i < 0 || (pieces[tempY][tempX - i] <7 && pieces[tempY][tempX -i] !=0) || left == true)
    {
      break;
    } 
    else 
    {
      myArray[tempY][tempX-i] = 3;
    }
    if (pieces[tempY][tempX - i] > 6)
    {
      left = true;
    }
  }

  for (int i = 1; i < 8; i ++)
  {
    if (tempY-i < 0 || (pieces[tempY-i][tempX] <7 && pieces[tempY-i][tempX] !=0)|| up == true)
    {
      break;
    } 
    else 
    {
      myArray[tempY-i][tempX] = 3;
    }
    if (pieces[tempY-i][tempX] > 6)
    {
      up = true;
    }
  }

  for (int i = 1; i < 8; i ++)
  {
    if (tempY+i > 7 || (pieces[tempY+i][tempX] <7 && pieces[tempY+i][tempX] !=0)|| down == true)
    {
      break;
    } 
    else 
    {
      myArray[tempY+i][tempX] = 3;
    }
    if (pieces[tempY+i][tempX] > 6)
    {
      down = true;
    }
  }
}
void whiteBishop()
{
  boolean high =  false;
  boolean low= false;
  boolean side= false;
  boolean sides= false;

  for (int i = 1; i < 8; i ++)
  {

    if (tempX + i > 7 || tempY + i>7 || (pieces[tempY+i][tempX + i] <7 && pieces[tempY+i][tempX + i] !=0 ) || side == true)
    {
      break;
    } 

    else 
    {
      myArray[tempY +i][tempX +i] = 3;
    }
    if (pieces[tempY+i][tempX + i] > 6)
    {
      side = true;
    }
  }




  for (int i = 1; i < 8; i ++)
  {

    if (( tempY + i > 7 || tempX - i < 0) || (pieces[tempY+i][tempX - i] <7 && pieces[tempY+i][tempX - i] !=0 ) || sides == true)
    {
      break;
    } 

    else 
    {
      myArray[tempY +i][tempX -i] = 3;
    }
    if (pieces[tempY+i][tempX - i] >6)
    {
      sides = true;
    }
  }



  for (int i = 1; i < 9; i ++)
  {

    if (( tempY - i < 0 || tempX - i < 0) || (pieces[tempY-i][tempX - i] <7 && pieces[tempY-i][tempX - i] !=0 ) || high == true)
    {

      break;
    } 

    else 
    {
      myArray[tempY -i][tempX -i] = 3;
    }
    if (pieces[tempY-i][tempX -i] >6)
    {
      high = true;
    }
  }




  for (int i = 1; i < 9; i ++)
  {


    if ( tempY - i < 0 || tempX + i > 7 || (pieces[tempY-i][tempX + i] <7 && pieces[tempY-i][tempX + i] !=0 ) || low == true)
    {

      break;
    } 

    else 
    {
      myArray[tempY -i][tempX +i] = 3;
    }
    if (pieces[tempY-i][tempX +i] > 6)
    {
      low = true;
    }
  }
}

void blackCastle()
{
  boolean up =  false;
  boolean down= false;
  boolean left= false;
  boolean right= false;
  for (int i = 1; i < 8; i ++)
  {

    if (tempX + i > 7 || (pieces[tempY][tempX + i] >6 ) || right == true)
    {
      break;
    } 
    else 
    {
      myArray[tempY][tempX +i] = 3;
    }

    if (pieces[tempY][tempX + i] < 7 && pieces[tempY][tempX + i] != 0)
    {
      right = true;
    }
  }

  for (int i = 1; i < 8; i ++)
  {
    if (tempX-i < 0 || (pieces[tempY][tempX - i] >6) || left == true)
    {
      break;
    } 
    else 
    {
      myArray[tempY][tempX-i] = 3;
    }
    if (pieces[tempY][tempX - i] <7 && pieces[tempY][tempX - i] != 0)
    {
      left = true;
    }
  }

  for (int i = 1; i < 8; i ++)
  {
    if (tempY-i < 0 || (pieces[tempY-i][tempX] >6 )|| up == true)
    {
      break;
    } 
    else 
    {
      myArray[tempY-i][tempX] = 3;
    }
    if (pieces[tempY-i][tempX] <7 && pieces[tempY-i][tempX] != 0)
    {
      up = true;
    }
  }

  for (int i = 1; i < 8; i ++)
  {
    if (tempY+i > 7 || (pieces[tempY+i][tempX] >6 )|| down == true)
    {
      break;
    } 
    else 
    {
      myArray[tempY+i][tempX] = 3;
    }
    if (pieces[tempY+i][tempX] <7 && pieces[tempY+i][tempX] != 0)
    {
      down = true;
    }
  }
}
void blackBishop()
{
  boolean high =  false;
  boolean low= false;
  boolean side= false;
  boolean sides= false;

  for (int i = 1; i < 8; i ++)
  {

    if (tempX + i > 7 || tempY + i>7 || (pieces[tempY+i][tempX + i] >6  ) || side == true)
    {
      break;
    } 

    else 
    {
      myArray[tempY +i][tempX +i] = 3;
    }
    if (pieces[tempY+i][tempX + i] <7 && pieces[tempY+i][tempX + i] !=0)
    {
      side = true;
    }
  }




  for (int i = 1; i < 8; i ++)
  {

    if (( tempY + i > 7 || tempX - i < 0) || (pieces[tempY+i][tempX - i] >6  ) || sides == true)
    {
      break;
    } 

    else 
    {
      myArray[tempY +i][tempX -i] = 3;
    }
    if (pieces[tempY+i][tempX - i] <7 && pieces[tempY+i][tempX - i] !=0)
    {
      sides = true;
    }
  }



  for (int i = 1; i < 9; i ++)
  {

    if (( tempY - i < 0 || tempX - i < 0) || (pieces[tempY-i][tempX - i] >6 ) || high == true)
    {

      break;
    } 

    else 
    {
      myArray[tempY -i][tempX -i] = 3;
    }
    if (pieces[tempY-i][tempX -i] <7  && pieces[tempY-i][tempX - i] !=0)
    {
      high = true;
    }
  }




  for (int i = 1; i < 9; i ++)
  {


    if ( tempY - i < 0 || tempX + i > 7 || (pieces[tempY-i][tempX + i] >6  ) || low == true)
    {

      break;
    } 

    else 
    {
      myArray[tempY -i][tempX +i] = 3;
    }
    if (pieces[tempY-i][tempX +i] <7 && pieces[tempY-i][tempX + i] !=0)
    {
      low = true;
    }
  }
}

void whiteKing()
{
   if(tempY +1 < 7)
  { 
    if(pieces[tempY +1][tempX] >6 || pieces[tempY +1][tempX] == 0 )
    {
   myArray[tempY +1][tempX] = 3;
    }
  }
  if(tempY -1 > -1)
  {
   if(pieces[tempY -1][tempX] >6  || pieces[tempY -1][tempX] == 0)
    { 
   myArray[tempY -1][tempX] = 3;
    }
  }
  if(tempX +1 <= 7)
  { 
    if(pieces[tempY][tempX+1] >6 || pieces[tempY ][tempX+1] == 0)
    {
   myArray[tempY][tempX +1] = 3;
    }
  }
  if(tempX -1 > -1)
  { 
    if(pieces[tempY][tempX-1] >6 ||pieces[tempY ][tempX-1] == 0)
    {
   myArray[tempY][tempX -1] = 3;
    }
  }
  if(tempX +1 <= 7 && tempY +1 <= 7)
  {
    if(pieces[tempY +1][tempX+1] >6 ||pieces[tempY+1 ][tempX+1] == 0)
    {
   myArray[tempY +1][tempX +1] = 3;
    }
  }
  if(tempY +1 <= 7 && tempX -1 > -1)
  {
    if(pieces[tempY +1][tempX-1] >6 ||pieces[tempY+1 ][tempX-1] == 0)
    {
   myArray[tempY +1][tempX -1] = 3;
    }
  }
  if(tempY -1 > -1 && tempX +1 <=7 )
  {
    if(pieces[tempY -1][tempX+1] >6 ||pieces[tempY -1][tempX+1] == 0)
    {
   myArray[tempY -1][tempX +1] = 3;
    }
  }
  if(tempY -1 >-1 && tempX -1 > -1)
  {
    if(pieces[tempY -1][tempX-1] >6 ||pieces[tempY -1][tempX-1] == 0)
    {
   myArray[tempY -1][tempX -1] = 3;
    }
  }
  if(tempX -4 >-1 && whiteCastlingTrue)
  {
  if(pieces[tempY][tempX -4] == 2 && pieces[tempY][tempX -3] ==0  && pieces[tempY][tempX -2] ==0  && pieces[tempY][tempX -1] ==0 && whiteCastlingTrue)
  {
    myArray[tempY][tempX -4] = 3;
    //pieces[tempY][tempX] = 2;
    whiteCastling = true;
  }
  }
  if(tempX +3 < 8 && whiteCastlingTrue) 
  {
  if(pieces[tempY][tempX +3] == 2 && pieces[tempY][tempX +2] ==0  && pieces[tempY][tempX +1] ==0 && whiteCastlingTrue)
  {
    myArray[tempY][tempX +3] = 3;
    //pieces[tempY][tempX] = 2;
    whiteCastling = true;
  }
  }


}



void blackKing()
{
   if(tempY +1 < 7)
  { 
    if(pieces[tempY +1][tempX] <7 || pieces[tempY +1][tempX] == 0 )
    {
   myArray[tempY +1][tempX] = 3;
    }
  }
  if(tempY -1 > -1)
  {
   if(pieces[tempY -1][tempX] <7  || pieces[tempY -1][tempX] == 0)
    { 
   myArray[tempY -1][tempX] = 3;
    }
  }
  if(tempX +1 < 7)
  { 
    if(pieces[tempY][tempX+1] <7 || pieces[tempY ][tempX+1] == 0)
    {
   myArray[tempY][tempX +1] = 3;
    }
  }
  if(tempX -1 > -1)
  { 
    if(pieces[tempY][tempX-1] <7 ||pieces[tempY ][tempX-1] == 0)
    {
   myArray[tempY][tempX -1] = 3;
    }
  }
  if(tempX +1 < 7 && tempY +1 < 7)
  {
    if(pieces[tempY +1][tempX+1] <7 ||pieces[tempY+1 ][tempX+1] == 0)
    {
   myArray[tempY +1][tempX +1] = 3;
    }
  }
  if(tempY +1 < 7 && tempX -1 > -1)
  {
    if(pieces[tempY +1][tempX-1] <7 ||pieces[tempY+1 ][tempX-1] == 0)
    {
   myArray[tempY +1][tempX -1] = 3;
    }
  }
  if(tempY -1 > -1 && tempX +1 <7 )
  {
    if(pieces[tempY -1][tempX+1] <7 ||pieces[tempY -1][tempX+1] == 0)
    {
   myArray[tempY -1][tempX +1] = 3;
    }
  }
  if(tempY -1 >-1 && tempX -1 > -1)
  {
    if(pieces[tempY -1][tempX-1] <7 ||pieces[tempY -1][tempX-1] == 0)
    {
   myArray[tempY -1][tempX -1] = 3;
    }
  }
  
  
  if(tempX -4 > -1)
  {
  if(pieces[tempY][tempX -4] == 8 && pieces[tempY][tempX -3] ==0  && pieces[tempY][tempX -2] ==0 && pieces[tempY][tempX -1] ==0  && blackCastlingTrue)
  {
    myArray[tempY][tempX -4] = 3;
    //pieces[tempY][tempX] = 2;
    blackCastling = true;
  }
  }
  if(tempX + 3 < 8)
  {
  if(pieces[tempY][tempX +3] == 8   && pieces[tempY][tempX +2] ==0  && pieces[tempY][tempX +1] ==0 && blackCastlingTrue)
  {
    myArray[tempY][tempX +3] = 3;
    //pieces[tempY][tempX] = 2;
    blackCastling = true;
  }
  }
  
}





