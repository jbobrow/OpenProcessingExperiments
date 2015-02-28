
float transX, transY, transZ;
float rotX, rotY, rotZ;  
float transDeltaX, transDeltaY, transDeltaZ;
float rotDeltaX, rotDeltaY, rotDeltaZ;
int depth;

void setup( )
{
   size( 600, 600, P3D);
   background(0, 0, 0);
   transDeltaX = 0;
   transDeltaY = 0;
   transDeltaZ = 0;
   rotDeltaX = 0;
   rotDeltaY = 0;
   rotDeltaZ = 0;
   depth = width/12;
}

void draw()
{
  background(0);
  directionalLight(255, 255, 255, 0, 1, -1);

  
  pushMatrix();
    adjustCoordinates();
    translate(transX, transY, transZ);
    translate(width*0.5, height*0.5);
    rotateX(radians(rotX));  
    rotateY(radians(rotY));
    rotateZ(radians(rotZ));
    drawAxis();
    translate(-width*0.5, -height*0.5);
    drawInitial();
  popMatrix();
  
  showStats();
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

void drawAxis()
{
  strokeWeight(3);
  stroke(200, 200, 0 ); 
  line(0, 0, 200, 0, 0, -200);
  stroke(0, 200, 200);
  line(0, 200, 0, 0, -200, 0);
  stroke(200, 0, 200);
  line(200, 0, 0, -200, 0, 0); 
}

void mouseDragged()
{
  if (mouseButton == LEFT)
  {
     if (pmouseX < mouseX && pmouseY < mouseY)
     {
       transX += 1;
       transY += 1;
     }
     else if (pmouseX < mouseX && pmouseY > mouseY)
     {
       transX += 1;
       transY -= 1;
     }
     else if (pmouseX > mouseX && pmouseY < mouseY)
     {
       transX -= 1;
       transY += 1;
     }
     else if (pmouseX > mouseX && pmouseY > mouseY)
     {
       transX -= 1;
       transY -= 1;
     }
     else if (pmouseX < mouseX )
     {
        transX += 1;
     }
     else if (pmouseX > mouseX)
     {
       transX -= 1;
     }
     else if (pmouseY < mouseY)
     {
       transY += 1;
     }
     else if (pmouseY > mouseY)
     {
       transY -= 1;
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
  else if (key == 's' )
  {
    rotX = rotY = rotZ = 0;
    transDeltaX = transDeltaY = transDeltaZ = 0;
    rotDeltaX = rotDeltaY = rotDeltaZ = 0;
  } 
  else if ( key == 'z' )
  {
    rotDeltaZ--;
  }
  else if (key == 'Z')
  {
    rotDeltaZ++;
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
}

void showStats()
{
   textAlign(LEFT);
   fill(255, 255, 255);
   text("Distance:", 5, height*.1 +20 );
   text("  L/R:    " + int(transX), 5, height*.1 +40);
   text("  U/D:    " + int(transY), 5, height*.1 +60);
   text("  I/O:    " + int(transZ), 5, height*.1 +80); 
   text("Trans Rates: ", 5, height*.1 +100);
   text( "   X:    " + (transDeltaX), 5, height*.1 +120);
   text( "   Y:    " + (transDeltaY), 5, height*.1 +140);
   text( "   Z:    " + (transDeltaZ), 5, height*.1 +160);
   text("Rotation:", 5, height*.1 +200 );
   text("    X:    " + int(rotX%360), 5, height*.1 +220);
   text("    Y:    " + int(rotY%360), 5, height*.1 +240);
   text("    Z:    " + int(rotZ%360), 5, height*.1 +260);  
   
}

void drawInitial()
{  
   pushMatrix();
     translate(width*0.5, height*0.5, 0);
     fill(147, 19, 19 );
     stroke(0);
     strokeWeight(1);
     box(width/12);
   popMatrix();
   
   pushMatrix();
     translate(width*0.5, height*0.5, depth*1.5);
     fill(147, 19, 19 );
     stroke(0);
     strokeWeight(1);
     box(width/12);
   popMatrix();
   
   pushMatrix();
     translate(width*0.5, height*0.5, -depth*1.5);
     fill(147, 19, 19 );
     stroke(0);
     strokeWeight(1);
     box(width/12);
   popMatrix();
   
   pushMatrix();
     translate(width*0.5, height*0.2, 0);
     fill(147, 19, 19 );
     stroke(0);
     strokeWeight(1);
     box(width/12);
   popMatrix();
   
   pushMatrix();
     translate(width*0.5, height*0.2, depth*1.5);
     fill(147, 19, 19 );
     stroke(0);
     strokeWeight(1);
     box(width/12);
   popMatrix();
   
    pushMatrix();
     translate(width*0.5, height*0.2, -depth*1.5);
     fill(147, 19, 19 );
     stroke(0);
     strokeWeight(1);
     box(width/12);
   popMatrix();
   
   pushMatrix();
     translate(width*0.5, height*0.35, 0);
     fill(147, 19, 19 );
     stroke(0);
     strokeWeight(1);
     box(width/12);
   popMatrix();
     
   pushMatrix();
     translate(width*0.5, height*0.35, depth*1.5);
     fill(147, 19, 19 );
     stroke(0);
     strokeWeight(1);
     box(width/12);
   popMatrix();
   
   pushMatrix();
     translate(width*0.5, height*0.35, -depth*1.5);
     fill(147, 19, 19 );
     stroke(0);
     strokeWeight(1);
     box(width/12);
   popMatrix();
   
   pushMatrix();
     translate(width*0.38, height*0.6, 0);
     fill(147, 19, 19 );
     stroke(0);
     strokeWeight(1);
     box(width/12);
   popMatrix();
   
   pushMatrix();
     translate(width*0.38, height*0.6, depth*1.5);
     fill(147, 19, 19 );
     stroke(0);
     strokeWeight(1);
     box(width/12);
   popMatrix();
   
   pushMatrix();
     translate(width*0.38, height*0.6, -depth*1.5);
     fill(147, 19, 19 );
     stroke(0);
     strokeWeight(1);
     box(width/12);
   popMatrix();
   
   pushMatrix();
     translate(width*0.25, height*0.5, 0);
     fill(147, 19, 19 );
     stroke(0);
     strokeWeight(1);
     box(width/12);
   popMatrix();
   
   pushMatrix();
     translate(width*0.25, height*0.5, depth*1.5);
     fill(147, 19, 19 );
     stroke(0);
     strokeWeight(1);
     box(width/12);
   popMatrix();  
   
   pushMatrix();
     translate(width*0.25, height*0.5, -depth*1.5);
     fill(147, 19, 19 );
     stroke(0);
     strokeWeight(1);
     box(width/12);
   popMatrix();
} 


