
PImage bg;
PImage teemo;
int x = 1;
int dub = 1;



void setup()
{
  textSize(100);
  size(800,800);
  bg = loadImage("http://farm8.staticflickr.com/7260/7117114235_d25b893b37_c.jpg");
  teemo = loadImage("http://argentxorion.webs.com/misc/teamoo.png");
   

}


void draw ()
{
  image(bg,0,0,800,800);
  frameRate(1);
   
  while(x=>dub)
  {
    image(teemo,random(800),random(800),100,100);
    x++;
  }
 
  dub=dub*2;
 
 if(x>10000)
  {
     dub = 1;
     x = 1;
  }

  
  fill(45,185,43);
  text(dub,100,100);
  
}
    
    
  
  
  
  


