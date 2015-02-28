

int MAX_BALLS = 500;

int noOfBalls;
boolean newBall = false;
float[] xpos = new float[MAX_BALLS];
float[] ypos = new float[MAX_BALLS];

float[] xvol = new float[MAX_BALLS];
float[] yvol = new float[MAX_BALLS];

float[] xp1 = new float[MAX_BALLS];
float[] yp1 = new float[MAX_BALLS];

float[] xlen = new float[MAX_BALLS];
float[] ylen = new float[MAX_BALLS];

float[] xsize = new float[MAX_BALLS];
float[] ysize = new float[MAX_BALLS];

float[] sizec = new float[MAX_BALLS];
int[][] fillColor = new int[MAX_BALLS][3];

//PImage [] images;

//int[] currentPosition = new int[MAX_BALLS];
int[] direction = new int[MAX_BALLS] ;


void setup()
{
  size(640, 640);
  background(255);
  smooth();
  noOfBalls = 0;
  for(int i=0; i < MAX_BALLS;i++)
  {
    xvol[i] = 0;
    yvol[i] = 0;
    xsize[i]= 20;
    ysize[i] = 20;
    sizec[i] = 1;
  }
  //imageMode(CENTER);
  //images = loadImages("Animation_data/movie",".jpg", 134);
  
}

void mousePressed()
{
  //code to create a ball
  noOfBalls++;
  xp1[noOfBalls-1] = mouseX;
  yp1[noOfBalls-1] = mouseY;

  newBall = true;
  
  
}

void mouseReleased()
{
   xvol[noOfBalls-1] = (xp1[noOfBalls-1] - mouseX)/40;
   yvol[noOfBalls-1] = (yp1[noOfBalls-1] - mouseY)/40;
   
   xlen[noOfBalls-1] = abs(xpos[noOfBalls-1] - xp1[noOfBalls-1]);
   ylen[noOfBalls-1] = abs(ypos[noOfBalls-1] - yp1[noOfBalls-1]);
   
   fillColor[noOfBalls-1][0]= (int)random(0,255);
   fillColor[noOfBalls-1][1]= (int)random(0,255);
   fillColor[noOfBalls-1][2]= (int)random(0,255);
   
   //currentPosition[noOfBalls-1] = 0;
   direction[noOfBalls-1] = 1;
   
}


void draw()
{
  
  if (mousePressed)
  {
    
    background(255);
    stroke(0);
    line(xp1[noOfBalls-1],yp1[noOfBalls-1],mouseX,mouseY);
    xpos[noOfBalls-1] = mouseX;
    ypos[noOfBalls-1] = mouseY;
    ellipse(xpos[noOfBalls-1],ypos[noOfBalls-1],20,20);
  }
  
  if (newBall)
  {
    for(int i=0; i< noOfBalls;i++)
    {
      xsize[i] = xsize[i] + sizec[i];
      ysize[i] = ysize[i] + sizec[i];
      if (xsize[i] > 50 || xsize[i] < 0)
      {
        sizec[i] = -1*sizec[i];
        direction[i] = -1*direction[i];
      }
      xpos[i] =xpos[i] +xvol[i];
      ypos[i] =ypos[i] +yvol[i];
      if(xlen[0] < abs(xpos[0] - xp1[0]))
      {
        xvol[i]= -1*xvol[i];
      }
       if(ylen[i] < abs(ypos[i] - yp1[i]))
      {
        yvol[i]= -1*yvol[i];
      }
    }
    
    background(255);
    stroke(0);
    for(int i=0; i<noOfBalls;i++)
    {
      line(xp1[i],yp1[i],xpos[i],ypos[i]);
      /*if (currentPosition[i] >= images.length)
      {
        currentPosition[i] = 0;
      }
      else if (currentPosition[i] < 0)
      {
        currentPosition[i] = images.length - 1;
      }*/
    }
   

    
  
    for(int i=0; i<noOfBalls;i++)
    {
      //currentPosition[i]= currentPosition[i] + (int)(sqrt(xvol[i]*xvol[i] + yvol[i]*yvol[i]))*direction[i];
    
      fill(fillColor[i][0],fillColor[i][1],fillColor[i][2]);
      ellipse(xpos[i],ypos[i],xsize[i],ysize[i]);
      stroke(0);
    }
    
    for(int i=1; i <noOfBalls;i++)
    {
      line(xpos[i-1],ypos[i-1],xpos[i],ypos[i]);
      line(xp1[i-1],yp1[i-1],xp1[i],yp1[i]);
    }
  }
  
 
}




