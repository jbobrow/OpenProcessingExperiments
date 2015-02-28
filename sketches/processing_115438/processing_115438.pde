
//hw 6
//Stephanie Park
//seohyunp@andrew.cmu.edu
//© Stephanie Park, 2013

//x,y,z to rotate
//up,down,left,right to translate

float transX, transY, transZ;
float rotX, rotY, rotZ; 
float transDeltaX, transDeltaY, transDeltaZ;
float rotDeltaX, rotDeltaY, rotDeltaZ;
 
void setup( )
{
   size( 600, 600, P3D);
   background(0, 0, 0);
   rotDeltaX = 0;
   rotDeltaY = 0;
   rotDeltaZ = 0;
   transDeltaX = 0;
   transDeltaY = 0;
   transDeltaZ = 0;

}
 
void draw()
{
  background(0);
  showStats();
  pushMatrix();
    translate(transX, transY, transZ);
    translate(width*1, height*1);
    rotateX(radians(rotX)); 
    rotateY(radians(rotY));
    rotateZ(radians(rotZ));
    translate(-width*1, -height*1);
    initial();
    adjustCoordinates();
  popMatrix();

}
 
 


void showStats()
{
   textAlign(LEFT);
   fill(255);
   text("Translation: ", 5, height*.1 - 20);
   text( "   X:    " + (transDeltaX), 5, height*.1);
   text( "   Y:    " + (transDeltaY), 5, height*.1 +20);
   text( "   Z:    " + (transDeltaZ), 5, height*.1+40);
   text("Rotation:", 5, height*.1 +60 );
   text("    X:    " + int(rotX%360), 5, height*.1+80);
   text("    Y:    " + int(rotY%360), 5, height*.1+100);
   text("    Z:    " + int(rotZ%360), 5, height*.1+120); 
    
}

 
void keyPressed()
{
  if ( key == CODED )
  {
    if (keyCode == UP)
    {
      transDeltaY--;
    }
    else if (keyCode == DOWN)
    {
      transDeltaY++;
    }
    else if (keyCode == LEFT)
    {
      transDeltaX--;
    }
    else if (keyCode == RIGHT)
    {
     transDeltaX++;
    }
  }
   else if (key == ' ')
  {
    transX = transY = transZ = 0;
    transDeltaX = transDeltaY = transDeltaZ = 0;
  }
  else if (key == 'x')
  {
    rotDeltaX--;
  }
  else if (key == 'X')
  {
    rotDeltaX++;
  }
  else if (key == 'y')
  {
    rotDeltaY--;
  }
  else if (key == 'Y')
  {
    rotDeltaY++;
  }
  else if ( key == 'z' )
  {
    rotDeltaZ--;
  }
  else if (key == 'Z')
  {
    rotDeltaZ++;
  }
  else if (key == 's' )
  {
    rotX = rotY = rotZ = 0;
    transDeltaX = transDeltaY = transDeltaZ = 0;
    rotDeltaX = rotDeltaY = rotDeltaZ = 0;  
}
}

