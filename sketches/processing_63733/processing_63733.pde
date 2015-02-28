
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

AudioPlayer Circle;
AudioPlayer C;
AudioPlayer G1;
AudioPlayer D2;
AudioPlayer A3;
AudioPlayer E4;
AudioPlayer B5;
AudioPlayer Cb7;
AudioPlayer F6;
AudioPlayer Gb6;
AudioPlayer Db5;
AudioPlayer Csh7;
AudioPlayer Ab4;
AudioPlayer Eb3;
AudioPlayer Bb2;
AudioPlayer F1;
Minim minim;


PImage Circlemain, CircleC, CircleG1, CircleD2, CircleA3,
CircleE4, CircleA4, CircleE3, CircleB2, CircleF1, CircleB5,
CircleC7, CircleF6, CircleG6, CircleC7sh, CircleD5, title,
Circleexp, Continuemes, Behind;


boolean isCircleC = false;
boolean isCircleG1 = false;
boolean isCircleD2 = false;
boolean isCircleA3 = false;
boolean isCircleE4 = false;
boolean isCircleA4 = false;
boolean isCircleE3 = false;
boolean isCircleB2 = false;
boolean isCircleF1 = false;
boolean isCircleB5 = false;
boolean isCircleC7 = false;
boolean isCircleF6 = false;
boolean isCircleG6 = false;
boolean isCircleC7sh = false;
boolean isCircleD5 = false;
boolean isTitle = false;


boolean overCircleC = false;
boolean overCircleG1 = false;
boolean overCircleD2 = false;
boolean overCircleA3 = false;
boolean overCircleE4 = false;
boolean overCircleA4 = false;
boolean overCircleE3 = false;
boolean overCircleB2 = false;
boolean overCircleF1 = false;
boolean overCircleB5 = false;
boolean overCircleC7 = false;
boolean overCircleF6 = false;
boolean overCircleG6 = false;
boolean overCircleC7sh = false;
boolean overCircleD5 = false;
boolean overTitle = false;


int gridSize = 100;
int x, y;

int titlebuttonX, titlebuttonY; //title button
int CbuttonX, CbuttonY;    // C  button
int G1buttonX, G1buttonY;  // G1 button
int D2buttonX, D2buttonY;  // D2 button 
int A3buttonX, A3buttonY;  // A3 button
int E4buttonX, E4buttonY;  // E4 button
int B5buttonX, B5buttonY;  // B5 button
int C7buttonX, C7buttonY;  // C7 button
int F6buttonX, F6buttonY;  // F6 button
int G6buttonX, G6buttonY;  // G6 button
int C7shbuttonX, C7shbuttonY;  // C7 Sharp button
int D5buttonX, D5buttonY;  // D5 button
int A4buttonX, A4buttonY;  // A4 button
int E3buttonX, E3buttonY;  // E3 button
int B2buttonX, B2buttonY;  // B2 button
int F1buttonX, F1buttonY;  // F1 button


int titleSize = 200;
int CbuttonSize = 90;
int G1buttonSize = 90;
int D2buttonSize = 90;
int A3buttonSize = 90;
int E4buttonSize = 90;
int B5buttonSize = 60;
int C7buttonSize = 60;
int F6buttonSize = 60;
int G6buttonSize = 60;
int C7shbuttonSize = 60;
int D5buttonSize = 60;
int A4buttonSize = 90;
int E3buttonSize = 90;
int B2buttonSize = 90;
int F1buttonSize = 90;
int CircleexpSize =670;
int CexpSize = 670;
int G1expSize1 = 670;
int D2expSize = 670;
int A3expSize = 670;
int ContinuemesSize = 300;
int BehindSize = 100;
int BehindSize2 = 70;

