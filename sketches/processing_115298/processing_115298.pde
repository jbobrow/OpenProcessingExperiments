
//---------------------MOVING RECTANGLEE-----------------------------

float XX=250;
float YY=150;
float ZZ=250;
float AA=150;
int a=0;
int b=0;
int c=0;
int colr=0;
int col=0;
int circ=0;
void setup () {
  size(500, 500);  //size of the frame
  background (255, 180, 0);   //ORANGE COLOR
}

//custom function::
// instead of writing a rectangle code at each line
// i am going to create a function, so i can change the values
//that i defined for the specified geometrical shape
// void draw**** (){}
void draw () {

  //function definition (width, height, chamfer, stroke)   
  // i am going to move 4 rectangles to different directions
  // in order to do so, i will use if function also to repeat movement
  XX = XX+10;
  AA = AA-10;  //ı CREATED decreasing values to move rectangles opposite direction

  //-----------------------RECTANGLES GOES CORNERS---------------------------
  colr= colr+25;

  drawrect(XX, AA, 75, colr);
  drawrect(AA, AA, 100, colr);
  drawrect(XX, XX, 25, colr);
  drawrect(AA, XX, 50, colr);
  
  //--------------------color if statement-----------------------
  // color  increase 25 each frame, when it become white then it turns black
 if (colr >= 255) {colr=0;}
 //----------------------------------------------------------------
 
  // I want the rectangles infront of the others
  //so i used If statement to repeat the process of moving rectangles
  // as a result, when the movement of other shapes complete, my rectangles will be infront of the others

  //--------------------------IF STATEMNT-----------------
  if (XX>= 500) { 
    XX=250;
  }
  if (AA == -100) { 
    AA=150;
  }


  //-----------------------RECTANGLES GOES LEFT AND RIGHT---------------------------
  drawrect(XX, 150, 75, colr);
  drawrect(AA, 150, 100, colr);
  drawrect(XX, 250, 25, colr);
  drawrect(AA, 250, 50,colr);

  //-----------------------RECTANGLES GOES UP AND DOWN---------------------------
  drawrect(250, AA, 75, colr);
  drawrect(150, AA, 100, colr);
  drawrect(250, XX, 25, colr);
  drawrect(150, XX, 50, colr);

  //----------------------RECTANGLE TOP LEFT--------------------------------
  b= b+30;
  stroke(200);
  rect(0, 0, b, b);

  //----------------------RECTANGLE BOTTOM RIGHT--------------------------------
  c= c-27;
  stroke(255);
  rect(500, 500, c, c);

//----------------------circle------------------------------
col = col+25;
stroke(col,0,0);
noFill();
circ= circ+10;
ellipse(250,250,circ,circ);
if (col >= 255) {col=0;}
  frameRate (5) ;
}


//----------------------specified geometrical shape---------------------
void drawrect (float x, float y, float chamfer, float a) {
  noFill();
  stroke(a);
  rect(x, y, 100, 100, chamfer, chamfer, chamfer, chamfer);
}

//-----------------------------------CREATED BY TUNC KARKUTOGLU---------------------------
