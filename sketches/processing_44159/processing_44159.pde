
//Homework 11 computing/arts/processing
//copyright Jessica Schafer, pittsburgh, pa
//Oct. 27, 2011
//leaf modelled on public domain image @ http://en.wikipedia.org/wiki/File:Orange_Maple_Leaf.svg

//LEAF GROUP variables
float x, y, z, zHold, deltax, deltay, deltaz, j;
//points for leaves
float [] xPercentages = {0, .062, .118, .094, .178, .195, .287, .262, .3, .15, .162, .013, .02 };
float[] yPercentages = {.324, .2186, .242, .069, .15, .104, .121, .018, .003, .13, .182, .167, .326 };
float [] zPercentages = {0, .037, .062, .055, .038, .033, .005, .013 };
float [] xw, yh, zw;
//COLORS
color moss = color (115, 96, 2);
color cream = color (247, 226, 147);
color scarlet = color (166, 3, 33);
color gold = color (242, 159, 5);
color marigold = color (242, 135, 5);
color orange = color (242, 92, 5);
//SLIDER variables
int bar1x, bar2x, bar3x, bary, barwid, barht;
float d1, rotateValue1;
float d2, rotateValue2;
float d3, rotateValue3;
//BUTTON variables
int button1x, button2x, buttonsy, buttonsdim;
float dbutton1, dbutton2;
//STATS variables
float distancex, distancey, distancez;


void setup ()
{
  size (500, 500, P3D);
  textMode(SCREEN);
  textSize(12);
  noStroke();
  xw = calculatePoints(xPercentages, width);
  yh = calculatePoints(yPercentages, height);
  zw = calculatePoints(zPercentages, width);
  x = width/2;
  y = height/2;
  z = 0;
  deltax = 0;
  deltay = 0;
  deltaz = 0;
  j = 1;
  bar1x = int(width*.05);
  bar2x = int(width*.35);
  bar3x = int(width*.65);
  bary = int (height*.05);
  barwid = int(width*.25);
  barht = int (height*.03);
  button1x = int(width*.9);
  button2x = int(width*.1);
  buttonsy = int(height*.93);
  buttonsdim = 35;
}

void draw ()
{
  setScreen();
  drawSlider(bar1x, rotateValue1);
  drawSlider(bar2x, rotateValue2);
  drawSlider(bar3x, rotateValue3);
  drawButton(button1x, scarlet);
  drawButton(button2x, moss);
  checkMouseLocation();
  showStats();
  rotateLeaves(); 
  drawLeaves();
  moveLeaves();
}


//TEXT
void showStats()
{
  String speed = "Speed (pix/frm):\n    X: "+int(deltax)+"\n    Y: "+int(deltay)+"\n    Z: "+int(deltaz);
  fill(scarlet);
  text (speed, int(width*.6), buttonsy-25); 
  
  String distance = "Distance travelled (pix):\nLeft/Right: "+int(distancex)+"\nUp/Down: "+int(distancey)+"\nBackward/Forward: "+int(distancez);
  fill(moss);
  text (distance, int(width*.2), buttonsy-25);
  
  fill(0);
  text ("STOP", button1x-15, buttonsy-25);
  text("RESET", button2x-15, buttonsy-25);
  
  String rotationY = "Y axis rotation: "+int(rotateValue2)+ "°";
    text(rotationY, bar2x+5, bary-10);
  String rotationX = "X axis rotation: "+int(rotateValue1)+ "°";
    text(rotationX, bar1x+5, bary-10);
  String rotationZ = "Z axis rotation: "+int(rotateValue3)+ "°";
    text(rotationZ, bar3x+5, bary-10);
    
  noFill();
}

//BUTTONS
void drawButton(int x, color a)
{
  strokeWeight(3);
  stroke(a);
  fill(100);
  ellipse(x, buttonsy, buttonsdim, buttonsdim);
  noStroke();
}

// SLIDERS
void drawSlider(int a, float rotateValue)
{
  noStroke();
    fill (0);
    rect (a, bary, barwid, barht);   
  stroke (gold);
    strokeWeight(3);
    float x = map (rotateValue, -360, 360, a, a+barwid);
    line (x, bary-3, x, bary+barht+3);
 strokeWeight(1);
}

//ROTATION VIA SLIDERS AND BUTTON ACTION
void checkMouseLocation()
{
 d1 = dist (bar1x+barwid/2, bary+barht/2, mouseX, mouseY);
  if (mousePressed && d1 <=barwid/2 && mouseY >= bary && mouseY <=bary+barwid)
   {
     rotateValue1 = mapMouse(bar1x, bary, barwid);
   }
  
 d2 = dist (bar2x+barwid/2, bary+barht/2, mouseX, mouseY);
  if (mousePressed && d2 <=barwid/2 && mouseY >= bary && mouseY <=bary+barwid)
   {
     rotateValue2 = mapMouse(bar2x, bary, barwid);
   }
  
  d3 = dist (bar3x+barwid/2, bary+barht/2, mouseX, mouseY);
  if (mousePressed && d3 <=barwid/2 && mouseY >= bary && mouseY <=bary+barwid)
   {
     rotateValue3 = mapMouse(bar3x, bary, barwid);
   } 
   
  dbutton1 = dist(button1x, buttonsy, mouseX, mouseY);
   if (mousePressed && dbutton1 <= buttonsdim/2)
    {
      drawButton(button1x, marigold);
      stopAll(); 
    }
   
   dbutton2 =dist(button2x, buttonsy, mouseX, mouseY);
    if (mousePressed && dbutton2 <= buttonsdim/2)
     {
      drawButton(button2x, marigold);
      resetAll(); 
     }
}