void setup() 
{
  size(1200,800);
  smooth();
  frameRate(10);
  
  imageMode(CENTER);
  
  int x = 5;
  int y = 5;
  
  Circlemain = loadImage("Circlemain.png");
  
  // Music 
  minim = new Minim (this);

  Circle = minim.loadFile("Circle.mp3");
  C = minim.loadFile("C.mp3");
  G1 = minim.loadFile("G1.mp3");
  D2 = minim.loadFile("D2.mp3");
  A3 = minim.loadFile("A3.mp3");
  E4 = minim.loadFile("E4.mp3");
  B5 = minim.loadFile("B5.mp3");
  Cb7 = minim.loadFile("Cb7.mp3");
  F6 = minim.loadFile("F6.mp3");
  Gb6 = minim.loadFile("Gb6.mp3");
  Db5 = minim.loadFile("Db5.mp3");
  Csh7 = minim.loadFile("Csh7.mp3");
  Ab4 = minim.loadFile("Ab4.mp3");
  Eb3 = minim.loadFile("Eb3.mp3");
  Bb2 = minim.loadFile("Bb2.mp3");
  F1 = minim.loadFile("F1.mp3");
  
  
  // Botton X position
  titlebuttonX = 100;
  CbuttonX = 598;
  G1buttonX = 755;
  D2buttonX = 863; 
  A3buttonX = 914;
  E4buttonX = 863;
  B5buttonX = 776;
  C7buttonX = 750;
  F6buttonX = 614;
  G6buttonX = 588;
  C7shbuttonX = 468;
  D5buttonX = 442;
  A4buttonX = 335;
  E3buttonX = 293;
  B2buttonX = 330;
  F1buttonX = 425;
  
  // Button Y position
  
  titlebuttonY = 120;
  CbuttonY = 100;
  G1buttonY = 138;
  D2buttonY = 235; 
  A3buttonY = 398;
  E4buttonY = 563;
  B5buttonY = 660;
  C7buttonY = 750;
  F6buttonY = 685;
  G6buttonY = 775;
  C7shbuttonY = 660;
  D5buttonY = 750;
  A4buttonY = 550;
  E3buttonY = 398;
  B2buttonY = 247;
  F1buttonY = 145;
  
  // Load Buttons
  
  title = loadImage("title.png");
  CircleC = loadImage("CircleC.png");
  CircleG1 = loadImage("CircleG1.png");
  CircleD2 = loadImage("CircleD2.png");
  CircleA3 = loadImage("CircleA3.png");
  CircleE4 = loadImage("CircleE4.png");
  CircleA4 = loadImage("CircleA4.png");
  CircleE3 = loadImage("CircleE3.png");
  CircleB2 = loadImage("CircleB2.png");
  CircleF1 = loadImage("CircleF1.png");
  CircleB5 = loadImage("CircleB5.png");
  CircleC7 = loadImage("Circle7sh.png");
  CircleF6 = loadImage("CircleF6.png");
  CircleG6 = loadImage("CircleG6.png");
  CircleC7sh = loadImage("CircleC7.png");
  CircleD5 = loadImage("CircleD5.png");

// Load explinations
  
  Circleexp = loadImage("Circleexp.png");
  Continuemes = loadImage("Continuemessage.png");

// Behind functions
   Behind = loadImage("Behind.png");
  
background(0,0,0);  
image(Circlemain, 600, 400);
}

void draw()
{
  image(title, titlebuttonX, titlebuttonY, titleSize, titleSize);
  image(CircleC, CbuttonX, CbuttonY, CbuttonSize, CbuttonSize);
  image(CircleG1, G1buttonX, G1buttonY, G1buttonSize, G1buttonSize);
  image(CircleD2, D2buttonX, D2buttonY, D2buttonSize, D2buttonSize);
  image(CircleA3, A3buttonX, A3buttonY, A3buttonSize, A3buttonSize);
  image(CircleE4, E4buttonX, E4buttonY, E4buttonSize, E4buttonSize);
  image(CircleA4, A4buttonX, A4buttonY, A4buttonSize, A4buttonSize);
  image(CircleE3, E3buttonX, E3buttonY, E3buttonSize, E3buttonSize);
  image(CircleB2, B2buttonX, B2buttonY, B2buttonSize, B2buttonSize);
  image(CircleF1, F1buttonX, F1buttonY, F1buttonSize, F1buttonSize);
  image(CircleB5, B5buttonX, B5buttonY, B5buttonSize, B5buttonSize);
  image(CircleC7, C7buttonX, C7buttonY, C7buttonSize, C7buttonSize);
  image(CircleF6, F6buttonX, F6buttonY, F6buttonSize, F6buttonSize);
  image(CircleG6, G6buttonX, G6buttonY, G6buttonSize, G6buttonSize);
  image(CircleC7sh, C7shbuttonX, C7shbuttonY, C7shbuttonSize, C7shbuttonSize);
  image(CircleD5, D5buttonX, D5buttonY, D5buttonSize, D5buttonSize);
  

}