void mouseDragged()
{
  if (mouseButton == LEFT)
  {
     if (pmouseX < mouseX && pmouseY < mouseY)
     {
       transX += 2;
       transY += 2;
     }
     else if (pmouseX < mouseX && pmouseY > mouseY)
     {
       transX += 2;
       transY -= 2;
     }
     else if (pmouseX > mouseX && pmouseY < mouseY)
     {
       transX -= 2;
       transY += 2;
     }
     else if (pmouseX > mouseX && pmouseY > mouseY)
     {
       transX -= 2;
       transY -= 2;
     }
     else if (pmouseX < mouseX )
     {
        transX += 2;
     }
     else if (pmouseX > mouseX)
     {
       transX -= 2;
     }
     else if (pmouseY < mouseY)
     {
       transY += 2;
     }
     else if (pmouseY > mouseY)
     {
       transY -= 2;
     }
  }
  else if (mouseButton == RIGHT)
  {
    if (pmouseY < mouseY)
    {
      transZ -= 5;
    }
    else if (pmouseY > mouseY)
    {
      transZ += 5;
    }
  }
}

 

 
void initial()
{ 
  lights ();
  pushMatrix();
    fill ( 252, 237 , 89 );
    noStroke ();
    translate (300,300,0);
    sphere (20);
    translate (60,40,0);
    sphere (20);
    translate (30,50, 0);
    sphere (20);
    translate ( -30,50, 0);
    sphere (20);
    translate ( -60,40,0);
    sphere (20);
    translate ( -60, -40, 0);
    sphere (20);
    translate (0,-200,0);
    sphere (20);
    translate (-30,-50, 0);
    sphere (20);
    translate ( 30,-50, 0);
    sphere (20);
    translate ( 60,-40,0);
    sphere (20);
    translate ( 60, 40, 0);
    sphere (20);
   popMatrix();
   
   pushMatrix();
    fill ( 216, 203 , 74 );
    noStroke ();
    translate (300,300,50);
    sphere (20);
    translate (60,40,0);
    sphere (20);
    translate (30,50, 0);
    sphere (20);
    translate ( -30,50, 0);
    sphere (20);
    translate ( -60,40,0);
    sphere (20);
    translate ( -60, -40, 0);
    sphere (20);
    translate (0,-200,0);
    sphere (20);
    translate (-30,-50, 0);
    sphere (20);
    translate ( 30,-50, 0);
    sphere (20);
    translate ( 60,-40,0);
    sphere (20);
    translate ( 60, 40, 0);
    sphere (20);
   popMatrix();
   
   pushMatrix();
    fill ( 155,145,53,130 );
    noStroke ();
    translate (300,300,100);
    sphere (20);
    translate (60,40,0);
    sphere (20);
    translate (30,50, 0);
    sphere (20);
    translate ( -30,50, 0);
    sphere (20);
    translate ( -60,40,0);
    sphere (20);
    translate ( -60, -40, 0);
    sphere (20);
    translate (0,-200,0);
    sphere (20);
    translate (-30,-50, 0);
    sphere (20);
    translate ( 30,-50, 0);
    sphere (20);
    translate ( 60,-40,0);
    sphere (20);
    translate ( 60, 40, 0);
    sphere (20);
   popMatrix();
   
      pushMatrix();
    fill ( 155,145,53,100 );
    noStroke ();
    translate (300,300,150);
    sphere (20);
    translate (60,40,0);
    sphere (20);
    translate (30,50, 0);
    sphere (20);
    translate ( -30,50, 0);
    sphere (20);
    translate ( -60,40,0);
    sphere (20);
    translate ( -60, -40, 0);
    sphere (20);
    translate (0,-200,0);
    sphere (20);
    translate (-30,-50, 0);
    sphere (20);
    translate ( 30,-50, 0);
    sphere (20);
    translate ( 60,-40,0);
    sphere (20);
    translate ( 60, 40, 0);
    sphere (20);
   popMatrix();
   
    pushMatrix();
    fill ( 155,145,53,80 );
    noStroke ();
    translate (300,300,200);
    sphere (20);
    translate (60,40,0);
    sphere (20);
    translate (30,50, 0);
    sphere (20);
    translate ( -30,50, 0);
    sphere (20);
    translate ( -60,40,0);
    sphere (20);
    translate ( -60, -40, 0);
    sphere (20);
    translate (0,-200,0);
    sphere (20);
    translate (-30,-50, 0);
    sphere (20);
    translate ( 30,-50, 0);
    sphere (20);
    translate ( 60,-40,0);
    sphere (20);
    translate ( 60, 40, 0);
    sphere (20);
   popMatrix();
   
    pushMatrix();
    fill ( 155,145,53,50 );
    noStroke ();
    translate (300,300,250);
    sphere (20);
    translate (60,40,0);
    sphere (20);
    translate (30,50, 0);
    sphere (20);
    translate ( -30,50, 0);
    sphere (20);
    translate ( -60,40,0);
    sphere (20);
    translate ( -60, -40, 0);
    sphere (20);
    translate (0,-200,0);
    sphere (20);
    translate (-30,-50, 0);
    sphere (20);
    translate ( 30,-50, 0);
    sphere (20);
    translate ( 60,-40,0);
    sphere (20);
    translate ( 60, 40, 0);
    sphere (20);
   popMatrix();
   
   pushMatrix();
    fill ( 155,145,53,30 );
    noStroke ();
    translate (300,300,300);
    sphere (20);
    translate (60,40,0);
    sphere (20);
    translate (30,50, 0);
    sphere (20);
    translate ( -30,50, 0);
    sphere (20);
    translate ( -60,40,0);
    sphere (20);
    translate ( -60, -40, 0);
    sphere (20);
    translate (0,-200,0);
    sphere (20);
    translate (-30,-50, 0);
    sphere (20);
    translate ( 30,-50, 0);
    sphere (20);
    translate ( 60,-40,0);
    sphere (20);
    translate ( 60, 40, 0);
    sphere (20);
   popMatrix();
   
   
    pushMatrix();
    fill ( 216, 203 , 74, 100 );
    noStroke ();
    translate (300,300,-50);
    sphere (20);
    translate (60,40,0);
    sphere (20);
    translate (30,50, 0);
    sphere (20);
    translate ( -30,50, 0);
    sphere (20);
    translate ( -60,40,0);
    sphere (20);
    translate ( -60, -40, 0);
    sphere (20);
    translate (0,-200,0);
    sphere (20);
    translate (-30,-50, 0);
    sphere (20);
    translate ( 30,-50, 0);
    sphere (20);
    translate ( 60,-40,0);
    sphere (20);
    translate ( 60, 40, 0);
    sphere (20);
   popMatrix();

    pushMatrix();
    fill ( 216, 203 , 74, 80 );
    noStroke ();
    translate (300,300,-100);
    sphere (20);
    translate (60,40,0);
    sphere (20);
    translate (30,50, 0);
    sphere (20);
    translate ( -30,50, 0);
    sphere (20);
    translate ( -60,40,0);
    sphere (20);
    translate ( -60, -40, 0);
    sphere (20);
    translate (0,-200,0);
    sphere (20);
    translate (-30,-50, 0);
    sphere (20);
    translate ( 30,-50, 0);
    sphere (20);
    translate ( 60,-40,0);
    sphere (20);
    translate ( 60, 40, 0);
    sphere (20);
   popMatrix();

}

void adjustCoordinates()
{
  transX += transDeltaX;
  transY += transDeltaY;
  transZ += transDeltaZ;
  rotX += rotDeltaX;
  rotY += rotDeltaY;
  rotZ += rotDeltaZ;
}


