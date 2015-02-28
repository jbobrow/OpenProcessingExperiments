
// **************************************************
// * chiodini.pde
// * by cameyo 2012
// *
// * The famous game of CHIODINI
// *
// * code written for Processing 1.5.1
// **************************************************

//*************************************************
// CHANGE DIMENSION OF GRID AND CHIODINO
//
// sizeX min -> 500
// sizeY min -> 400
// 
// dim chiodino min -> 8
// dim chiodino max -> 100
//
// sizeX and (SizeY-100) MUST be multiple of dim
//*************************************************

// ********************
// VARIABLE DECLARATION
// ******************** 
// font for text
PFont font;
// output filename
String filename;
// background color 
color backC;
// chiodini type 0->circle, 1->square, 2->ERASE
int tipo, oldTipo;
// chiodini space (dimension)
int dim;
// chiodini alpha
int alfa;
// panel dimensions
int panelW, panelH;
// border weight
int linea;
// active color
color curColor;
// active color number
int colore;
// grid dimension
int gXmax, gYmax;
int gXmin, gYmin;
// grid current crow and column
int gX, gY;
// point grid current coords
int pX, pY;
// gridColor
color gridC;

// button red color
color redC;
// 3D effect flag
boolean treD;
// pick color flag
boolean pickColor;
// new drawing flag
boolean newyes;
// saved file flag
boolean savedFile;
// palette dimension
int palH = 90;


//******************************
// USER PALETTE
//******************************
color[] userPal = {#263C8B, #4E74A6, #BDBF78, #BFA524, #2E231F, #0F0B26, #522421, #8C5A2E, #BF8641, #B3B372, #4D7186, #284253, #E0542E, #F4A720, #EF8C12, #3C535E, #252D2A, #F9D882, #3F422E, #261901, #514264, #527E8E, #8DB0A7, #989A55, #255C3F};
//******************************
//******************************


// ********************
// SETUP FUNCTION
// ********************
void setup() 
{
//******************************
//       GRID DIMENSION  
//******************************
         size(900,700);
//******************************
//******************************

  smooth();
  // do not need a fast screen update
  frameRate(10);
  // initialization of variables
  initVars();  
  // set backgrounfd color
  background(backC);
  
// draw GUI buttons 
  drawButtons();
// draw GUI text  
  drawABC();
// draw GUI rainbow color palette  
  drawSpectrum();
// draw GUI user color palette  
  drawUserPalette();  

// *****************************************  
// load background image (dimension multiple of width and (height-100))
//  PImage backIMG;
//  backIMG = loadImage("back.png");
//  //transparence for image
//  tint(255,255,255,150);
//  image(img, 0, 0, width, height-100);
// *****************************************

//draw points of grid
  drawGrid(dim/2,width,height-panelH,dim);
  
//  noLoop();  
}

// ********************
// initVars FUNCTION
// ********************
void initVars() 
{
//******************************
//       CHIODINI DIMENSION
//******************************
         dim = 50;
//******************************
//******************************

  colorMode(RGB);
  tipo = 0;
  oldTipo = 0;  
  alfa = 255;
  panelW = width;
  panelH = 100;
  curColor = color(0,127,255);
  gridC = color(212,212,212,255);
//  backC = color(180,180,190,255);
  backC = color(230,230,230,255);  
  redC = color(240,10,10);
  colore = 0;
  gXmax = width/dim;
  gYmax = height/dim;
//  println(gXmax+" -  "+gYmax);
  gXmin = 0;
  gYmin = 0;
  linea = 1;
  treD = true;
  pickColor = false;
  newyes = false;
  savedFile = true;
  filename="";
}


// ********************
// DRAW FUNCTION
// ********************
void draw()
{  
  //************************
  // draw/update cursor type
  //************************
  // cursor
  cursor(ARROW);
  if (pickColor) { cursor(HAND); }
  if (!(pickColor) && (mouseY < height - panelH))
  { cursor(CROSS); }
  else if (!(pickColor) && (mouseY > height - panelH))
  { cursor(ARROW); }
  else if (pickColor)
  { cursor(HAND); }   
  
  //*******************************************
  // draw/update status of CURRENT COLOR
  //*******************************************  
  // current color
  rectMode(CENTER);
  strokeWeight(linea);
  stroke(0);
  fill(curColor);
  rect(width-30,height-panelH/2-2,30,30); 
  rectMode(CORNER);

  //***********************************
  // draw/update status of ERASE button
  //***********************************  
  // erase button
  if (tipo == 2)
  {
    stroke(redC);
    line(width-30+5,height-panelH/2-30-6,width-30-6,height-panelH/2-30+5);
    line(width-30-6,height-panelH/2-30-6,width-30+5,height-panelH/2-30+5);    
  } 
  else
  {
    rectMode(CENTER);
    strokeWeight(linea);
    stroke(0);
    fill(backC);
    rect(width-30,height-panelH/2-30,15,15);
    rectMode(CORNER);     
  }  

  //**********************************
  // draw/update status of PICK button
  //**********************************
  // pick button
  rectMode(CENTER);
  strokeWeight(linea);
  stroke(0);
  fill(backC);
  rect(width-30,height-panelH/2+28,15,15);
  fill(0);
  rect(width-30,height-panelH/2+28,9,9);  
  fill(255);
  if (pickColor)
  { 
    fill(redC); 
  }
  rect(width-30,height-panelH/2+28,5,5);
  rectMode(CORNER);  

  //************************************
  // draw/update status of CIRCLE button
  //***********************************+
  // circle button
  if (tipo == 0)
  {
    fill(redC);
    noStroke();
    ellipse(width-300,height-panelH/2-38,7,7);
    fill(backC);
    // erase square button red center
    ellipse(width-300,height-panelH/2-14,9,9);    
  }  
  
  //************************************
  // draw/update status of SQUARE button
  //***********************************+
  // square button
  if (tipo == 1)
  {
    fill(redC);
    noStroke();
    ellipse(width-300,height-panelH/2-14,7,7);
    fill(backC);
    // erase circle button red center
    ellipse(width-300,height-panelH/2-38,9,9);        
  }  

  //************************************
  // draw/update status of SAVE button
  //***********************************
  // NOTHING
  // changes are done by other function

  if (mousePressed == true)
  { 
    //println("mousepressed");
    //println(mouseX+" -  "+mouseY);      
  }  

}


// **********************
// timestamp FUNCTION
// **********************
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}