void update(int x, int y)
{
  if (overCircleC(CbuttonX, CbuttonY, CbuttonSize)) {
    isCircleC = true;
    isCircleG1 = false;
    isCircleD2 = false;
    isCircleA3 = false;
    isCircleE4 = false;
    isCircleA4 = false;
    isCircleE3 = false;
    isCircleB2 = false;
    isCircleF1 = false;
    isCircleB5 = false;
    isCircleC7 = false;
    isCircleF6 = false;
    isCircleG6 = false;
    isCircleC7sh = false;
    isCircleD5 = false;
    isTitle = false;

  }
  else if (overCircleG1(G1buttonX, G1buttonY, G1buttonSize)) {
    isCircleC = false;
    isCircleG1 = true;
    isCircleD2 = false;
    isCircleA3 = false;
    isCircleE4 = false;
    isCircleA4 = false;
    isCircleE3 = false;
    isCircleB2 = false;
    isCircleF1 = false;
    isCircleB5 = false;
    isCircleC7 = false;
    isCircleF6 = false;
    isCircleG6 = false;
    isCircleC7sh = false;
    isCircleD5 = false;
    isTitle = false;

   }
  else if (overCircleD2(D2buttonX, D2buttonY, D2buttonSize)) {
    isCircleC = false;
    isCircleG1 = false;
    isCircleD2 = true;
    isCircleA3 = false;
    isCircleE4 = false;
    isCircleA4 = false;
    isCircleE3 = false;
    isCircleB2 = false;
    isCircleF1 = false;
    isCircleB5 = false;
    isCircleC7 = false;
    isCircleF6 = false;
    isCircleG6 = false;
    isCircleC7sh = false;
    isCircleD5 = false;
    isTitle = false;

  } 
   else if (overCircleA3(A3buttonX, A3buttonY, A3buttonSize)) {
    isCircleC = false;
    isCircleG1 = false;
    isCircleD2 = false;
    isCircleA3 = true;
    isCircleE4 = false;
    isCircleA4 = false;
    isCircleE3 = false;
    isCircleB2 = false;
    isCircleF1 = false;
    isCircleB5 = false;
    isCircleC7 = false;
    isCircleF6 = false;
    isCircleG6 = false;
    isCircleC7sh = false;
    isCircleD5 = false; 
    isTitle = false;
 
   }
   else if (overCircleE4(E4buttonX, E4buttonY, E4buttonSize)) {
    isCircleC = false;
    isCircleG1 = false;
    isCircleD2 = false;
    isCircleA3 = false;
    isCircleE4 = true;
    isCircleA4 = false;
    isCircleE3 = false;
    isCircleB2 = false;
    isCircleF1 = false;
    isCircleB5 = false;
    isCircleC7 = false;
    isCircleF6 = false;
    isCircleG6 = false;
    isCircleC7sh = false;
    isCircleD5 = false;
    isTitle = false; 

   }
   else if (overCircleA4(A4buttonX, A4buttonY, A4buttonSize)) {
    isCircleC = false;
    isCircleG1 = false;
    isCircleD2 = false;
    isCircleA3 = false;
    isCircleE4 = false;
    isCircleA4 = true;
    isCircleE3 = false;
    isCircleB2 = false;
    isCircleF1 = false;
    isCircleB5 = false;
    isCircleC7 = false;
    isCircleF6 = false;
    isCircleG6 = false;
    isCircleC7sh = false;
    isCircleD5 = false; 
    isTitle = false;

   }
   else if (overCircleE3(E3buttonX, E3buttonY, E3buttonSize)) {
    isCircleC = false;
    isCircleG1 = false;
    isCircleD2 = false;
    isCircleA3 = false;
    isCircleE4 = false;
    isCircleA4 = false;
    isCircleE3 = true;
    isCircleB2 = false;
    isCircleF1 = false;
    isCircleB5 = false;
    isCircleC7 = false;
    isCircleF6 = false;
    isCircleG6 = false;
    isCircleC7sh = false;
    isCircleD5 = false; 
    isTitle = false;

   }
   else if (overCircleB2(B2buttonX, B2buttonY, B2buttonSize)) {
    isCircleC = false;
    isCircleG1 = false;
    isCircleD2 = false;
    isCircleA3 = false;
    isCircleE4 = false;
    isCircleA4 = false;
    isCircleE3 = false;
    isCircleB2 = true;
    isCircleF1 = false;
    isCircleB5 = false;
    isCircleC7 = false;
    isCircleF6 = false;
    isCircleG6 = false;
    isCircleC7sh = false;
    isCircleD5 = false;
    isTitle = false;

   }
   else if (overCircleF1(F1buttonX, F1buttonY, F1buttonSize)) {
    isCircleC = false;
    isCircleG1 = false;
    isCircleD2 = false;
    isCircleA3 = false;
    isCircleE4 = false;
    isCircleA4 = false;
    isCircleE3 = false;
    isCircleB2 = false;
    isCircleF1 = true;
    isCircleB5 = false;
    isCircleC7 = false;
    isCircleF6 = false;
    isCircleG6 = false;
    isCircleC7sh = false;
    isCircleD5 = false;

   }
   else if (overCircleB5(B5buttonX, B5buttonY, B5buttonSize)) {
    isCircleC = false;
    isCircleG1 = false;
    isCircleD2 = false;
    isCircleA3 = false;
    isCircleE4 = false;
    isCircleA4 = false;
    isCircleE3 = false;
    isCircleB2 = false;
    isCircleF1 = false;
    isCircleB5 = true;
    isCircleC7 = false;
    isCircleF6 = false;
    isCircleG6 = false;
    isCircleC7sh = false;
    isCircleD5 = false;
    isTitle = false;

   }
   else if (overCircleC7(C7buttonX, C7buttonY, C7buttonSize)) {
    isCircleC = false;
    isCircleG1 = false;
    isCircleD2 = false;
    isCircleA3 = false;
    isCircleE4 = false;
    isCircleA4 = false;
    isCircleE3 = false;
    isCircleB2 = false;
    isCircleF1 = false;
    isCircleB5 = false;
    isCircleC7 = true;
    isCircleF6 = false;
    isCircleG6 = false;
    isCircleC7sh = false;
    isCircleD5 = false;
    isTitle = false;
   }
   else if (overCircleF6(F6buttonX, F6buttonY, F6buttonSize)) {
    isCircleC = false;
    isCircleG1 = false;
    isCircleD2 = false;
    isCircleA3 = false;
    isCircleE4 = false;
    isCircleA4 = false;
    isCircleE3 = false;
    isCircleB2 = false;
    isCircleF1 = false;
    isCircleB5 = false;
    isCircleC7 = false;
    isCircleF6 = true;
    isCircleG6 = false;
    isCircleC7sh = false;
    isCircleD5 = false;
    isTitle = false;
   }
   else if (overCircleG6(G6buttonX, G6buttonY, G6buttonSize)) {
    isCircleC = false;
    isCircleG1 = false;
    isCircleD2 = false;
    isCircleA3 = false;
    isCircleE4 = false;
    isCircleA4 = false;
    isCircleE3 = false;
    isCircleB2 = false;
    isCircleF1 = false;
    isCircleB5 = false;
    isCircleC7 = false;
    isCircleF6 = false;
    isCircleG6 = true;
    isCircleC7sh = false;
    isCircleD5 = false;
    isTitle = false;
   }
   else if (overCircleC7sh(C7shbuttonX, C7shbuttonY, C7shbuttonSize)) {
    isCircleC = false;
    isCircleG1 = false;
    isCircleD2 = false;
    isCircleA3 = false;
    isCircleE4 = false;
    isCircleA4 = false;
    isCircleE3 = false;
    isCircleB2 = false;
    isCircleF1 = false;
    isCircleB5 = false;
    isCircleC7 = false;
    isCircleF6 = false;
    isCircleG6 = false;
    isCircleC7sh = true;
    isCircleD5 = false;
    isTitle = false;
   }
   else if (overCircleD5(D5buttonX, D5buttonY, D5buttonSize)) {
    isCircleC = false;
    isCircleG1 = false;
    isCircleD2 = false;
    isCircleA3 = false;
    isCircleE4 = false;
    isCircleA4 = false;
    isCircleE3 = false;
    isCircleB2 = false;
    isCircleF1 = false;
    isCircleB5 = false;
    isCircleC7 = false;
    isCircleF6 = false;
    isCircleG6 = false;
    isCircleC7sh = false;
    isCircleD5 = true;
    isTitle = false;

   }
   else if (overTitle(titlebuttonX, titlebuttonY, titleSize)) {
    isCircleC = false;
    isCircleG1 = false;
    isCircleD2 = false;
    isCircleA3 = false;
    isCircleE4 = false;
    isCircleA4 = false;
    isCircleE3 = false;
    isCircleB2 = false;
    isCircleF1 = false;
    isCircleB5 = false;
    isCircleC7 = false;
    isCircleF6 = false;
    isCircleG6 = false;
    isCircleC7sh = false;
    isCircleD5 = false;
    isTitle = true;

   }
}

