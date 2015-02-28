
//Homework 11

//Danielle Dong
//dmdong@andrew.cmu.edu
//copyright Danielle Dong, Carnegie Mellon University, Pittburgh, PA





//global variables/arrays
final int MAX = 10;
float [] rectPosX;
float [] rectPosY;
float [] rectSize;
float [] rectMoveX;
float [] rectMoveY;





void setup ()  {
  size (400,400); // change this to (displayWidth, displayHeight) to fit to display
  background (0);
  frameRate (10);
  rectMode (CENTER);
  
  rectPosX = new float [MAX];
  rectPosY = new float [MAX];
  initFloatArrayPos (rectPosX, 0, width);
  initFloatArrayPos (rectPosY, 0, width);  

  rectSize = new float [MAX];
  initFloatArraySize (rectSize, 50, 150);  

  rectMoveX = new float [MAX];
  rectMoveY = new float [MAX];
  initFloatArrayMove (rectMoveX, 5, 10);
  initFloatArrayMove (rectMoveY, 5, 10);
}





void draw ()  {
  prepareScreen ();
  drawSquare();
  moveSquare ();
}





void prepareScreen ()  {
  fill (random (255), random (255), random (255), 15);
  noStroke ();
}

void initFloatArrayMove ( float [] insertArray, float limit1, float limit2)  {
  for ( int b = 0; b < insertArray.length; b = b+1)  {
    insertArray [b] = (int(random(limit1, limit2)));
  }
}

void moveSquare ()  {  
  for ( int b = 0; b < rectMoveX.length; b = b+1)  {
    rectPosX [b] = rectPosX [b] + rectMoveX [b] ;
    rectPosY [b] = rectPosY [b] + rectMoveY [b] ;
    
    if (rectPosX[b] > (width - (rectSize[b]/2)))  {
      rectMoveX [b] = -rectMoveX[b] ;
    }
    if (rectPosX[b] < (0 + (rectSize[b]/2)))  {
      rectMoveX [b] = -rectMoveX[b] ;
    }
    if (rectPosY[b] > (height - (rectSize[b]/2)))  {
      rectMoveY [b] = -rectMoveY[b] ;
    }
    if (rectPosY[b] < (0 + (rectSize[b]/2)))  {
      rectMoveY [b] = -rectMoveY[b] ;
    }
  }
}

void initFloatArraySize ( float [] insertArray, float limit1, float limit2 )  {
  for ( int b = 0; b < insertArray.length; b = b+1)  {
    insertArray [b] = int (random (limit1, limit2));
  }
}

void initFloatArrayPos ( float [] insertArray, float limit1, float limit2 )  {
  for ( int b = 0; b < insertArray.length; b = b+1)  {
    insertArray [b] = int (random (limit1, limit2));
  }
}

void drawSquare ()  {
  for (int b = 0; b < rectPosX.length; b = b+1)  {
    rect (rectPosX [b], rectPosY[b], rectSize[b], rectSize[b]);
  }
}


