
//=========================
// SETUP
//=========================
 
size (400, 400);//canvas size
smooth ();//smooth objects
background (0);//background black
noStroke();//no stroke on circles
 
//variables for position and width. inc is for remembering the last colour
//-------------------------
int x = 70;
int y = 60;
int cwidth = 450;
int inc = 100;
int va = 20;//the variance in steps (size and position) higher = more intense
 
//=========================
// DRAW
//=========================
 
for (int i = 0; i < 100; i = i + 5)
{
  //randomize the size and position of the circle
  //---------------------------------------------
  x = x + int(random(-va,va));
  y = y + int(random(-va,va));
  cwidth = cwidth + int(random(-2*va,0));
 
  //get lighter and lighter
  //-----------------------
  fill (202 - 2 * inc, 100 - inc, 10 - inc/10);
  inc = inc - 5;
 
  //draw circle
  //-----------
  ellipse (x, y, cwidth, cwidth);
}
 
//=========================
 
                                            
