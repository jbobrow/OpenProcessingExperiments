
import SimpleOpenNI.*;

import com.sun.jna.Pointer;
import cl.nui.CLNUI;
import processing.opengl.*;


Pointer motor, camera;
PImage depthData,handSmooth,xProjection,yProjection, handTrace, hand,handFat,traceSmooth;

//height and width
int w=640;
int h=480;

//lens for average filter size
int xLens=3;
int yLens=3;

//outlier filter sensitivity ie removes taret pixel if fewer than proxFilter pixels in lens area.
int proxFilter=20;



PFont ft;
PFont ft2;
// x projection variables
int xOfXProj=0;//x position of x projection pixels
int yOfXProj=0;//y position of x projection pixels
int smoothYAmount = 30;
int [] xPos = new int [smoothYAmount];//array to hold 10 values x values of x projecton
int maxXOfXProj; //maximum x value in x projection
int maxYOfXProj; //max y valu in x projeciton
int xProjXAve=0;//mean of values in array
int prevXProjXAve=0;//previous mean of values in array
int relMinXOfXProj=w;//x coord of relative minimum of x projection
int relMinYOfXProj=h;//y coord of relative minimum of x projection
int tempRelMinYOfXProj=h-1;


// y projection variables
int xOfYProj=0;//x position of y projection pixels
int yOfYProj=0;//y position of y projection pixels
int smoothXAmount = 30;
int [] yPos = new int [smoothXAmount];//array to hold 10 values x values of x projecton
int maxYOfYProj; //maximum x value in x projection
int maxXOfYProj; //max y valu in x projeciton
int yProjYAve=0;//mean of values in array
int prevYProjYAve=0;//previous mean of values in array

//finds mid point on hand y coord

int tempMaxXOfXProj=0; // necessary becasue MaxXOfXProj is cleared and need this value to identify midpoint of hands
int tempMaxYOfXProj=0; // necessary becasue MaxXOfXProj is cleared and need this value to identify midpoint of hands

//finds mid point on hand x coord

int tempMaxXOfYProj=0; // necessary becasue MaxXOfXProj is cleared and need this value to identify midpoint of hands
int tempMaxYOfYProj=0; // necessary becasue MaxXOfXProj is cleared and need this value to identify midpoint of hands

//trace and edge detection
boolean boundary=false; // boundary test flag boundary = 0 means not boudanry
boolean boundaryBin=false; // boundary test flag boundary = 0 means not boudanry
int boundaryNeighbours; //test number of nieghbours that are also boundary n
int maxPoint=0; // fist point of edge array. 
int edge [] = new int [w*4]; //edge array
int edgeSmooth [] = new int [w*4]; //edge array

//if true activates NN once
boolean analyse = false;






void setup()
{
  smooth();
  size( 800, 600);
  frameRate( 100 );

  motor = CLNUI.INSTANCE.CreateNUIMotor();
  camera = CLNUI.INSTANCE.CreateNUICamera();
  CLNUI.INSTANCE.StartNUICamera( camera );
  CLNUI.INSTANCE.SetNUIMotorLED( motor, (byte)7 );
  System.out.println( "Kinect Serial: " + CLNUI.INSTANCE.GetNUIMotorSerial(motor) );


  depthData = createImage( 640, 480, RGB );
//  handSmooth = createImage (640, 480, RGB);
  handTrace = createImage (640, 480, RGB);
//  xProjection = createImage (640, 480, RGB);
//  yProjection = createImage (640, 480, RGB);
//  hand = createImage (640, 480, RGB);
  handFat = createImage (640, 480, RGB);
  traceSmooth = createImage (640, 480, RGB);
  ft = loadFont("IrisUPCBold-28.vlw");
  ft2=loadFont("DialogInput.bolditalic-150.vlw");
}




public void draw()
{

  smooth();




  CLNUI.INSTANCE.GetNUICameraDepthFrameRGB32( camera, depthData.pixels, 0 );	//reinterpret_cast<DWORD*>(uiDepthData) );
  //System.out.println( "Depth result: " + res );

  background( 0 );
  // image( handSmooth, 0, 0,400,300);
  // image( handTrace,0,0,800,600);
  //    image( hand, 400,0,400,300);
//  image( xProjection, 0,300,400,300);
//  image( yProjection, 0,0,400,300);



  for (int y = 0; y < h; y++)
  { 
    for (int x = 0; x < w; x++)
    {

      int loc = x+y*w;
      float bl = blue (depthData.pixels[loc]);
      float re = red (depthData.pixels[loc]);

      //clearXProjection (loc); //clears x projection
      // clearHandSmooth  (x,y,loc); //clears handsmooth
      clearHandTrace (loc);//clears handTrace
      clearHandFat(loc);

      if(bl>250&&re>1&&y<h-10)
      {
        // maxPoint=loc-1-1*w;
        handFat(loc);
      }  




     // xProjection(x,y,bl,re); //draws x projection
      //  hand(loc,y,bl,re);//draws hand
    }
  }

  if (maxPoint>10+10*w)
  {
    edge(maxPoint);
  }

//  for (int x = 0; x < w; x++)
//  {
//    for (int y = 0; y < h; y++)
//    { 
//      int loc = x+y*w;
//      float bl = blue (depthData.pixels[loc]);
//      float re = red (depthData.pixels[loc]);
//      clearYProjection (loc); //clears y projection
//      yProjection(x,y,bl,re);
//      
//    }
//  }




 // println(frameRate);



//      xProjectionMax();
//      xProjectionRelMin();
//      yProjectionMax();
//        midPoint(); //find mid point of hand
  depthData.updatePixels();
  //  handSmooth.updatePixels();
//  handTrace.updatePixels();
//  handFat.updatePixels();
  traceSmooth.updatePixels();
  //  hand.updatePixels();
//  xProjection.updatePixels();
//  yProjection.updatePixels();
}






