
//Homework #4 :: 51-257 Sec A :: Michael Loffredo :: mlloffre
//copyright michael loffredo 2012

//////DIRECTIONS///////

// Mixing colors!
// Press "r" to make red. If you pressed "r" then press "b" to make purple 
// Press the space bar to clear the canvas 
// Press "r" to make red. If you pressed "r" then press "y" to make orange 
// Press the space bar to clear the canvas 
// Press "Y" to make yellow. If you pressed "Y" then press "B" to make green 
// Press the space bar to clear the canvas
// Click and hold the mouse button to create a rainbow of randomly located and colored circles 


float dia;
float x;
float y; 

float r;
float g;
float b;
float a; 

float diam;
float w;
float z;


void setup ()
{
  size (400, 400);
  background (255);
  smooth ();
  frameRate (30);
  dia = 200;
  x = 120; 
  y = 200;
}






void draw ()
{
 // Rainbow
   if (mousePressed) { 
     r = random (255);
     g = random (255);
     b = random (255);
     a = random (255);
     diam = random (200);
     z = random (width);
     w = random (height);
     noStroke (); 
     fill (r, g, b, a);
     ellipse (z, w, diam, diam);
} 
}

//Red
void keyPressed ()
{
  if (key  == 'r')
  {
    fill (277, 2, 2, 200);
    noStroke ();
    ellipse (width/2, height/2, dia, dia);
    
    }
    
//Blue
    if (key == 'b')
  {
    fill (255);
    ellipse (width/2, height/2, dia, dia);
    fill (106, 5, 157, 200);
    noStroke ();
    ellipse (width/2, height/2, dia, dia);
     
    }

//Clear Canvas 
    if (key == ' ')
  {
   background (255);
    
    }
    
    //Yellow
     if (key == 'y')
   {
     fill (255);
    ellipse (width/2, height/2, dia, dia);
    fill (247, 166, 12, 200);
    noStroke ();
    ellipse (width/2, height/2, dia, dia);
    
    }
    
//Second Yellow 
  if (key  == 'Y')
  {
    fill (247, 247, 12, 200);
    noStroke ();
    ellipse (width/2, height/2, dia, dia);
    } 
    
//Second Blue 
if (key == 'B')
  {
    fill (255);
    ellipse (width/2, height/2, dia, dia);
    fill (32, 162, 13, 200);
    noStroke ();
    ellipse (width/2, height/2, dia, dia);
    
   } 
   
   

    
} 




