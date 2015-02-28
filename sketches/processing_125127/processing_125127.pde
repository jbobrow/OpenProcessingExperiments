
//Shanna Chan Fall 2013
// All Rights reserved
//homework 10 

//information from www.pinterest.com/pin/259801472226934000

//hover mouse over different types of food on the plate 
//see which wine pairing is the best

PImage [] wine;
float [] d;
float []x = {250,330, 430, 400, 550, 550, 500};
float []y = {350, 200, 290, 500, 420, 280, 210};


void setup()
{size (1500,700);
wine = new PImage[8];
for (int i=0; i<wine.length; i++)
{wine[i]= loadImage(i+".png");}






//http://www.pinterest.com/pin/259801472226934000/
draw();

}



void draw()
{ 
  d = new float [7];
for (int i=0; i<d.length; i++)
{d[i]= dist(x[i], y[i], mouseX,mouseY);}
 float mouseDist = 100;
 

 {
 if (d[0] <= mouseDist)
 
 {image(wine[1],1052, 0);}
  
    else if (d[6] <= mouseDist)
 {image(wine[7],1052, 0);}
  
  
    else if (d[4] <= mouseDist)
    {image(wine[5],1052, 0);}


  else if (d[1] <= mouseDist)
   {image(wine[2],1052, 0);}
 
  
    else if (d[3] <= mouseDist)
   {image(wine[4],1052, 0);}
 
    
    else if (d[5] <= mouseDist)
   {image(wine[6],1052, 0);}
  
  
  else if (d[2] <= mouseDist)
   {image(wine[3],1052, 0);}
 
  
  else 
  image(wine[0],0, 0);}


}



 