void midPoint () //find mid poit on hand
{

  fill(0,0,255);
  ellipse(tempMaxXOfYProj*800/w,tempMaxYOfXProj*600/h,10,10);
}  




void keyPressed()
{
  analyse = true;
}









void prnt (int loc,int i)
{

  //println("x"+loc%w+"y"+loc/w);
}



public void stop()
{
  CLNUI.INSTANCE.SetNUIMotorLED( motor, (byte)0 );
  CLNUI.INSTANCE.DestroyNUIMotor( motor );    	
  CLNUI.INSTANCE.DestroyNUICamera( camera );    	

  super.stop();
}


void clearHandSmooth(int x, int y,int loc)
{
  if(x<w-(xLens-1)/2-1&&y<h-(yLens-1)/2-1) // clears handSmooth one x and y value in front of the smoothing lens
  {
    handSmooth.pixels[loc+(xLens-1)/2+(yLens-1)/2*w]=color(0);
  }
}      


void clearXProjection(int loc) // clears xProjection
{
  xProjection.pixels[loc] = color (0);
}

void clearYProjection(int loc) // clears yProjection
{
  yProjection.pixels[loc] = color (0);
}

void clearHandTrace(int loc) // clears handTrace
{
  handTrace.pixels[loc] = color (0);
}
void clearHand(int loc) // clears hand
{
  hand.pixels[loc] = color (0);
}
void clearHandFat(int loc) // clears hand
{
  handFat.pixels[loc]=color(0);
}


void hand(int loc,int y,float bl,float re) //draws hand
{
  if(bl>250&&re>1&&y<tempRelMinYOfXProj)
  {
    hand.pixels[loc]=color(0,255,0);
  }
}  

void neuralNetwork(float f1,float f2,float f3,float f4,float f5,float v1,float v2,float v3,float v4)
{
  //inputs
  float x1A = f1+0.1;  
  float x2A = f2+0.1;
  float x3A = f3+0.1;
  float x4A = f4+0.1;
  float x5A = f5+0.1;
  float x6A = v1+0.1;
  float x7A = v2+0.1;
  float x8A = v3+0.1;
  float x9A = v4+0.1;



  //initial weights
  //input layer weights
  float w1A = -0.7730226;
  float w1B = 0.7183541;
  float w1C = -0.6928675;
  float w1D = 0.5296034;
  float w1E = 0.8375236;
  float w2A = -0.51678956;
  float w2B = -0.31572336;
  float w2C = -0.8320275;
  float w2D = -0.24141584;
  float w2E = -0.95364016;
  float w3A = -0.5566789;
  float w3B = 0.94730735;
  float w3C = 0.26510268;
  float w3D = 0.8865323;
  float w3E = -0.15867522;
  float w4A = -0.49440315;
  float w4B = 0.7721455;
  float w4C = -0.262894;
  float w4D = 0.94908196;
  float w4E = -0.39958116;
  float w5A = 0.08508696;
  float w5B = 0.27202654;
  float w5C = -1.0197405;
  float w5D = -0.008199202;
  float w5E = -1.0913138;
  float w6A = -0.49093857;
  float w6B = 0.8819983;
  float w6C = 0.10008627;
  float w6D = 1.0063748;
  float w6E = -0.21145786;
  float w7A = 0.44217157;
  float w7B = 0.0989018;
  float w7C = 0.3772578;
  float w7D = 0.3345932;
  float w7E = 0.987472;
  float w8A = 0.89786;
  float w8B = 1.0219779;
  float w8C = -0.3381234;
  float w8D = -0.8775543;
  float w8E = 0.581145;
  float w9A = -0.62561995;
  float w9B = 0.002124509;
  float w9C = -0.54920745;
  float w9D = 0.5327601;
  float w9E = -0.86570156;

  //output layer weights
  float w1 = -0.1945392;
  float w2 = 0.79378915;
  float w3 = -0.32651442;
  float w4 = 0.55492806;
  float w5 = -0.9274519;

  //node inputs and outputs
  float y;
  float y1_in;
  float y1_out;
  float y2_in;
  float y2_out;
  float y3_in;
  float y3_out;
  float y4_in;
  float y4_out;
  float y5_in;
  float y5_out;

String result;

  //euler's number
  float e = (float) Math.E;










  //forward pass and y output 
 
    //calculate hidden layer inputs 
    //calculate hidden layer inputs 
    y1_in = x1A*w1A + x2A*w2A + x3A*w3A + x4A*w4A + x5A*w5A + x6A*w6A + x7A*w7A + x8A*w8A + x9A*w9A;
    y2_in = x1A*w1B + x2A*w2B + x3A*w3B + x4A*w4B + x5A*w5B + x6A*w6B + x7A*w7B + x8A*w8B + x9A*w9B;
    y3_in = x1A*w1C + x2A*w2C + x3A*w3C + x4A*w4C + x5A*w5C + x6A*w6C + x7A*w7C + x8A*w8C + x9A*w9C;
    y4_in = x1A*w1D + x2A*w2D + x3A*w3D + x4A*w4D + x5A*w5D + x6A*w6D + x7A*w7D + x8A*w8D + x9A*w9D;
    y5_in = x1A*w1E + x2A*w2E + x3A*w3E + x4A*w4E + x5A*w5E + x6A*w6E + x7A*w7E + x8A*w8E + x9A*w9E;

    //calclute hidden layer outputs rounded to 4 decs
    y1_out = 1/(1+pow(e,-y1_in));
    y2_out = 1/(1+pow(e,-y2_in));
    y3_out = 1/(1+pow(e,-y3_in));
    y4_out = 1/(1+pow(e,-y4_in));
    y5_out = 1/(1+pow(e,-y5_in));


    // calculate y output to 4 decs
    y = y1_out*w1 + y2_out*w2 + y3_out*w3 + y4_out*w4 +y5_out*w5;
 
//displays result
fill(255);
textFont(ft2,100);
if(y<0.3)
{
 text ("U",w-40,h-50);
}
else if (y>=0.3&&y<0.5)
{
  text ("I",w-40,h-50);
}  
if(y>=0.5&&y<0.7)
{
  text ("4",w-40,h-50);
}
else if (y>=0.7)
{
  text ("5",w-40,h-50);
} 



  //prints the input values, outputs value, output target, pass number and learning rate
 
    println();
    print("_INPUTS");
    println();
    print("x1A = " + x1A);
    println();
    print("x2A = " + x2A);
    println();
    print("x3A = " + x3A);
    println();
    print("x4A = " + x4A);
    println();
    print("x5A = " + x5A);
    println();
    print("x6A = " + x6A);
    println();
    print("x7A = " + x7A);
    println();
    print("x8A = " + x8A);
    println();
    print("x9A = " + x9A);
    println();


    print("Output");
    println();
    print("y_out = " + y);
    println();
    
    
  
}



