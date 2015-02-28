


final int MAX = 80;

float [ ] xPos;
float [ ] yPos;
float [ ] zPos;
float [ ] rotX;
float [ ] rotY;
float [ ] rotZ;
float [ ] wd;
color [ ] col;
  //float rotX, rotY, rotZ;
int t;
float convRad = 0.000745;

void setup()
{
  size (400,400,P3D);
  noStroke();
  t = 0;
  //  rotX = 0;
  //  rotY = 0;
  //  rotZ = 0;
  xPos = new float [MAX];
  initializeArray(xPos, 0,width);
  yPos = new float [MAX];
  initializeArray(yPos, 0,height);
  zPos = new float [MAX];
  initializeArray(zPos,-1000,100);
  rotX = new float [MAX];
  initializeArray(rotX,0,1);
  rotY = new float [MAX];
  initializeArray(rotY,0,1);
  rotZ = new float [MAX];
  initializeArray(rotZ,0,1);
  wd = new float [MAX];
  initializeArray(wd, 20,50);
  col = new color [MAX];
  initializeColorArray();
}

void initializeArray(float [ ] arrayname, float lowval, float highval)
{
  for(int i = 0; i < arrayname.length; i++)
  {
    arrayname[i] = random(lowval, highval);
  }
}

void initializeColorArray()
{
  for(int i = 0; i < col.length; i++)
  {
    col[i] = color(random(255), random(255), random(255), 100);
  }
}

void draw()
{
  backgrounder();
  moveFigure();
      //drawFigure();
  
  //saveFrame("hw12.jpg");
}

void backgrounder()
{
    background(0);
//    directionalLight(220, 220, 180, 1, 1, -1);
//    directionalLight(50, 80, 120, -1, -1, -1);
lights();

}

//void drawFigure()
//{
//    fill(255);
//    translate(xPos[i],yPos[i],zPos[i]);
//    box(wd[i], wd[i], wd[i]);
//
//}

void moveFigure()
{
    
    for(int i = 0; i< MAX; i++)
    {
      
      fill(255);
      pushMatrix();
      fill(col[i]);
      translate(xPos[i],yPos[i],zPos[i]);
      rotateX(rotX[i] * convRad * t);
      rotateY(rotY[i] * convRad * t);
      rotateZ(rotZ[i] * convRad * t); 
      box(wd[i], wd[i], wd[i]);
      popMatrix();
      println("xpos[i] = " + xPos[i] * convRad + " rotX[i] =" + rotX[i] * convRad);
      t++;
    }

  }


