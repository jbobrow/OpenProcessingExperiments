
PGraphics pg,pg2;
PImage img,img2;
int  [ ] _pixels; 
/*
the array  _pixels has length equal to length width*heigth of the picture=number of pixels!
initially it has values from 0...width*heigth
after that we shuffle these values in order to have an array with all pixels
In every loop of draw() we choose the next pixel we want to swap 
So we swap every pixel "randomly"  and we will never swap this pixel again
*/


int current_pixel=0;
 
void setup()
{
  frameRate(2000);
    size(290,190,P2D);
      
     initialise();//initialise variables
    update();
    

}
 
 
void draw()
{
        image(pg,0,0,pg.width,pg.height);
      image(pg2,pg.width,0,pg2.width,pg2.height);
    
    if(  current_pixel<(pg.width*pg.height))
    { int pixel_position=_pixels[current_pixel ];
     int swap;

       /*swap pictures*/
   swap=pg.pixels[pixel_position];
    pg.pixels[pixel_position]= pg2.pixels[pixel_position];
    pg2.pixels[pixel_position]=swap;
 
      current_pixel++;
    }  
        
}
void update()
{
  
    
    for(int y=0; y < img.height; y++)
      {  for(int x=0; x < img.width; x++)
        {
            pg.pixels[x+y*img.width]=img.get(x,y);
            pg2.pixels[x+y*img.width]=img2.get(x,y);

        }
          
    }
      

        current_pixel=0; //go back to the start of the array _pixels
       
 shuffle(_pixels.length*3); //number of shuffles
}

void shuffle(int NumberShuff){
  
//shuffle the array _pixels
// with the number of each pixel

for(int i=0; i<NumberShuff;i++)
{
  int a=int(random(0,_pixels.length));
   int b=int(random(0,_pixels.length));
   int temp=_pixels[a];
   _pixels[a]=_pixels[b];
   _pixels[b]=temp;
}
}//end shuffle


 void initialise()
  {
     img=loadImage("1.jpg");
    img2=loadImage("2.jpg");
    pg = createGraphics(img.width,img.height,P2D);
    pg2 = createGraphics(img2.width,img2.height,P2D);
     
    _pixels=new int[img2.width*img2.height];
    
      for(int i=0; i< img.height*img.width;i++)
     {
      _pixels[i]= i; 
      }

 }//end initialise
void keyPressed()
{
    update();
}