void boundaryBin(int loc)
{
  if (loc%w>0&&loc/w>0&&loc%w<w-1&&loc/w<h-1)
  {
    int neighbours =0; //clears value of number of pixels in a 3*3 square around the pixel at loc
    int xLens=3;
    int yLens=3;
    int  x3=loc%w;
    int y3=loc/w;
    float bl=blue (handFat.pixels[loc]);
    float re=red (handFat.pixels[loc]);

    if (x3>(xLens-1)/2&&y3>(yLens-1)/2&&x3<w-(xLens-1)/2-1&&y3<h-(yLens-1)/2-1)//ensures averaging lense stays within boundary of image
    {

      for (int x=0;x<xLens;x++)
      { 
        for (int y=0;y<yLens;y++)
        {
          int locTemp = loc+x+y*w-(xLens-1)/2-((yLens-1)/2)*w; //temp position of pixel in square to be tested
          float blTemp=blue (handFat.pixels[locTemp]);
          float reTemp=red (handFat.pixels[locTemp]); 
          if (blTemp>250&&reTemp>1)
          {
            neighbours++;
          }
        }
      }
      if(neighbours<xLens*yLens&&bl>250&&re>1&&loc/w<h-3)
      {
        boundaryBin=true;
         //handFat.pixels[loc]=color(255,0,0);
         
      }

      else 
      {
        boundaryBin=false;

      }
    }
  }
  else
  {
    boundaryBin=false;

  }
}

void boundaryNeighbours (int loc) // test nnumber of neighbours that are boundary pixels
{
  boundaryNeighbours = 0;
  boundaryBin(loc-1);
  if(boundaryBin==true)
  {
    boundaryNeighbours++;
  }
  boundaryBin(loc-w);
  if(boundaryBin==true)
  {
    boundaryNeighbours++;
  } 
  boundaryBin(loc+1);
  if(boundaryBin==true)
  {
    boundaryNeighbours++;
  }
  boundaryBin(loc+w);
  if(boundaryBin==true)
  {
    boundaryNeighbours++;
  }
}  
void boundary(int loc)
{
  if (loc%w>0&&loc/w>0&&loc%w<w-1&&loc/w<h-1)
  {
    int neighbours =0; //clears value of number of pixels in a 3*3 square around the pixel at loc
    int xLens=3; //chagnes size of permiter removal
    int yLens=3;
    int  x3=loc%w;
    int y3=loc/w;
    float bl=blue (depthData.pixels[loc]);
    float re=red (depthData.pixels[loc]);

    if (x3>(xLens-1)/2&&y3>(yLens-1)/2&&x3<w-(xLens-1)/2-1&&y3<h-(yLens-1)/2-1)//ensures averaging lense stays within boundary of image
    {

      for (int x=0;x<xLens;x++)
      { 
        for (int y=0;y<yLens;y++)
        {
          int locTemp = loc+x+y*w-(xLens-1)/2-((yLens-1)/2)*w; //temp position of pixel in square to be tested
          float blTemp=blue (depthData.pixels[locTemp]);
          float reTemp=red (depthData.pixels[locTemp]); 
          if (blTemp>250&&reTemp>1)
          {
            neighbours++;
          }
        }
      }
      if(neighbours<xLens*yLens&&bl>250&&re>1&&loc/w<h-3)
      {
        boundary=true;
         //handTrace.pixels[loc]=color(255);
      }

      else 
      {
        boundary=false;

      }
    }
  }
  else
  {
    boundary=false;

  }
}