float mapMouse (int x, int y, int wid)
{
  float rotValue = (map(mouseX, x, x+wid, -360, 360));
  if (rotValue <-360)
    {rotValue = -360;}
  else if (rotValue > 360)
    {rotValue = 360;}
  return rotValue;
}

//ROTATE (contains critical translation for leaf group to keep draw clean)
void rotateLeaves()
{
  translate (x, y, z);
    rotateX(radians(rotateValue1));
    rotateY(radians(rotateValue2));
    rotateZ(radians(rotateValue3));
}

//BASIC MOVEMENT
void moveLeaves()
{
  x = x + deltax;
  distancex = x-(width/2);
  y = y + deltay;
  distancey = y-(height/2);
  z = z + deltaz;
  distancez = z;
}

//ALL KEYBOARD COMMANDS:
void keyReleased()
{
  if (keyCode == UP)
   {deltay = deltay -j;}
   else if (keyCode == DOWN)
    {deltay = deltay + j;}
   else if (keyCode == LEFT)
    {deltax = deltax - j;}
   else if (keyCode == RIGHT)
    {deltax = deltax + j;}
   else if (keyCode == 'A')
    {deltaz = deltaz -j;}
   else if (keyCode == 'C')
    {deltaz = deltaz +j;} 
   else if (keyCode == 'S')
    {stopAll();}
   else if (keyCode == ' ')
    { resetAll(); }
   else if (keyCode == 'Z')
   { zHold = z;
     z = -500;}
   else if (keyCode == 'X')
   { z = zHold;}
}

//RESET
void resetAll()
{
  x = width/2;
  y = height/2;
  z = 0;
  deltax = 0;
  deltay = 0;
  deltaz = 0;
  rotateValue1 = 0;
  rotateValue2 = 0;
  rotateValue3 = 0;
}

//STOP 
void stopAll()
{
  deltax = 0;
  deltay = 0;
  deltaz = 0;
}

//THE LEAVES
void drawLeaves()
{
  pushMatrix();
    fill(scarlet);
    scale(.60);
    translate (0, .1*height, .05*width);
    drawLeaf(); 
  popMatrix();
  
  pushMatrix();
    fill(gold);
    scale(.75);
    rotateX(radians(15));
    rotateZ(radians(340));
    translate (-.1*width, 0, -.05*width);
    drawLeaf();
  popMatrix();
 
 pushMatrix();
    fill(orange);
    scale(.75);
    rotateX(radians(15));
    rotateZ(radians(20));
    translate (.1*width, 0, -.1*width);
    drawLeaf();
  popMatrix(); 
  
  pushMatrix();
    fill(marigold);
    rotateX(radians(15));
    rotateZ(radians(30));
    translate (.1*width, -.1*height, -.15*width);
    drawLeaf();
  popMatrix(); 
  
  pushMatrix();
    fill(moss);
    rotateX(radians(15));
    rotateZ(radians(330));
    translate (-.1*width, -.1*height, -.25*width);
    drawLeaf();
  popMatrix(); 
}

void drawLeaf()
{
  beginShape();
  vertex (xw[12], yh[12], zw[0]); //a
  vertex (xw[11], yh[11], zw[0]); //b
  vertex (xw[10], yh[10], zw[0]); //c
  vertex (xw[9], yh[9], zw[0]); //d
  vertex (xw[8], yh[8], zw[0]); //e
  vertex (xw[7], -1*yh[7], zw[7]); //f
  vertex (xw[6], -1*yh[6], zw[6]); //g
  vertex (xw[5], -1*yh[5], zw[5]); //h
  vertex (xw[4], -1*yh[4], zw[4]); //i
  vertex (xw[3], -1*yh[3], zw[3]); //j
  vertex (xw[2], -1*yh[2], zw[2]); //k
  vertex (xw[1], -1*yh[1], zw[1]); //l
  vertex (xw[0], -1*yh[0], zw[0]); //m
  vertex (-1*xw[1], -1*yh[1], -1*zw[1]); //n
  vertex (-1*xw[2], -1*yh[2], -1*zw[2]); //o
  vertex (-1*xw[3], -1*yh[3], -1*zw[3]); //p
  vertex (-1*xw[4], -1*yh[4], -1*zw[4]); //q
  vertex (-1*xw[5], -1*yh[5], -1*zw[5]); //r
  vertex (-1*xw[6], -1*yh[6], -1*zw[6]); //s
  vertex (-1*xw[7], -1*yh[7], -1*zw[7]); //t
  vertex (-1*xw[8], yh[8], zw[0]); //u
  vertex (-1*xw[9], yh[9], zw[0]); //v
  vertex (-1*xw[10], yh[10], zw[0]); //w
  vertex (-1*xw[11], yh[11], zw[0]); //x
  vertex (-1*xw[12], yh[12], zw[0]); //y
  endShape(CLOSE);
}

float [] calculatePoints (float [] a, int dimension)
{
  float[] temp = {};
  for (int i=0; i<a.length; i++)
   {
    temp = append (temp, a[i]*dimension); 
   }
  return temp;
}

//SET THE STAGE @ TOP OF DRAW()
void setScreen()
{
  background (cream);
  pointLight (255, 255, 255, 0, 0, width);
}

