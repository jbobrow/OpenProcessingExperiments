
import fullscreen.*;


SoftFullScreen fs; 
float theta=0; //for reset
float r=5;    //for reset
float sizes=32; //for reset
PImage[] img=new PImage[20];
float theta1=0;
float x1,y1;  
float r1=5;
float sizes1=32;
int c=1;
int i=0;
int j=0;
int count;
int m=1;
int imgcount;
int kl;
float clickcount=0;



Process p;
int mycount=0;


float rarr[]=new float[20];
float thetaarr[]=new float[20];
float sizesarr[]=new float[20];

void setup()
{fs = new SoftFullScreen(this); 
  
  // enter fullscreen mode
  fs.enter(); 
  size(900,700,P3D);
  background(0);
  //smooth();

  for(int i=0;i<20;i++)
    img[i]=loadImage(i+".jpg");
  imgcount=1;
  
  frameRate(20);
}

void reset(int count)
{ 
  theta =theta1-0.04*count;
  r=r1-1*count;
  sizes=sizes1+0.2*count;

  // sizes=32;
}

void drawSpiral(int count,int i)

{ 

  image(img[i], rarr[i] * cos(thetaarr[i]),rarr[i] * sin(thetaarr[i]),img[i].width/sizesarr[i],img[i].height/ sizesarr[i]);
  rarr[i]+=1;
  thetaarr[i]=thetaarr[i]+0.04;

  if(sizesarr[i]>=5)
    sizesarr[i]-=0.2;
}


void draw()

{  
  pushMatrix();
  translate(width/2,height/2);


  pushMatrix();
  background(0);
  image(img[0],r1 * cos(theta1),r1 * sin(theta1),img[0].width/sizes1,img[0].height/sizes1);
  popMatrix();

  theta1 = theta1+.04;
  r1+=1;
  if(sizes1>5)
    sizes1-=0.2;

  count++;

//println("count:" + count);
//println("count remainder:" + count%20);
if((count % 20 == 0) && (imgcount <= 15))
  {
      reset(count);
    rarr[imgcount]=5;
    thetaarr[imgcount]=0;
    sizesarr[imgcount]=32;  

  
    imgcount++;
  }
  
     for(kl=1;kl<=15;kl++)
  {
     drawSpiral(count,kl);
  }
  
  
//---------------------2---------------------//


//  if(count==20)
//  { 
//    reset(count);
//    rarr[1]=5;
//    thetaarr[1]=0;
//    sizesarr[1]=32;
//  }
//
//  drawSpiral(count,1);
//
//  if(count==40)
//  {  
//    reset(count);
//    rarr[2]=5;
//    thetaarr[2]=0;
//    sizesarr[2]=32;
//  }
// drawSpiral(count,2);
//
//
//  if(count==60)
//  { 
//    reset(count);
//    rarr[3]=5;
//    thetaarr[3]=0;
//    sizesarr[3]=32;
//  }
 // drawSpiral(count,3);
//
//
//  if(count==80)
//  { 
//    reset(count);
//    rarr[4]=5;
//    thetaarr[4]=0;
//    sizesarr[4]=32;
//  }
//  drawSpiral(count,4);
//  
//if(count==100)
//  { 
//    reset(count);
//    rarr[5]=5;
//    thetaarr[5]=0;
//    sizesarr[5]=32;
//  }
//  drawSpiral(count,5);
//  
//  if(count==120)
//  { 
//    reset(count);
//    rarr[6]=5;
//    thetaarr[6]=0;
//    sizesarr[6]=32;
//  }
//  drawSpiral(count,6);
//  
//  if(count==140)
//  { 
//    reset(count);
//    rarr[7]=5;
//    thetaarr[7]=0;
//    sizesarr[7]=32;
//  }
//  
//  println("val 1=" + rarr[2]);
//   println("val 2=" + thetaarr[2]);
//   println("val 3=" + sizesarr[2]);
//  
//  drawSpiral(count,7);
  popMatrix();
  
 if(keyPressed)
{
  {try
    {
      Runtime rnt = Runtime.getRuntime();
          //mycount = 2;
          if(key=='h') 
          p = rnt.exec("D:/PROCESSING FOR DP3/Array2D_conect/application.windows/Array2D_conect.exe");
         
    }
    catch(Exception e)
    {
      println("Error");
      p.destroy(); 
    } 
  }
 
} 
  
}



/*void check()
{ //if(key=="W")//{
  //clickcount+=0.1;
    try
    {
      Runtime rnt = Runtime.getRuntime();
     
     if(mycount == 2)
          myfun();
          else
          {
          mycount = 2;
          p = rnt.exec("D:/PROCESSING FOR DP3/Array2D_conect/application.windows/Array2D_conect.exe");
          }
    }
    catch(Exception e)
    {
      println("Error");
    }
//}
}*/

void myfun()
{
  println("error");
  p.destroy();
 
}

