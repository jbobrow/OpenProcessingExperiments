

int IMGHEIGHT;
int IMGWIDTH;



  int x=92;

PImage[] images = new PImage[6];
float[] weight=new float [6];
float[] inc=new float [6];
void setup() 
{
  int i;

  String p;
  IMGHEIGHT=360;
  IMGWIDTH=480;

  frameRate(10);
 
    for(i=0;i<images.length;i++){
      p=str(int(random(x)+1));
      images[i] = loadImage(p+".jpg");
      weight[i]=random(100);
      inc[i]=random(24)-12;
    }



  size(IMGWIDTH,IMGHEIGHT);
  background(0);

}
void draw()
{

  String p;
   

  int cols;
  int rows;

  int sub;
  int i;
  float r;
  float g;
  float b;

  float sumR;
  float sumG;
  float sumB;
  
  float totalWeight;




  for(i=0;i<images.length;i++){
    weight[i]=weight[i]+inc[i];
    if (weight[i]<=0){
      weight[i]=1;
      inc[i] = inc[i] * -1;
      p=str(int(random(x)+1));
      images[i] = loadImage(p+".jpg");
      inc[i]=random(28)-14;
    
    } 
    if (weight[i]>=200){
       weight[i]=200;
       inc[i] = inc[i] * -1;
    
    } 
   }
    loadPixels();
    for (rows=0;rows<IMGHEIGHT;rows++){
      for (cols=0;cols<IMGWIDTH;cols++){
             
                   
                  sub=(rows*IMGWIDTH) + cols;
                   sumR=0;
                   sumG=0;
                   sumB=0;
                   totalWeight=0;
                   for(i=0;i<images.length;i++){
                    totalWeight=totalWeight+weight[i];
                   }
                   
            
                   
                    r=red(pixels[sub])*totalWeight;
                    g=green(pixels[sub])*totalWeight;
                    
                    b=blue(pixels[sub])*totalWeight;
                    
                  
                   
                    sumR=sumR+r;
                    sumG=sumG+g;
                    sumB=sumB+b;
                
                     
                    for(i=0;i<images.length;i++){
                  
                         r=red(images[i].pixels[sub]);
                         g=green(images[i].pixels[sub]);
                         b=blue(images[i].pixels[sub]);
               

                         r=r*weight[i]*r/64;
                         g=g*weight[i]*g/64;
                         b=b*weight[i]*b/64;
                         if(i%3==0){
                            sumR=sumR+r;  
                         }
                        if(i%3==1){
                           sumG=sumG+g; 
                         }
                        if(i%3==2){
                            sumB=sumB+b;
                 
                         }
                   
                          totalWeight=totalWeight+weight[i];
                     }

                     pixels[sub]=color(int((sumR/totalWeight)),int((sumG/totalWeight)),int((sumB/totalWeight)) );
      
    }
     updatePixels(); 

     
 }




  
 
  
}
 void keyPressed()
{

    if ( key == 'r' ) setup();
}

