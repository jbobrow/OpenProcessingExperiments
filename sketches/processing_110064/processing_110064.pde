
// HW #5
// Written by Mark Choi
// Andrew ID: mschoi
// © Mark Choi September 2013 Pittsburgh, Pa 15213  All Rights reserved

// Mousemovement control's Jim's hair. Don't make Jim go bald. You never know what he might do!!!
// Mouse Click will draw a new Jim in that location. Scaled according to X position. 

// initial variables
float x, y, wd, ht;
float radius1 = wd*4/5;
float radius2 = wd*4/5;

void setup()
{
  size(400, 400);
  rectMode(CENTER);
  x = 100;
  y = 100;
  ht = 2*y;
  wd = 2*x;
}

void draw()
{
  if ( mouseY < y*.8) //background color
    {
        background(240, 90, 50);
    }
  else
    {
        background(120,160,200);
    }

// ear
   noStroke ();
   fill( 255, 200, 185 );
   beginShape();
   vertex(x+wd*.1, y+ht*.4);
   bezierVertex(x-wd*.05, y+ht*.45, x-wd*.05, y+ht*.55, x+wd*.1, y+ht*.6);
   endShape();

// face 
    ellipse(x+wd/2,y+ht/2,wd*.9,ht*.9);

// glasses
  if ( mouseY < y*.8)
    {
        fill(random(255),random(255),random(255));
        frameRate(15);
    }
  else
    {
        fill( 164, 248, 255);
    }
    
  stroke(200);
  strokeWeight(2);
  rect( x+wd*.37, y+ht*.52, wd*.28, ht*.2, 0, 0, 20, 20); 
  rect( x+wd*.75, y+ht*.52, wd*.28, ht*.2, 0, 0, 20, 20); 

// reflections
  fill( 255, 255, 255);
  stroke (255,255,255);
  strokeWeight(2);

  beginShape(LINES);
  vertex(x+wd*.29, y + ht*.59);
  vertex(x+wd*.37, y + ht*.45);
  vertex(x+wd*.45, y + ht*.45);
  vertex(x+wd*.37, y + ht*.59);

  vertex(x+wd*.67, y + ht*.59);
  vertex(x+wd*.75, y + ht*.45);
  vertex(x+wd*.83, y + ht*.45);
  vertex(x+wd*.75, y + ht*.59);
  endShape();

//mustache
  fill( 255, 255, 255);
  arc(x+wd*.46, y+ht*.81, wd*.27, ht*.27, 0.75*PI,1.75*PI); 
  arc(x+wd*.66, y+ht*.81, wd*.27, ht*.27, 1.25*PI,2.25*PI); 

// nose "C"
  noFill();
  stroke( 255, 140, 130 );
  strokeWeight(1);
  beginShape();
  curveVertex( x+wd*.41, y+ht*.3 );
  curveVertex( x+wd*.51,  y+ht*.65);
  curveVertex( x+wd*.61,  y+ht*.65);
  curveVertex( x+wd*.71, y+ht*.3 );
  endShape();

  mouth();
  hair();
}

void mouth()
{
  if ( mouseY < y*.8)
  {
      // mouth
      noStroke();
      fill( 255, 160, 180 );
      ellipse(x+wd*.56, y+ht*.82, wd*.04, ht*.1);
  }
  else
  {
      noStroke();
      fill( 255, 160, 180 );
      beginShape();
      vertex(x+wd*.52, y+ht*.8);
      vertex(x+wd*.6, y+ht*.8);
      vertex(x+wd*.56, y+ht*.85);
      endShape();
  }
}

void mousePressed( ) // scale image to Y p
{
    x = mouseX;
    y = mouseY;
    wd = x;
    ht = wd;
}


void mouseReleased( ) // default back to center
{ 
    x = 100;
    y = 100;
    wd = 200;
    ht = 200;
} 

void hair()
{
  
  noStroke();
  fill(255, 255, 255);

  if (mouseY <= y)
  { 
    rect( x+wd*.1, mouseY+ht*.35, wd*.17, ht*.25, 50, 50, 20, 20);
    rect( x+wd/2, mouseY+ht*.15, wd*.85, ht*.27, 90, 50, 50, 50);
  }
  else
  {
    rect( x+wd*.1, y+ht*.35, wd*.17, ht*.25, 50, 50, 20, 20);
    rect( x+wd/2, y+ht*.15, wd*.85, ht*.27, 90, 50, 50, 50); 
  }
}