void mousePressed()
{
  update(mouseX, mouseY);
}
/* int x = buttonX
 * int y = buttonY
 * int diameter = buttonsize
 */
boolean overCircleC(int x, int y, int diameter)
{
  println("x = " + x + " y = " + y + " diam =" + diameter);
  println("mousex = " + mouseX + " mousey = " + mouseY);

  if (mousePressed && (mouseX <= (x+(diameter)) && mouseX > x-diameter)
  && (mouseY <= (y+(diameter)) && mouseY > y-diameter))
{  

  C.cue(0);
  C.play();
  image(Behind, 603, 78, BehindSize, BehindSize);
 // image(Cexp, 600, 400);
  overCircleC = true;
    return true;
  }
    else {
      overCircleC = false;
      return false;
    }
  }
boolean overCircleG1(int x, int y, int diameter)
{
  if (mousePressed && (mouseX <= (x+(diameter)) && mouseX > x-diameter)
  && (mouseY <= (y+(diameter)) && mouseY > y-diameter))
  {
    G1.cue(0);
    G1.play();
    image(Behind, 755, 120, BehindSize, BehindSize);
 
    overCircleG1 = true;
    return true;
    
  }
    else
    {
      overCircleG1 = false;
      return false;
    }
  }
  
boolean overCircleD2(int x, int y, int diameter)
{
  if (mousePressed && (mouseX <= (x+(diameter)) && mouseX > x-diameter)
  && (mouseY <= (y+(diameter)) && mouseY > y-diameter))
  {
    D2.cue(0);
    D2.play();
    image(Behind, 865, 220, BehindSize, BehindSize);    

    overCircleD2 = true;
    return true;
  }
    else
    {
      overCircleD2 = false;
      return false;
    }
  }
