
int NumPoints = 8;

float[] Xp = new float[NumPoints];
float[] Yp = new float[NumPoints];

float destX;
float destY;

float destX2;
float destY2;

void setup()
{
  size(540,334);
  smooth();
  
  noFill();

  for(int i = 0 ; i < NumPoints ; i++)
  {
    Xp[i] = random(100,500);
    Yp[i] = random(100,300);
  }
}

void draw(){
    background(194,216,242);

/*
  if(second() % 2 == 0)
  {
    randomSeed(millis());
    destX += random(-width,width);
    destY += random(-height,height);
  }
  */
  destX = mouseX;
  destY = mouseY;

  Xp[0] += (destX - Xp[0])/8;
  Yp[0] += (destY - Yp[0])/8;

  if(frameCount % 300 == 0)
 {
    destX2 = random(0,width);
    destY2 = random(0,height);
  }

 Xp[NumPoints - 1] += (destX2 - Xp[NumPoints - 1]) / 4.;
 Yp[NumPoints - 1] += (destY2 - Yp[NumPoints - 1]) / 4.;
 
  if(Xp[0] > width) Xp[0] = width;
  if(Xp[0] < 0) Xp[0] = 0;
  if(Yp[0] > height) Yp[0] = height;
  if(Yp[0] < 0) Yp[0] = 0;
  
  for(int i = 1; i < NumPoints - 1 ; i++)
  {
    Xp[i] -= (Xp[i] - Xp[i-1])/(16);
    Yp[i] -= (Yp[i] - Yp[i-1]) /(16);
  }  

  for(int i = NumPoints-2; i > 0 ; i--)
  {
    Xp[i] += (Xp[i+1] - Xp[i])/(16);
    Yp[i] += (Yp[i+1] - Yp[i]) /(16);
  }  

  for(int i = 0 ; i < NumPoints ; i++)
  {
    if(i == 0)
       fill(0);
    else
       noFill();
     
    if( i == NumPoints - 1)
ellipse(Xp[i],Yp[i],20,20);
else
    ellipse(Xp[i],Yp[i],10,10);
  } 
  beginShape();

  curveTightness(0.1);

  for(int i = 0 ; i  < NumPoints ; i++)
  {
    if( i == 0 || i == NumPoints - 1)
    { curveVertex(Xp[i],Yp[i]);}

     curveVertex(Xp[i],Yp[i]);
    
  }
    endShape();

}

