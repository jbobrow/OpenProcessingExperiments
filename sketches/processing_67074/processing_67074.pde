
/**
 * Simple Julia Set Explorator
 * by Héctor Corte.
 * leo_corte@yahoo.es
 * 
 * Generate Julia set by reucrrence using 
 * z=z^2+C
 * where C is mouse position.  
 */
void setup() {
  size(400,400);
  frameRate(20);   
}


void draw() {
  float w = 3;         // 2D space width
  float h = 3;         // 2D space height
  float dx = w /width;    // Increment x this amount per pixel
  float dy = h /height;   // Increment y this amount per pixel
  float x = -w/2;          // Start x at -1 * width / 2  
  float y = -h/2;     // Start y at -1 * height / 2 
  float xx=x;
  float yy=y;
  float distance =0;  //In order to accelerate program we precharge every variable
  int col=0;
  float xp=0;
  int i=0;
  int j=0;
  int k=0;
  
  loadPixels();  
   for (i = 0; i < width; i++) {
     y = -h/2;          
     for (j = 0; j < height; j++) {  
         xx=x;//Need to generate another 2D space to work with
         yy=y;         
         col=0;
         for (k=0;k<20;k++){     //We iterrate until distance gets too big to converge             
           xp=xx*xx-yy*yy+(w*mouseX/width-w/2)/2;
           yy=2*xx*yy+(h*mouseY/height-h/2)/2;
           xx=xp;
           distance=dist(x,y,xx,yy);
           if (distance>3){ //when a point is too far away to return near to its original place we stop the iteration and get as point color the number of iterations used
             col=k*int(255/20);
             break;
           }
         }
         pixels[i+j*width] =color(0, 0,255-col);
         y += dy; //Update y position
       }
       x += dx;  //Update x position
   }   
   updatePixels();
}

