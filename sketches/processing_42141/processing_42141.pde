
// homeWork (7); 
// copyright Carl Bajandas 2011 Pittsburgh, PA

//////////////////////// GLOBAL \\\\\\\\\\\\\\\\\\\\\\\\\\

float 
x,
xPos, 
yPos, 
dia, 
inc,
deltaX, 
deltaY,
spaceX,
spaceY,
distX,
distY, 
speedX, 
speedY;

///////////////////////SETUP\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
void setup ()
{
size (400,400)   ;
smooth         ();
noFill         ();
noCursor       ();
dia  = height*.1 ;
inc  = 2         ;
xPos = width/2   ;
yPos = height/2  ;
x    = 5         ;
deltaX = 2       ;
deltaY = 2       ;
speedX = 0       ;
speedY = 0       ;
distX = 0        ;
distY = 0        ; 

}

///////////////////////DRAW\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
void draw ()
{
  background (120);
  prepScreen ();
  moveCFB ();
  CFB(height*2, width*2, 0 ,0  );
  centerCFB ();
  printBox ();
  textPrint ();
  mouse ();
  

}
 

///////////////////FUNCTIONS CALLED\\\\\\\\\\\\\\\\\\\\\
void mouse ()
{
             //  translate (width/2, yPos-height*.1);  
 fill (150, 50, 50, 20);
 ellipse (mouseX, mouseY, height*.05, width*.05); 
}
//////////////////////////////////////////////////////////
void prepScreen ()
{
 fill (150);
 rect (0,0, width, height); 
}
/////////////////////////////////////////////////

void centerCFB ()
   {
     if (keyPressed == true) {
       xPos   = width/2;
       yPos   = height/2;
       speedX = 0;
       speedY = 0;
     }
   }
//     else (keyPressed == false)
//     {
//     deltaX=2
//     deltaY=2
//     }

//////////////////////////////////////////
void moveCFB ()
{

  distX = mouseX - pmouseX;
  distY = mouseY - pmouseY;
  
  speedX += distX/10;
  speedY += distY/10;
  
  xPos += speedX;
  yPos += speedY;
  
  
  
  //xPos -= dx/100;
  //yPos -= dy/100;  //  yPos = yPos + dy/20
  
  if(yPos > height + dia) yPos = - dia;
  else if(yPos < - dia) yPos = height + dia;
  
  if(xPos > width + dia) xPos = - dia;
  else if(xPos < -dia) xPos = width + dia;
  
  CFB(xPos, yPos, dia*2, dia*2);
  
  
  
  
//      if (mouseX >0 && mouseX < width/2) {
//         deltaX = deltaX - (width/2 - mouseX)/30;
//      }
//      else {
//         deltaX  = deltaX + (width/2 + mouseX)/90;
//      }
//      
//      if (mouseY >0 && mouseY < width/2) 
//      {
//        deltaY = deltaY - (width/2 - mouseY)/30;
//      }
//      else 
//      {
//         deltaY = deltaY + (width/2 + mouseY)/90;
//      }
//                
//     CFB (width/2 + deltaX, height/2 + deltaY, dia*2, dia*2);
} 

// if (CFB > width + deltaX)
//  {
//    CFB = width - deltaX;
//  }
// 
//}
///////////////////////////////////////CALL printBox 

void printBox ()
{
stroke (30);
strokeWeight (3);
fill (25,25, 90);
rect (0, height, width, height /-5.5); 
} 
//////////////////////////////////////////////

void textPrint()
{
  fill(255, 255, 255);
  text("HORIZONTAL SPEED", width/4, height*.9);
  text("VERTICAL SPEED", width/4, height*.95);
  text (speedX*10, width*.65, height*.9);
  text (speedY*10, width*.65, height*.95);
}



///////////////////////////////////////// CALL CFB 
////////////////////////////////////////////
////////////////////////////////////////////
////////////////////////////////////////////
void CFB (float x, float y, float wd, float ht)
{

                   //// THIS IS THE B \\\\
beginShape ();
noFill();
stroke( 125, 125, 200); // blue 
  curveVertex ( x + .04 * wd, y - .39 *ht);
  curveVertex ( x + .04 * wd, y - .39 *ht);
  curveVertex ( x + .07 * wd, y - .23 *ht);
  curveVertex ( x + .09 * wd, y);
  curveVertex ( x + .07 * wd, y + .23 *ht);
  curveVertex ( x + .04 * wd, y + .39 *ht);
  curveVertex ( x + .14 * wd, y + .39 *ht);
  curveVertex ( x + .33 * wd, y + .31 *ht);
  curveVertex ( x + .40 * wd, y + .20 *ht);
  curveVertex ( x + .42 * wd, y + .08 *ht);
  curveVertex ( x + .32 * wd, y);
  curveVertex ( x + .42 * wd, y - .08 *ht);
  curveVertex ( x + .40 * wd, y - .20 *ht);
  curveVertex ( x + .33 * wd, y - .31 *ht);
  curveVertex ( x + .14 * wd, y - .39 *ht);
  curveVertex ( x + .04 * wd, y - .39 *ht);
  curveVertex ( x + .33 * wd, y - .31 *ht);

endShape();


                   //// THIS IS THE C \\\\

              // this is the C's inner arc
  
beginShape ();
stroke( 125, 200, 125 ); // green 
  curveVertex   ( x + .25 * wd, y - .40 * ht );
  curveVertex   ( x + .25 * wd, y - .40 * ht );
  curveVertex   ( x + .10 * wd, y - .43 * ht );
  curveVertex   ( x - .10 * wd, y - .40 * ht );
  curveVertex   ( x - .28 * wd, y - .25 * ht );
  curveVertex   ( x - .35 * wd, y - .08 * ht );
  curveVertex ( x - .35 * wd, y + .08 * ht );
  curveVertex ( x - .28 * wd, y + .25 * ht );
  curveVertex ( x - .10 * wd, y + .40 * ht );
  curveVertex ( x + .10 * wd, y + .43 * ht );
  curveVertex ( x + .25 * wd, y + .40 * ht );

              // this is the C's outer arc 

  curveVertex   ( x + .25 * wd, y + .40 * ht );
  curveVertex   ( x + .10 * wd, y + .45 * ht );
  curveVertex   ( x - .10 * wd, y + .45 * ht );
  curveVertex   ( x - .30 * wd, y + .35 * ht );
  curveVertex   ( x - .45 * wd, y + .13 * ht );
  curveVertex ( x - .45 * wd, y - .13 * ht );
  curveVertex ( x - .30 * wd, y - .35 * ht );
  curveVertex ( x - .10 * wd, y - .45 * ht );
  curveVertex ( x + .10 * wd, y - .45 * ht );
  curveVertex ( x + .25 * wd, y - .40 * ht );
  curveVertex ( x + .25 * wd, y - .40 * ht );        
endShape();

              //// THIS IS THE effin F \\\\
              
beginShape ();
stroke (200,125,125);
  curveVertex ( x + .01 * wd, y - .30 * ht); 
  curveVertex ( x + .01 * wd, y - .30 * ht); 
  curveVertex ( x - .06 * wd, y - .36 * ht); 
  curveVertex ( x - .10 * wd, y);
  curveVertex ( x - .02 * wd, y + .37 * ht);
  curveVertex ( x - .02 * wd, y + .37 * ht);

endShape(); 

             //// this is the f's cross \\\\
             
beginShape();             
  vertex  ( x - .16 * wd, y - .01 * ht); 
  vertex  ( x - .01 * wd, y - .03 * ht); 
endShape  ();
}
