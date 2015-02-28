
import processing.video.*;
Capture myCapture;

int[] xsize= new int[29];
int[] access= new int[29];
int[] xlocation= new int[29];
int[] ylocation= new int[29];
int[] ysize= new int[100];
int[] esize= new int[100];
int[] elocation= new int[100];
int[] zlocation= new int[100];
PImage[] images= new PImage[29];
PImage[] imageYou = new PImage[100];
int counter=0;
int fix=0;

PImage a;
void setup() 
{
  size(screen.width,screen.height); 
  myCapture = new Capture(this, width, height, 30);
 
 for(int a=0; a<=28; a++)
{
 images[a] = loadImage((a+1)+".gif");
}
}

void draw() {
   image(myCapture, 0, 0);
   if(mousePressed==true)
   {
     if(counter>=100)
     {
       counter=0;
     }
     else
     {
       
       imageYou[counter]=myCapture;
       zlocation[counter]=int(random(0,screen.width));
       elocation[counter]=int(random(0,screen.height));
       ysize[counter]=(screen.width);
       esize[counter]=(screen.height);
       counter++;
     }
   }
   for(int d=1; d<counter;d++)
   {
     
     if(ysize[d]>60&&esize[d]>30)
     {
       ysize[d]=ysize[d]-10;
     esize[d]=esize[d]-10;
     }
     else
     {
       ysize[d]=-0;
     esize[d]=-0;
     }
        zlocation[d]=zlocation[d]+int(random(-5,5));
        elocation[d]=elocation[d]+int(random(-5,5));
        image(imageYou[d],zlocation[d],elocation[d],ysize[d],esize[d]);
   }
  for(int b=0; b<=28;b++)
  {
    if(access[b]==1)
    {
      //println("im here");
      if (xsize[b]<200)
      {
        println("im here");
        xsize[b]=xsize[b]+1;
        xlocation[b]=xlocation[b]+int(random(-5,5));
        ylocation[b]=ylocation[b]+int(random(-5,5));
        image(images[b],xlocation[b],ylocation[b],xsize[b],xsize[b]);
      }
      else
      {
        xsize[b]=0;
        access[b]=0;
      }
    }
  }
  
 
 if(keyPressed){
   fix=int(random(29));
  // println("fix is "+fix);
   access[fix]=1;
   xlocation[fix]=int(random(0,screen.width));
   ylocation[fix]=int(random(0,screen.height));
  // println("im here");
  // println("access "+access[fix]);
   //image(a, mouseX, mouseY, 20, 20);
 }
 
  
}

void captureEvent(Capture myCapture) {
  myCapture.read();
}


