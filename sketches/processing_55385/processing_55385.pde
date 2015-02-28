
//sketch by Paweł Sikorski, 8 march 2012
int fps = 2;
int countRecMax = 7;              
int countRec = 0;
int[] modeSquare = {3, 3, 6};

boolean startState = false; 

PFont fontA, fontB;

void setup()
{  
  size(512, 512);
  frameRate(2);
  fontA = loadFont("ISOCPEURItalic-22.vlw");
  fontB = loadFont("ISOCPEUR-30.vlw");
  smooth();
  noStroke();
  noLoop();  
  startScreen();
}

void draw()
{  
  if (startState)
  {
    background(0);
    pushMatrix();
    translate(width/2, height/2);
    cuttingSquare(width/2, countRec);
    popMatrix();
    if (countRec <= countRecMax)
      countRec++;
  }
}

void cuttingSquare(float A, int countRec)
{
  if (countRec > 0)
  {
    countRec--;
    fill(255);
    rect(0, 0, -A, -A);
    float D = round(A/2);
    if (A >= 1)
      for (int i = 0; i < 3; i++)
      {
        float TransX = 0, TransY = 0;
        switch(i)
        {
        case 0:
          TransX = -D;
          TransY = D;
          break;
        case 2:
          TransX = D;
          TransY = D;
          break;
        case 1:
          TransX = D;
          TransY = -D;
          break;
        }

        switch(modeSquare[i])
        {
        case 0:
          pushMatrix();
          translate(TransX, TransY);
          scale(1, -1);
          cuttingSquare(D, countRec);          
          popMatrix();
          break;
        case 1:
          pushMatrix();
          translate(TransX, TransY);
          scale(-1, 1);
          rotate(HALF_PI);
          cuttingSquare(D, countRec);          
          popMatrix();
          break;
        case 2:
          pushMatrix();
          translate(TransX, TransY);
          scale(-1, 1);
          cuttingSquare(D, countRec);          
          popMatrix();
          break;
        case 3:
          pushMatrix();
          translate(TransX, TransY);
          scale(1, -1);
          rotate(HALF_PI);
          cuttingSquare(D, countRec);          
          popMatrix();
          break;
        case 4:
          pushMatrix();
          translate(TransX, TransY);
          rotate(HALF_PI);
          cuttingSquare(D, countRec);          
          popMatrix();
          break;
        case 5:
          pushMatrix();
          translate(TransX, TransY);
          rotate(PI);
          cuttingSquare(D, countRec);          
          popMatrix();
          break;
        case 6:
          pushMatrix();
          translate(TransX, TransY);
          rotate(3*HALF_PI);
          cuttingSquare(D, countRec);          
          popMatrix();
          break;
        case 7:
          pushMatrix();
          translate(TransX, TransY);
          cuttingSquare(D, countRec);          
          popMatrix();
          break;
        }



        pushMatrix();
        float R = (A)/2;

        popMatrix();
      }
  }
}


