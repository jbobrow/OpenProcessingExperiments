
// Animation basic was used as source.

float [][] currentPosition ={{0, 0, 0}, {0, 0, 0}, {0, 0, 0}};
int currentSize=0;
float imageratio;
boolean [][] currentState={{false, false, false}, {false, false, false}, {false, false, false}};
boolean [][] transformState={{false, false, false}, {false, false, false}, {false, false, false}};
Float [][] speedAdjust={{1.0, 1.0, 1.0}, {1.0, 1.0, 1.0}, {1.0, 1.0, 1.0}};
PImage [] images;
PImage [] imagesx;
PImage img;

// a boolean variable to control
// whether the animation is playing
boolean playing = false;
boolean expanding = false;
boolean flagrandom=false;
boolean startupflag=true;

void setup()
{
    images = loadImages("Animation_data/movie", ".jpg", 99);
    imagesx = loadImages("Animation_data/vid0", ".jpg", 99);    
    img = loadImage("startup.jpg");
    //size(images[0].width, images[0].height);
    //size(images[0].width*3, images[0].height*3);
    size(900, 600);
    imageratio = (float) images[0].height/images[0].width;    
}

void draw()
{ 
  if(startupflag){
    image(img,0,0);
 
  } else
  
  {

  if(!expanding){
    for(int i=0; i < 3; i++)
      { 
       for (int j=0; j<3; j++)
        {
         float r = random(10);
          if (r>5){
            transformState[i][j]=true; 
          } 
             
        } 
      }
     expanding=true;
     } 
  
  for(int i=0; i < 3; i++)
    { 
     for (int j=0; j<3; j++)
      {   
        if(!currentState[i][j])
        {
          image(images[(int)currentPosition[i][j]], images[0].width*i, images[0].height*j);  
        } else {         
          image(imagesx[(int)currentPosition[i][j]], images[0].width*i, images[0].height*j);                  
        }
        if(transformState[i][j])
        {
         image(imagesx[(int)currentPosition[i][j]], images[0].width*i, images[0].height*j, currentSize , currentSize*imageratio);
         //println(imageratio);         
        }
        
      } 
    }
       
  if(playing)
  {
   for(int i=0; i < 3; i++)
    { 
     for (int j=0; j<3; j++)
      {      
      currentPosition[i][j] = currentPosition[i][j] +1*speedAdjust[i][j];
      if(currentPosition[i][j] >= images.length)   
      {
         currentPosition[i][j] = 0;
      }
      }
    }
    
      if(expanding)
      {  currentSize +=1;
         if(currentSize > images[0].width)
         {
           currentSize=0;
           expanding=false;
         } 
      }      
    
  }
  }
}


void mousePressed()
{
 
 int i=(int) map (mouseX, 0, width, 0,3);
 int j=(int) map (mouseY, 0, height, 0,3);  
 //println(i);
 //println(j);
 //println("sffds");
 if ((i<1)&&(j<1)) { 
  playing = !playing;
  startupflag=false;
   }
  
}

void mouseDragged() {
 
 int i=(int) map (mouseX, 0, width, 0,3);
 int j=(int) map (mouseY, 0, height, 0,3);
       
   speedAdjust[i][j]=map(mouseX,images[0].width*i,images[0].width*(i+1),0,2);
  
}

//The MIT License (MIT)

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



PImage [] loadImages(String stub, String extension, int numImages)
{
  PImage [] images = new PImage[0];
  for(int i =0; i < numImages; i++)
  {
    PImage img = loadImage(stub+i+extension);
    if(img != null)
    {
      images = (PImage [])append(images,img);
    }
    else
    {
      break;
    }
  }
  return images;
}