void edge(int maxPoint)
{

  boolean change=false;
  boolean complete=false;
  boolean firstSearch=true;
  int loc=maxPoint; //location
  int up=-w;
  int down=w;
  int left=-1;
  int right=1;
  int r = (int) random (0,255); //red
  int g = (int) random (0,255); //green
  int b = (int) random (0,255); //blue
  int locP1 =0;// 1st previous loc positon
  int locP2 =0;// 2nd previous loc 
  int locP3 =0;// 3rd previous loc 
  int locP4 =0;// 4th previous loc 
  boolean junction =false; // true if there is a junction
  int junction1=1; //1st previous junction positon
  int junction1Prev=2;//position before junction position
  int junction1Post=3;//position after most recent junction

  int  junction2=3;// 2nd previous junciton posiiton
  int  junction2Prev=4; //2dn previous position before junction position
  int  junction2Post=5; //position after 2nd last junction junction position

  int  junction3=6;// 3rd previous junciton posiiton
  int  junction3Prev=7; //3rd previous position before junction position
  int  junction3Post=8; //position after 3rd last junction position

  int k=0; //edge array index
  int xPoint=0; //x point of vertex on smoothed hand
  int yPoint=0; //y point of vertex on smoothed hand
  int counter =1; //counts numberof indexes in edgeSmooth
  int   centroidX=0;
  int  centroidY=0;

  int aveX=0;
  int aveY=0;

  //to calculate angles between points

  int pass =0; //corresponds to previous m for identified point/valley
  int xPointP4=0;  //2 previous x and y positions to find anles
  int   yPointP4=0;

  int  xPointP3=0;
  int  yPointP3=0;   
  int xPointP2=0;  //2 previous x and y positions to find anles
  int   yPointP2=0;

  int  xPointP1=0;
  int  yPointP1=0;
  float angleB=0; //angle abc between last three points 

  int [] fingertip = new int  [7]; // array and indexes to store fingertip and valley points
  int fin =0;
  int [] valley = new int  [7];
  int val =0;
  int [] fingerDir=new int [7];
  
  float [] valleyNN = new float  [7]; //distances for neural network
  float [] fingertipNN=new float [7];

  int flagTip=0; //test if a fingertip has been detected

  int xTipAve=0; //average of previous x fingertip coords for points in a small space
  int tipX =0; //last x coord of fingertip 
  int yTipAve=0;
  int tipY =0;

  int    xPointP12=0;   //previous tip coordiantes for proximate tips
  int    xPointP11=0;
  int  yPointP12=0; 
  int  yPointP11=0;
  int avePass=1;
  
  
  int testXAve=0; //average loc of test for tips
  int testYAve=0;
  int testY1=0; //test coordiantes stored in the first instance before averaging
  int testX1=0;
 int   testXP2=0; //previous tip test for proximate tips
 int        testXP1=0;
   int      testYP2=0;
   int      testYP1=0;





  for(int i=1;complete==false&&i<w*3;i++)
  {



    //boundary neighbour check
    boundaryNeighbours(loc);// checks how many neighbour pixels are also edge pixels above,below left and right (max4)
    if (boundaryNeighbours>2)
    {
      junction3=junction1; //3rd previous junction
      junction3Prev=junction1Prev;//pixel before 3rd previous junction
      junction2=junction1; //2nd previous junction
      junction2Prev=junction1Prev;//pixel before 2nd previous junction
      junction1=loc; //pixel is a juncton
      junction1Prev=locP1; //edge pixel before first junction pixels
      //        r= (int) random(0,255);
      //        g= (int) random(0,255);
      //        b= (int) random(0,255);
      junction = true;
    }
    //left
    boundaryNeighbours(loc+left);//tests for dead end (if<2)
    boundaryBin(loc+left); //check if left pixel is part of edge
    if (boundaryBin==true&&boundaryNeighbours>1&&loc+left!=locP1&&loc+left!=junction1Post) // if so  colour it
    {
      locP4=locP3;
      locP3=locP2;
      locP2=locP1;
      locP1=loc;
      loc=loc+left;
      // handTrace.pixels[loc]=color(r,g,b);
      edge[k] = loc;
      k++;
      change=true;
      prnt(loc,i);
      if (junction==true) //test if previos position was junction and remembers position after last 3 junctions
      {
        junction3Post=junction2Post;
        junction2Post=junction1Post;
        junction1Post=loc;
        junction=false;
      }
    }
    if (firstSearch==false&&loc==maxPoint)
    {
      complete=true;
    }


    // up

    //boundary neighbour check
    boundaryNeighbours(loc);// checks how many neighbour pixels are also edge pixels above,below left and right (max4)
    if (boundaryNeighbours>2)
    {
      junction3=junction1; //3rd previous junction
      junction3Prev=junction1Prev;//pixel before 3rd previous junction
      junction2=junction1; //2nd previous junction
      junction2Prev=junction1Prev;//pixel before 2nd previous junction
      junction1=loc; //pixel is a juncton
      junction1Prev=locP1; //edge pixel before first junction pixels
      //        r= (int) random(0,255);
      //        g= (int) random(0,255);
      //        b= (int) random(0,255);
      junction = true;
    }
    //up
    boundaryNeighbours(loc+up); //tests for dead end (if<2)
    boundaryBin(loc+up); //check if up pixel is part of edge
    if (boundaryBin==true&&boundaryNeighbours>1&&loc+up!=locP1&&loc+up!=junction1Post) // if so  colour it
    {
      locP4=locP3;
      locP3=locP2;
      locP2=locP1;
      locP1=loc;
      loc=loc+up;
      // handTrace.pixels[loc]=color(r,g,b);
      edge[k] = loc;
      k++;

      if (junction==true) //test if previos position was junction and remembers position after last 3 junctions
      {
        junction3Post=junction2Post;
        junction2Post=junction1Post;
        junction1Post=loc;
        junction=false;
      }
    }
    if (firstSearch==false&&loc==maxPoint)
    {
      complete=true;
    }


    //right

    //boundary neighbour check
    boundaryNeighbours(loc);// checks how many neighbour pixels are also edge pixels above,below left and right (max4)
    if (boundaryNeighbours>2)
    {
      junction3=junction1; //3rd previous junction
      junction3Prev=junction1Prev;//pixel before 3rd previous junction
      junction2=junction1; //2nd previous junction
      junction2Prev=junction1Prev;//pixel before 2nd previous junction
      junction1=loc; //pixel is a juncton
      junction1Prev=locP1; //edge pixel before first junction pixels
      //        r= (int) random(0,255);
      //        g= (int) random(0,255);
      //        b= (int) random(0,255);
      junction = true;
    }
    //right
    boundaryNeighbours(loc+right);//tests for dead end (if<2)
    boundaryBin(loc+right); //check if right pixel is part of edge
    if (boundaryBin==true&&boundaryNeighbours>1&&loc+right!=locP1&&loc+right!=junction1Post) // if so  colour it
    {
      locP4=locP3;
      locP3=locP2;
      locP2=locP1;
      locP1=loc;
      loc=loc+right;
      // handTrace.pixels[loc]=color(r,g,b);
      edge[k] = loc;
      k++;
      change=true;
      prnt(loc,i);
      if (junction==true) //test if previos position was junction and remembers position after last 3 junctions
      {
        junction3Post=junction2Post;
        junction2Post=junction1Post;
        junction1Post=loc;
        junction=false;
      }
    }
    if (firstSearch==false&&loc==maxPoint)
    {
      complete=true;
    }

    //down

    // boundary neighbour check
    boundaryNeighbours(loc);// checks how many neighbour pixels are also edge pixels above,below left and right (max4)
    if (boundaryNeighbours>2)
    {
      junction3=junction1; //3rd previous junction
      junction3Prev=junction1Prev;//pixel before 3rd previous junction
      junction2=junction1; //2nd previous junction
      junction2Prev=junction1Prev;//pixel before 2nd previous junction
      junction1=loc; //pixel is a juncton
      junction1Prev=locP1; //edge pixel before first junction pixels
      //        r= (int) random(0,255);
      //        g= (int) random(0,255);
      //        b= (int) random(0,255);
      junction = true;
    }


    //down
    boundaryNeighbours(loc+down);//tests for dead end (if<2)
    boundaryBin(loc+down); //check if down pixel is part of edge
    if (boundaryBin==true&&boundaryNeighbours>1&&loc+down!=locP1&&loc+down!=junction1Post) // if so  colour it
    {
      locP4=locP3;
      locP3=locP2;
      locP2=locP1;
      locP1=loc;
      loc=loc+down;
      //handTrace.pixels[loc]=color(r,g,b);
      edge[k] = loc;
      k++;
      change=true;
      prnt(loc,1);
      if (junction==true) //test if previos position was junction and remembers position after last 3 junctions
      {
        junction3Post=junction2Post;
        junction2Post=junction1Post;
        junction1Post=loc;
        junction=false;
      }
    }
    if (loc==maxPoint)//search is complete
    {
      complete=true;
    }

    if (loc==locP4||loc==junction1||loc==junction2) //search is stuck so start again
    {
      complete=true;
    }
  }

  //displays averaged trace array 
  int f=25; //filter size
  int freq=15; //frequency of samples from fitlered array (edgeSmooth)


  beginShape();

  for (int m=(f-1)/2;m<k-(f+1)/2;m=m+freq)
  {
    aveX=0;
    aveY=0;

    for (int n=-1*(f-1)/2;n<(f+1)/2;n++)
    {
      aveX=edge[m+n]%w+aveX;
      aveY=edge[m+n]/w+aveY;
    }
    aveX=aveX/f;
    aveY=aveY/f;
    edgeSmooth[m]=aveX+aveY*w;


    //prevSmooth=edgeSmooth[m]
    stroke (255);
    fill (255);




    xPointP2=xPointP1;   //2 previous x and y positions to find angles
    yPointP2=yPointP1;
    xPointP1=xPoint;
    yPointP1=yPoint;
    xPoint=edgeSmooth[m]%w;
    yPoint=edgeSmooth[m]/w;

    float  ab = dist (xPoint,yPoint,xPointP1,yPointP1);   //finds angle between three previous points
    float  bc = dist (xPointP1,yPointP1,xPointP2,yPointP2);    
    float ac = dist (xPoint,yPoint,xPointP2,yPointP2);
    angleB = acos((ab*ab+bc*bc-ac*ac)/(2*ab*bc));
  

    fill(10);
    curveVertex (xPoint*800/w,yPoint*600/h); //draws line between every x points in array




    centroidX=centroidX+xPoint;   //finds average x value of vertices for centroid
    centroidY=centroidY+yPoint;  // finds ave y"""" 
    counter++;

    //finds fingertips
    if(angleB<2.2&&yPointP1<maxPoint/w-20)    
    {

      int acAveX=(xPoint+xPointP2)/2;   // average of x coords of point next to identified angle point
      int acAveY= (yPoint+yPointP2)/2;// average of y coords of point next to identified angle point


      int P1DiffX = 5*(xPointP1-acAveX)/2; //find the difference between the middle point and the points on either side
      int P1DiffY = 5*(yPointP1-acAveY)/2;

      int testX=xPointP1+P1DiffX; //find pixel to test for fingertip or valley
      int testY=yPointP1+P1DiffY;

      float bl = blue (handFat.pixels[testX+testY*w]);// test the pixel a differences length past the P1 ie further in to the hand for valleys and further out from the finger for fingertips


      if (m<pass+40&&flagTip==1&&fin>0) // remembers history of fingertip points that are close together
      {

        xPointP12=xPointP11; 
        xPointP11=xPointP1;
        yPointP12=yPointP11; 
        yPointP11=yPointP1;
        
        testXP2=testXP1;
        testXP1=testX;
        testYP2=testYP1;
        testYP1=testY;
        
        avePass++;
      }  



      if (m>pass+40) //prevents more than one point being identified every x coordinates along edge
      {   
        if(avePass>1) //find average of fingertip pixels that are close together
        {
          xTipAve= (tipX+xPointP11+xPointP12)/avePass;
          yTipAve= (tipY+yPointP11+yPointP12)/avePass;
          testXAve= (testX1+testXP1+testXP2)/avePass;
          testYAve= (testY1+testYP1+testYP2)/avePass;
          
          fingertip[fin-1]=xTipAve+yTipAve*w;
          fingerDir[fin-1]=testXAve+testYAve*w;
          avePass=1;
          xPointP12=0; 
          xPointP11=0;
          yPointP12=0; 
          yPointP11=0;
           testXP2=0;
         testXP1=0;
        testYP2=0;
        testYP1=0;
       
          
          
        }

        if (bl==0&&fin<5) //finds fingertips
        {
          tipX=xPointP1;
          tipY= yPointP1;
          fingertip[fin] = xPointP1+yPointP1*w;
          testX1=testX;
          testY1=testY;
          fingerDir[fin]= testX+testY*w;
          fin++;
          flagTip=1;
        }


        if(bl==255&&val<4&&flagTip==1) //finds valleys
        {
          valley[val] = xPointP1+yPointP1*w;
          val++;
          flagTip=0;
        }
        pass=m;
      }
    }
  }

  curveVertex(edgeSmooth[(f-1)/2]%w*800/640,edgeSmooth[(f-1)/2]/w*600/480); //draws line between first and last point
  endShape(CLOSE);
  centroidX=centroidX/counter*800/640;   
  centroidY=centroidY/counter*600/480;
  fill(255,0,0);
  ellipse(centroidX,centroidY,10,10);

  for(int i=0; i<fin+1;i++) //displays fingertips and direction
  {
    noStroke();
    fill(255,0,0);
    ellipse (fingertip[i]%w*800/w,fingertip[i]/w*600/h,10,10);
   fill(0);
    ellipse (fingertip[i]%w*800/w,fingertip[i]/w*600/h,6,6);
    
    if(fingertip[i]>0)
    {
     stroke(170,10,200); 
    line(fingertip[i]%w*800/w,fingertip[i]/w*600/h,fingerDir[i]%w*800/w,fingerDir[i]/w*600/h);
    float distanceF = (dist(centroidX,centroidY,fingertip[i]%w*800/w,fingertip[i]/w*600/h)/230)*0.8; //normalised between 0.1 and 0.9 for NN
    fingertipNN[i]=distanceF;
   
    stroke(0,255,255);
    line(centroidX,centroidY,fingertip[i]%w*800/w,fingertip[i]/w*600/h);
    }
    fill(0,255,255);
     textFont(ft,18);
    text (i+1,(fingerDir[i]%w+10)*800/w,(fingerDir[i]/w)*600/h);
    fill (100,100,180);
    ellipse (fingerDir[i]%w*800/w,fingerDir[i]/w*600/h,2,2);
  }
  
  for(int i=0; i<val+1;i++) //displays valleys
  {
    if(valley[i]>0)
    {
    fill(230,180,40);
    noStroke();
    ellipse (valley[i]%w*800/w,valley[i]/w*600/h,5,5);
    fill(0);
    ellipse (valley[i]%w*800/w,valley[i]/w*600/h,2,2);
    fill(0,255,0);
    text (i+1,(valley[i]%w+10)*800/w,(valley[i]/w)*600/h);
    stroke(0,255,0);
    line(centroidX,centroidY,valley[i]%w*800/w,valley[i]/w*600/h);
    float distanceV = (dist(centroidX,centroidY,valley[i]%w*800/w,valley[i]/w*600/h)/230)*0.8; //normalised between 0.1 and 0.9 for NN
    valleyNN[i]=distanceV;
    }
  } 
  
  if(analyse==true) //runs nerual network once
  {
  neuralNetwork(fingertipNN[0],fingertipNN[1],fingertipNN[2],fingertipNN[3],fingertipNN[4],valleyNN[0],valleyNN[1],valleyNN[2],valleyNN[3]); 
  analyse =false;
  }
  //clears arrays storing tips and valleys
   for(int i=0; i<fin+1;i++)
  {
    
    fingertip[i]=0;
    fingertipNN[i]=0;
  }  
  for(int i=0; i<val+1;i++)
  {
    valley[i]=0;
    valleyNN[i]=0;
  }
}


