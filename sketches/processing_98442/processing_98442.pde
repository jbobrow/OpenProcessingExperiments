
/**
 * Lens Demo Effect
 * by luis2048. 
 * 
 * A picture is shown and it looks like a magnifying glass 
 * is drawn over the picture. One of the most famous demos 
 * that has a lens effect is 2nd reality by future crew.
 * The trick is to precalculate the entire effect. Just make 
 * an array that for each pixel in the destination picture 
 * tells which pixel to take from the source picture. This 
 * array is called the transformation array. The tricky part 
 * is to calculate the transformation array to make the 
 * destination look like a lens is beeing held over the source 
 * picture. Based on lens formula by on Abe Racadabra.
 */
//I HAVE TO AD 01622 underwater 1 .wav and cigarras iii.mp3
//http://www.freesound.org/samplesViewSingle.php?id=81727
int lensD = 100;  // Lens diameter
int[] lensArray = new int[lensD*lensD];  // Height and width of lens

PGraphics lensEffect;
PGraphics lensEffect2;

PImage lensImage;
PImage lensImage2;



int num=50;
int[] xx = new int[num];
int[] yy = new int[num];
int[] dx = new int[num];
int[] dy = new int[num];



int xx2 = 200;
int yy2 = 200;
int dx2 = -1;
int dy2 = -1;
int res= 40;
void setup() {

 // size(400, 540);
size(820,700);

   for (int it= 0; it < num; it++){
     xx[it]=int(random(res,width-res-lensD));
     yy[it]=int(random(res,height-res-lensD));
     
     dx[it]=int(random(-it/2,it/2));
     dy[it]=int(random(-it/2,it/2));
   }



  // Create buffered image for lens effect
  lensEffect = createGraphics(width, height, P2D);
  lensEffect2 = createGraphics(width, height, P2D);

  // Load background image
  
  lensEffect.beginDraw();
 // lensEffect.image(loadImage("/Users/faiza/Pictures/MyArt/FaizaOpere/Primavera3.png"), 0, 0, 
   //                lensEffect.width, lensEffect.height);  
  
  
  lensEffect.image(loadImage("flyingship2.jpg"), 0, 0, 
                   lensEffect.width, lensEffect.height);  
  
  lensEffect.endDraw();
  
  

  // Create buffered image for image to warp
  lensImage = createGraphics(lensD, lensD, P2D);
  lensImage2 = createGraphics(lensD, lensD, P2D);
  // Lens algorithm (transformation array)
  int magFactor = 40;  // Magnification factor
  int m, a, b;

  int r = lensD / 2;
  float s = sqrt(r*r - magFactor*magFactor);



  for (int y = -r; y < r; y++) {
    for (int x = -r ;x < r; x++) {
      if(x*x + y*y >= s*s) {
        a = x;
        b = y;
      }
      else {
        float z = sqrt(r*r - x*x - y*y);
        a = int(x * magFactor / z + 0.5);
        b = int(y * magFactor / z + 0.5);
      }
      lensArray[(y + r)*lensD + (x + r)] = (b + r) * lensD + (a + r);
    }
  }
  
}


void draw() {

  // Bounce lens around the screen
  

  
   for (int ii = 0; ii < num; ii++){
  if((xx[ii]+dx[ii]+lensD > lensEffect.width) || (xx[ii]+dx[ii] < 0)) {
    dx[ii] =- dx[ii];
  } 
  if((yy[ii]+dy[ii]+lensD > lensEffect.height) || (yy[ii]+dy[ii] < 0)) {
    dy[ii] =- dy[ii];
  }
  xx[ii] += dx[ii];
  yy[ii] += dy[ii];
}

 // Restore the original picture
  image(lensEffect,200, 0, width, height); 

  // crea temp image:
  lensEffect2.beginDraw();
  lensEffect2.image(lensEffect, 0, 0, 
                   lensEffect.width, lensEffect.height);  
  lensEffect2.endDraw();

//lente1
  lensImage = createGraphics(lensD, lensD, P2D);
for (int id = 0; id < num-1; id++){
  // save the backgrounlensD of lensHeight*lensWilensDth pixels rectangle at the coorlensDinates 
  // where the lens effect will be applielensD.
  lensImage2.copy(lensEffect, xx[id], yy[id], lensD, lensD, 0, 0, lensD, lensD);

  // output into a bufferelensD image for reuse
  lensImage.loadPixels();

  // For each pixel in the destination rectangle, apply the color
  // from the appropriate pixel in the saved background. The lensArray
  // array tells the offset into the saved background.
  for (int i = 0; i < lensImage.pixels.length; i++)  {
    lensImage.pixels[i] = lensImage2.pixels[lensArray[i]]; 
  } 
  
  lensImage.updatePixels();

  // Overlay the lens square
  lensEffect2.image(lensImage, xx[id], yy[id], lensD, lensD); 


//lente2
  // save the backgrounlensD of lensHeight*lensWilensDth pixels rectangle at the coorlensDinates 
  // where the lens effect will be applielensD.
  lensImage2.copy(lensEffect2, xx[id+1], yy[id+1], lensD, lensD, 0, 0, lensD, lensD);

  // output into a bufferelensD image for reuse
  lensImage.loadPixels();



  // For each pixel in the destination rectangle, apply the color
  // from the appropriate pixel in the saved background. The lensArray
  // array tells the offset into the saved background.
  for (int i = 0; i < lensImage.pixels.length; i++)  {
    lensImage.pixels[i] = lensImage2.pixels[lensArray[i]]; 
  } 
  
  lensImage.updatePixels();

  // Overlay the lens square
  lensEffect2.image(lensImage, xx[id+1], yy[id+1], lensD, lensD); 
  
 
}//loop on blobs  
  image(lensEffect2, 0, 0, width, height); 


}


