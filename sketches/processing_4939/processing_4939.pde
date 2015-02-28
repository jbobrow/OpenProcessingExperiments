

int IMGHEIGHT;
int IMGWIDTH;
int BIGIMGHEIGHT;
int BIGIMGWIDTH;
 int q=120;
 int n=4;
 
PImage img = new PImage();

void setup() 
{

 

  IMGHEIGHT=270;
  IMGWIDTH=360;
 BIGIMGHEIGHT=600;
  BIGIMGWIDTH=800;
  frameRate(.5);



  size(BIGIMGWIDTH,BIGIMGHEIGHT);
  
  background(color(255,255,255));
  //noLoop();
}
void draw()
{
  filter(BLUR,1);
     float s;
     int x;
     int coin;
     int method;
     int y;
     String p;
      PImage bg = createImage(BIGIMGWIDTH, BIGIMGHEIGHT, RGB);
    for(int i=0;i<n;i++){
     
      bg.loadPixels();
      loadPixels();
      bg.pixels=pixels;

         s=random(.5,1.);
     

       p=str(int(random(q)+1));  
      img = loadImage(p+".jpg");
      x=int(random(BIGIMGWIDTH));
      y=int(random(BIGIMGHEIGHT));
      if(x + s*IMGWIDTH > BIGIMGWIDTH){
        x=x-int(s*IMGWIDTH);
      }
      if(y + s*IMGHEIGHT > BIGIMGHEIGHT){
        y=y-int(s*IMGHEIGHT);
      }
     
      coin=int(random(100));
      if (coin<50){
        method=BLEND;
      }
      else{
         if (coin<80){
            method=HARD_LIGHT;
         }
         else{
            
              method=SOFT_LIGHT;
             
         }
      }
   
    
      bg.blend( img, 0,0,IMGWIDTH,IMGHEIGHT ,x,y, int(s*IMGWIDTH),int(s*IMGHEIGHT),method);
       bg.updatePixels();
tint(255,255,255,int(random(128,255)));
      image(bg, 0, 0);
      
      
      
     }

      
   
 }



  
 
  

 void keyPressed()
{

    if ( key == 'r' ) setup();
}