void handFat(int loc)
{
  boundary(loc);
  if(boundary==true)
  {
    handFat.pixels[loc]=color(0);
  }  
    
  
   int expansion =7 ;
  if(boundary==false&&loc%w>(expansion-1)/2&&loc/w>(expansion-1)/2) //fattens hand
  {
    for (int x=-1*(expansion-1)/2;x<(expansion+1)/2;x++)
    { 
      for (int y=-1*(expansion-1)/2;y<(expansion+1)/2;y++)
      {

        handFat.pixels[loc+x+y*w]=color(255,255,255);
        maxPoint=loc; //this should be loc+x+y*w not sure why it works like this
      }
    }
  }
}



void smoothPixels(int x3, int y3,int loc,float bl, float re)
{

  if (x3>(xLens-1)/2&&y3>(yLens-1)/2&&x3<w-(xLens-1)/2-1&&y3<h-(yLens-1)/2-1&&bl>250&&re>1)//ensures averaging lense stays within boundary of image
  {


    //clears value for active neighbours 
    int pixelQuant=0; // number of active pixels to use as divisor

    //test for active pixels in a 5*5 squaree
    int totX = 0;
    int totY =0;
    int smoothedLoc=0;
    int xAvg=0;
    int yAvg=0;


    for (int x=0;x<xLens;x++)
    { 
      for (int y=0;y<yLens;y++)
      {

        int locTemp = loc+x+y*w-(xLens-1)/2-((yLens-1)/2)*w; //temp position of pixel in square to be tested

        float slTemp=blue (depthData.pixels[locTemp]);
        float reTemp=red (depthData.pixels[locTemp]);
        if (slTemp>250&&reTemp>1&&(abs ((loc%w)-(locTemp%w))+ abs((loc/w)-(locTemp/w))   )<(xLens-1)/2)//sets lens shape

        {

          totX=totX+x;
          totY=totY+y;
          pixelQuant++;
          //          if (loc==w/2+h/2*w)
          //          {
          //            handSmooth.pixels[locTemp]=color(0,255,0);//shows lens shape
          //          }
        }
      }
    }

    xAvg=totX/pixelQuant;
    yAvg=totY/pixelQuant;
    smoothedLoc = loc+xAvg+yAvg*w-(xLens-1)/2-((yLens-1)/2)*w;
    if(pixelQuant<=proxFilter)
    {
      handSmooth.pixels[smoothedLoc]=color(0); // clears pixels with fewer than 36 neighbours
    }
    else
    {
      handSmooth.pixels[smoothedLoc]=color(0,255,0);//draws smoothed hand
      // handSmooth.pixels[smoothedLoc-w]=color(0,255,0);
      //handSmooth.pixels[smoothedLoc+w]=color(0,255,0);
      //handSmooth.pixels[smoothedLoc-1]=color(0,255,0);
      //handSmooth.pixels[smoothedLoc+1]=color(0,255,0);
      //  handSmooth.pixels[smoothedLoc-w-1]=color(0,255,0);
      //  handSmooth.pixels[smoothedLoc+w+1]=color(0,255,0);
      //  handSmooth.pixels[smoothedLoc+w-1]=color(0,255,0);
      //  handSmooth.pixels[smoothedLoc-w+1]=color(0,255,0);
    }
  }
}

