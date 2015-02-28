

int IMGHEIGHT;
int IMGWIDTH;


  int x=31;

PImage[] images = new PImage[3];
float[] weight=new float [3];
float[] inc=new float [3];
void setup() 
{
  int i;
 
  String p;
  IMGHEIGHT=180;
  IMGWIDTH=240;
 
  frameRate(10);
   
    for(i=0;i<inc.length;i++){
     p=str(int(random(x)+1));  
      images[i] = loadImage(p+".jpg");
    
     }


  size(IMGWIDTH*2,IMGHEIGHT*2);
  
  background(0);

}
void draw()
{

int i;

  String p;
   
 int k;
  int cols;
  int rows;

  int sub;
    int sub1;
    int sub2;
  int j;
  float r;
  float g;
  float b;

  float sumR;
  float sumG;
  float sumB;
  
  float totalWeight;


    for(i=0;i<inc.length;i++){
     
       
      inc[i]=(i+1)*(mouseY-IMGHEIGHT)*IMGWIDTH+(i+1)*(mouseX-IMGWIDTH);
      inc[i]=inc[i]/4;
       weight[i]=1;
   
     if(inc[i]<0){
       inc[i]=inc[i]+IMGHEIGHT*IMGWIDTH;
     }
       if(inc[i]>=IMGHEIGHT*IMGWIDTH){
       inc[i]=(inc[i]-IMGHEIGHT*IMGWIDTH+1);
     }
     inc[i]=(inc[i])%(IMGHEIGHT*IMGWIDTH);    }



    loadPixels();
   for (rows=0;rows<IMGHEIGHT;rows++){
      for (cols=0;cols<IMGWIDTH;cols++){
            
                   
                   sub=(rows*IMGWIDTH*2) + cols;
                  sumR=0;
                   sumG=0;
                   sumB=0;
                   totalWeight=0;
                       
                     
                   for(i=0;i<inc.length;i++){
                     

                     sub2=int(((rows*IMGWIDTH) + cols)-inc[i]);
                     if (sub2 < 0){
                       sub2=sub2+IMGHEIGHT*IMGWIDTH;
                     }
                     if(sub2>=IMGHEIGHT*IMGWIDTH){
                        sub2=sub2-IMGHEIGHT*IMGWIDTH;
                     }
                     
                       r=red(images[i].pixels[sub2])*weight[i];
                       g=green(images[i].pixels[sub2])*weight[i];
                     b=blue(images[i].pixels[sub2])*weight[i];
      
                    if(i%3!=0){   
                     sumR=sumR+1*r*(r/(128*weight[i]));
                    }
                    if(i%3!=1){
                     sumG=sumG+1*g*(g/(128*weight[i]));
                   }
                   if(i%3!=2){
                     sumB=sumB+1*b*(b/(128*weight[i]));
      }
                   totalWeight=totalWeight+weight[i];  
                     
                   
                   
                   }
    
                  pixels[sub]=color(int(sumR/totalWeight),int(sumG/totalWeight),int(sumB/totalWeight) );
      
    }
     
   // Begin loop for width
   for (i = 0;i< IMGWIDTH; i++) {
     // Begin loop for height
     for (j = 0; j < IMGHEIGHT;j++) {    
       //pixels[(j+1)*IMGWIDTH*2 - i] = pixels[IMGWIDTH*j + i]; // Reversing x to mirror the image
        pixels[(j+1)*IMGWIDTH*2 - i-1]=pixels[IMGWIDTH*2*j + i];
         pixels[(IMGHEIGHT*2-j-1)*IMGWIDTH*2 + i -0  ]=pixels[IMGWIDTH*2*j + i];
           pixels[(IMGHEIGHT*2-j)*IMGWIDTH*2 - i - 1  ]=pixels[IMGWIDTH*2*j + i];
         
     }
   }
   updatePixels(); 
     
 }



  
 
  
}
 void keyPressed()
{

    if ( key == 'r' ) setup();
}

