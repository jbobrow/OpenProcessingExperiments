
// Code Written By: Chukwudi T. Unonu
// Date Created:  03/05/2012
// Date Finished: 03/0?/2012
//
// ARTT489i - Advanced Digital Imaging
// Instructor: Prof. Brandon Morse
// University of Maryland, College Park, MD
//
// Made With: INSPIRON 1521 (Motherboard), INSPIRON 1520 (Screen)
//
// SKETCH 3 of 24: "Class 'Dismissed'"
//
// DESCRIPTION: Sketch attempting to successfully use classes, as 
// suggested by classmate (pun not intended).
// Sketch Items: Overlapping Rectangles, filled and stroked in differing 
// colors schemes.
// (Book Example, ppg. 15,395-401 )
// (Website References: <http://processing.org/reference/class.html>
//
////  ----====    START "Sketch"   ====----
//


// Declare and contruct two objects (h1, h2) from the class HLine 
HLine h1 = new HLine(20, 2.0); 
HLine h2 = new HLine(50, 2.5); 
HLine h3 = new HLine(80, 3.0);
RECTangle rct1 = new rect(30, 20, 55, 55);
RECTangle rct2 = new rect(20, 10, 55, 55);

//// Diagonals da, db;
 
void setup()
{
  size(500,500);
  background(#9c3414);  //set background white
  frameRate(60);

////  counter = 0;

//smooth();
//// Inputs: x, y, speed, thick, gray
//da = new Diagonals(0, 80, 1, 2, 0);
//db = new Diagonals(0, 55, 2, 6, 255);

}

////class examples

//void draw() 
//{  //draw function loops 

//da.update();
//db.update();
//class Diagonals 
//{
//int x, y, speed, thick, gray;

//Diagonals(int xpos, int ypos, int s, int t, int g) 
//{
//x = xpos;
//y = ypos;
//speed = s;
//thick = t;
//gray = g;
//}


//}


void draw() 
{ 
  stroke(#a7beda);
  strokeWeight(5);
  
  h1.update(); 
  h2.update();  
  h3.update();  
  rct1.display();
  rct2.display();
} 
 
class HLine 
  { 
  float ypos, speed; 
  HLine (float y, float s) 
  {  
    ypos = y; 
    speed = s; 
  } 
  void update() 
  { 
    ypos += speed; 
    if (ypos > height) 
    { 
      ypos = 0; 
    } 
    line(0, ypos, width, ypos); 
  } 

class RECTangle 
{ 
  float x, y, width, height;
  RECTangle(float xpos, float ypos, float dia) 
  { 
    x = xpos; // Assign 33 to x 
    y = ypos; // Assign 50 to y 
    width = wid; // Assign to 55 
    height = hei; // Assign to 55
  }

//void display() 
//   { 
//   rect(x, y, width, height);
//   }
 }



}