void xProjection (int x,int y,float bl,float re)
{
  if (y==h-1&&x==w-1) // clears array caontiang x values of projection 
  {
    for (int i=0; i<xPos.length;i++)
    {
      xPos[i]=0;
    }
  }    
  int sumXPosArray=0;//sum of values in array


  if(bl>250&&re>1)
  {

    xOfXProj++;
  } 


  if(x==w-1)
  {
    for (int i=0; i<xPos.length-1;i++) // stores new x value in array and shift previous x values down one place
    {
      xPos[i] = xPos[i+1];
    }

    xPos[xPos.length-1] = xOfXProj;

    for (int i=0; i<xPos.length;i++) // sum array
    {
      sumXPosArray+=xPos[i];
    }  
    xProjXAve=sumXPosArray/xPos.length; //mean of x values in projection over xPos.length

      if (maxXOfXProj<xProjXAve) // finds maximum x value of x projection
    {
      maxXOfXProj=xProjXAve;
      maxYOfXProj=yOfXProj-(xPos.length-1)/2;
    }  
    if (relMinXOfXProj>xProjXAve&&y>tempMaxYOfXProj&&y<h-(xPos.length-1)/2)//finds relative minimum x value of x projection to isolate hand from arm
    {
      relMinXOfXProj=xProjXAve;
      relMinYOfXProj=yOfXProj-(xPos.length-1)/2;
    }  




    if(y>(xPos.length-1)/2) //keeps array in bounds
    {
      xProjection.pixels[xProjXAve+yOfXProj*w-(xPos.length-1)/2*w] = color(0,255,0); //displays average of x positions of pixels contained in array
    }

    xOfXProj=0;//reset x value
    yOfXProj=y; //next y position
  }
}