boolean overCircleA3(int x, int y, int diameter)
{
  if (mousePressed && (mouseX <= (x+(diameter)) && mouseX > x-diameter)
  && (mouseY <= (y+(diameter)) && mouseY > y-diameter))
  {
    A3.cue(0);
    A3.play();
    image(Behind, 913, 385, BehindSize, BehindSize);

    overCircleA3 = true;
    return true;
  }
    else
    {
      overCircleA3 = false;
      return false;
    }
  }  
boolean overCircleE4(int x, int y, int diameter)
{
  if (mousePressed && (mouseX <= (x+(diameter)) && mouseX > x-diameter)
  && (mouseY <= (y+(diameter)) && mouseY > y-diameter))
  {
    E4.cue(0);
    E4.play();
    image(Behind, 865, 552, BehindSize, BehindSize);
    overCircleE4 = true;
    return true;
  }
    else
    {
      overCircleE4 = false;
      return false;
    }
  }
boolean overCircleA4(int x, int y, int diameter)
{
  if (mousePressed && (mouseX <= (x+(diameter)) && mouseX > x-diameter)
  && (mouseY <= (y+(diameter)) && mouseY > y-diameter))
  {
    Ab4.cue(0);
    Ab4.play();
    image(Behind, 335, 545, BehindSize, BehindSize);
    overCircleA4 = true;
    return true;
  }
    else
    {
      overCircleA4 = false;
      return false;
    }
  }
boolean overCircleE3(int x, int y, int diameter)
{
  if (mousePressed && (mouseX <= (x+(diameter)) && mouseX > x-diameter)
  && (mouseY <= (y+(diameter)) && mouseY > y-diameter))
  {
    Eb3.cue(0);
    Eb3.play();
    image(Behind, 293, 388, BehindSize, BehindSize);
    overCircleE3 = true;
    return true;
  }
    else
    {
      overCircleE3 = false;
      return false;
    }
  }
boolean overCircleB2(int x, int y, int diameter)
{
  if (mousePressed && (mouseX <= (x+(diameter)) && mouseX > x-diameter)
  && (mouseY <= (y+(diameter)) && mouseY > y-diameter))
  {
    Bb2.cue(0);
    Bb2.play();
    image(Behind, 330, 240, BehindSize, BehindSize);
    overCircleB2 = true;
    return true;
  }
    else
    {
      overCircleB2 = false;
      return false;
    }
  }
