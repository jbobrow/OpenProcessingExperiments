
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//Rachel Ciavarella
//Homework 7 game 
//to move character use w,a,s,d
//objective move orange character through maze to light green square
//don't walk off path or touch other characters
//finish as fast as possible
//sound credit freesoundfx.co.uk and freesounds.org

//global variables
Minim minim;
AudioPlayer sp, sbw, sbf, w;
float d2;
int f2y;
float f3x;
color col1;
color col2;
color col3;
color colbg;
color charcol;
color mzcol;
color fincol;
boolean collision = false;
int figx;
int figy;
int count;
boolean won = false;
boolean title = true;
boolean lost = false;


void setup()
{
  size(600, 600);
  minim = new Minim (this); 
  sp = minim.loadFile ("ptero.mp3");
  sbw = minim.loadFile ("bear1.mp3");
  sbf = minim.loadFile ("bear2.mp3");
  w = minim.loadFile ("walk.mp3");
  d2 = 30;
  f2y = 15; 
  f3x = 150;
  colbg = color(#A56D28);
  col1 = color (#B4B019);
  col2 = color (#5A0B12);
  col3 = color (#0F6226);
  charcol = color (#A02C0B);
  mzcol = color (#5D1E01);
  fincol = color(#5D8620);
  figx=55;
  figy=550;
}

//maze path user can only stay in maze path
void maze()
{
  noStroke();
  fill(mzcol);
  rect(40, 450, 70, 450);
  rect(70, 450, 500, 70);
  rect(420, 300, 150, 150);
  rect(20, 300, 500, 75);
  rect(20, 200, 55, 150);
  rect(20, 175, 250, 65);
  rect(420, 300, 150, 150);
  rect(150, 40, 120, 150);
  rect(220, 40, 380, 65);
  fill(fincol);
  rect(580, 40, 20, 65);
}

//first figure still figure user cant touch
void fig1()
{
  fill(col1);
  rect(480, 370, 30, 70);
}


//second figure wraping user can't touch
void fig2()
{
  fill(col2);
  ellipse(width-240, f2y, d2, d2);
  f2y = f2y+2;
  if (f2y > height)
  {
    f2y = -20;
  }
}
boolean forward= true;
//third figure bounce user cant touch
void fig3()
{
  fill(col3);
  rect(f3x, 105, 30, 70);
  if (f3x > 240)
  {
    forward= false;
  }
  if (f3x < 150) {
    forward= true;
  }
  if (forward) {
    f3x += 0.5;
  }
  else
  {
    f3x -= 0.5;
  }
}

//backgound user cant touch with figure
void backdrop()
{
  fill(colbg);
  rect(0, 0, 600, 600);
}

//character figure user can control
void figure()
{
  noStroke();
  fill(charcol);
  rect(figx, figy, 40, 40);

  if (key == 'w' )
  {
    figy -=2;
    w.play();
    w.rewind();
  }
  if (key == 's' )
  {
    figy +=2;
  }
  if (key == 'd' )
  {
    figx +=2;
  }
  if (key == 'a' )
  {
    figx -=2;
    w.play();
    w.rewind();
  }
}


void draw()
{
  if (title)
  {
    fill(200, 200, 200);
    rect(0, 0, screenWidth, screenHeight);
    fill(0);
    textAlign(CENTER);
    text("use 'W' 'A' 'S' 'D' to move orange charater through maze", width/2, height/2);
    textSize(20);
    text("Don't step outside of maze or touch other characters", width/2, height/2+40);
    text("reach light green zone to win", width/2, height/2+80);
    text("press 'g' to start...goodluck", width/2, height/2+120);
    if (key == 'g')
    {
      title = false;
    }
  }

  else if (!won)
  {  
    backdrop();
    maze();
    figure();
    fig1();
    fig2();
    fig3();
    //timer and counter
    text( count, width/2, height*.95);
    text( millis( )/1000, width/2, height*.93);
    collided();
    println(frameRate);
    if (count > 5)
    { 
      lost = true;
    }
  }
  else
  {
    fill(200, 0, 0);
    rect(0, 0, screenWidth, screenHeight);
    fill(0, 0, 0);
    textAlign(CENTER);
    textSize(50);
    text("YOU DA BEST", width/2, height/2);
    textSize(20);
    text("press 'space' to play again", width/2, height/2+40);
    text("lives used ="   +count, width/2, height/2+80);
    if (count < 1 && millis()/1000 < 30)
    {
      text("High score!!", width/2, height/2+120);
    }
    if (count < 3 && millis()/1000 < 50)
    {
      text("keep trying!!", width/2, height/2+120);
    }
    if (count < 5 && millis()/1000 < 100)
    {
      text("better luck next time!", width/2, height/2+120);
    }

    if (key == ' ') {
      won = false;
      textSize(15);
      figx = 55;
      figy = 550;
    }
    sbw.play();
  }

  if (lost)
  {
    fill(0);
    rect(0, 0, screenWidth, screenHeight);
    fill(255);
    textAlign(CENTER);
    text("you lost!!!", width/2, height/2);
    text("press 'h' to retry", width/2, height/2+30);
    if (key == 'h' )
    { 
      title = true;
      lost = false;
      count = 0;
      sbf.play();
      sbf.rewind();
    }
  }
} 
void collided()
{

  for (int x = 0; x < 40; x++) {
    // Loop through every pixel row
    for (int y = 0; y < 40; y++) {
      // Use the formula to find the 1D location
      color col = get( figx + x, figy + y);
      if (col != charcol && col != mzcol && col != charcol && col != fincol) { // If we are an even 
        println("collision found");
        sp.play();
        sp.rewind( );
        figx = 55;
        figy = 550;
        key = 'j';
        count ++;
      }
      else if (col == fincol)
        won = true;
    }
  }
}