void xProjectionMax()
{

  fill(255,0,0);
  ellipse(maxXOfXProj*400/w,maxYOfXProj*300/h+300,10,10);
  tempMaxXOfXProj=maxXOfXProj; //stores previus x value of maximum for use in midPoint of hand finder
  maxXOfXProj=0; //clears y coord of maximum x
  tempMaxYOfXProj=maxYOfXProj; //stores previus x value of maximum for use in midPoint of hand finder
  maxYOfXProj=0; //clears y coord of maximum x
}

void  xProjectionRelMin()
{
  fill (0,0,255);
  ellipse(relMinXOfXProj*400/w,relMinYOfXProj*300/h+300,10,10);
  tempRelMinYOfXProj=relMinYOfXProj;
  relMinXOfXProj=w; //clears y coord of maximum x
  relMinYOfXProj=h; //clears y coord of maximum x
} 
 void yProjection (int x,int y,float bl,float re)
    {
     
      if (y==tempRelMinYOfXProj-1&&x==w-1) // clears array caontiang y values of projection 
      {
        for (int i=0; i<yPos.length;i++)
        {
          yPos[i]=0;
        }
      }    
      int sumYPosArray=0;//sum of values in array


      if(bl>250&&re>1&&y<tempRelMinYOfXProj)                                                                                                                                      
      {

        yOfYProj++;
      } 


      if(tempRelMinYOfXProj>(xPos.length-1)/2&&tempRelMinYOfXProj<h-(xPos.length-1)/2&&y==tempRelMinYOfXProj-1)
      {
        
        for (int i=0; i<yPos.length-1;i++) // stores new y value in array and shift previous y values down one place
        {
          yPos[i] = yPos[i+1];
        }

        yPos[yPos.length-1] = yOfYProj;
        println(yOfYProj);

        for (int i=0; i<yPos.length;i++) // sum array
        {
          sumYPosArray= sumYPosArray+ yPos[i];
        }  




        yProjYAve=sumYPosArray/yPos.length; //mean of y values in projection over yPos.length

          if (maxYOfYProj<yProjYAve)
        {
          maxYOfYProj=yProjYAve;
          maxXOfYProj=xOfYProj-(yPos.length-1)/2;
        }  




        if(x>(yPos.length-1)/2) //keeps array in bounds
        {
          
          yProjection.pixels[xOfYProj+yProjYAve*w-(yPos.length-1)/2] = color(0,255,0); //displays average of y positions of pixels contained in array
        }


        yOfYProj=0;//reset x value
        xOfYProj=x; //next y position
      }
     
    }

 void yProjectionMax()
    {

      fill(255,0,0);
      ellipse(maxXOfYProj*400/w,maxYOfYProj*300/h,10,10);
      tempMaxYOfYProj=maxYOfYProj; //stores previus y value of maximum for use in midPoint of hand finder
      maxYOfYProj=0; //clears y coord of maximum Y
      tempMaxXOfYProj=maxXOfYProj; //stores previus x value of maximum for use in midPoint of hand finder
      maxXOfYProj=0; //clears X coord of maximum Y
    }