boolean overCircleF1(int x, int y, int diameter)
{
  if (mousePressed && (mouseX <= (x+(diameter)) && mouseX > x-diameter)
  && (mouseY <= (y+(diameter)) && mouseY > y-diameter))
  {
    F1.cue(0);
    F1.play();
    image(Behind, 427, 132, BehindSize, BehindSize);
    overCircleF1 = true;
    return true;
  }
    else
    {
      overCircleF1 = false;
      return false;
    }
  }
boolean overCircleB5(int x, int y, int diameter)
{
  if (mousePressed && (mouseX <= (x+(diameter)) && mouseX > x-diameter)
  && (mouseY <= (y+(diameter)) && mouseY > y-diameter))
  {
    B5.cue(0);
    B5.play();
    image(Behind, 777, 652, BehindSize2, BehindSize2);
    overCircleB5 = true;
    return true;
  }
    else
    {
      overCircleB5 = false;
      return false;
    }
  }
boolean overCircleC7(int x, int y, int diameter)
{
  if (mousePressed && (mouseX <= (x+(diameter)) && mouseX > x-diameter)
  && (mouseY <= (y+(diameter)) && mouseY > y-diameter))
  {
    Cb7.cue(0);
    Cb7.play();
    image(Behind, 750, 747, BehindSize2, BehindSize2);
    overCircleC7 = true;
    return true;
  }
    else
    {
      overCircleC7 = false;
      return false;
    }
  }
boolean overCircleF6(int x, int y, int diameter)
{
  if (mousePressed && (mouseX <= (x+(diameter)) && mouseX > x-diameter)
  && (mouseY <= (y+(diameter)) && mouseY > y-diameter))
  {
    F6.cue(0);
    F6.play();
    image(Behind, 613, 680, BehindSize2, BehindSize2);
    overCircleF6 = true;
    return true;
  }
    else
    {
      overCircleF6 = false;
      return false;
    }
  }
boolean overCircleG6(int x, int y, int diameter)
{
  if (mousePressed && (mouseX <= (x+(diameter)) && mouseX > x-diameter)
  && (mouseY <= (y+(diameter)) && mouseY > y-diameter))
  {
    Gb6.cue(0);
    Gb6.play();
    image(Behind, 587, 770, BehindSize2, BehindSize2);
    overCircleG6 = true;
    return true;
  }
    else
    {
      overCircleG6 = false;
      return false;
    }
  }
  boolean overCircleC7sh(int x, int y, int diameter)
{
  if (mousePressed && (mouseX <= (x+(diameter)) && mouseX > x-diameter)
  && (mouseY <= (y+(diameter)) && mouseY > y-diameter))
  {
    Csh7.cue(0);
    Csh7.play();
    image(Behind, 467, 655, BehindSize2, BehindSize2);
    overCircleC7sh = true;
    return true;
  }
    else
    {
      overCircleC7sh = false;
      return false;
    }
  }
boolean overCircleD5(int x, int y, int diameter)
{
  if (mousePressed && (mouseX <= (x+(diameter)) && mouseX > x-diameter)
  && (mouseY <= (y+(diameter)) && mouseY > y-diameter))
  {
    Db5.cue(0);
    Db5.play();
    image(Behind, 443, 747, BehindSize2, BehindSize2);
    overCircleD5 = true;
    return true;
  }
    else
    {
      overCircleD5 = false;
      return false;
    }
  }
boolean overTitle(int x, int y, int diameter)
{
  if (mousePressed && (mouseX <= (x+(diameter)) && mouseX > x-diameter)
  && (mouseY <= (y+(diameter)) && mouseY > y-diameter))
  {
   
    Circle.cue(0);
    Circle.play();
    image(Circleexp, 600,400);
    image(Behind, 100, 100, BehindSize, BehindSize);
    image(Continuemes, 1100, 100, ContinuemesSize, ContinuemesSize);
    overTitle = true;
    return true;
  }
    else
    {
      overTitle = false;
      return false;  

 
    }
}

  void stop()
  {
    Circle.close();
    C.close();
    G1.close();
    D2.close();
    A3.close();
    E4.close();
    B5.close();
    Cb7.close();
    F6.close();
    Gb6.close();
    Db5.close();
    Csh7.close();
    Ab4.close();
    Eb3.close();
    Bb2.close();
    F1.close();
    minim.stop();
    
    super.stop();
    
  }

