
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

int lensD = 256;  // Lens diameter
int[] lensArray = new int[(lensD*lensD)+1];  // Height and width of lens

PGraphics lensEffect,lensImage,lensImage2,bubble;

int xx = 0;
int yy = 0; 
int dx = 1;
int dy = 1;

void setup() {
  size(640, 480);

  // Create buffered image for lens effect
  lensEffect = createGraphics(width, height, JAVA2D);

  // Load background image 
  lensEffect.beginDraw();
  lensEffect.image(loadImage("meanman.png"), 0, 0, lensEffect.width, lensEffect.height);
  lensEffect.endDraw();

  bubble = createGraphics(lensD, lensD, JAVA2D);
  bubble.beginDraw();
  bubble.image(loadImage("bubble.png"), 0, 0, lensD, lensD);
  bubble.endDraw();

  // Create buffered image for image to warp
  lensImage = createGraphics(lensD, lensD, P2D);
  lensImage2 = createGraphics(lensD, lensD, P2D);

  calculate_tfm(lensD,byte(40));

}


// Lens algorithm (transformation array)
void calculate_tfm(int lensD, byte magFactor)
{
  int counter=0;
  int before = millis();

  int a, b;
  int r = lensD /2;
  int rSq=r*r;
  int s = (rSq - magFactor*magFactor);


  int x2;
  int y2;

  int temp;
  int temp2;

  // calculate the first quadrant (90 degrees) of the lens deformation, then extrapolate the other three quadrants
  for (int y = -r; y <= 0; y++) {
    y2=y*y;
    temp = ( y + r )*lensD;
    temp2 =(-y + r )*lensD;
    for (int x = -r ;x <= 0; x++) {
      x2=x*x;
      counter++;
      if(x2 + y2 >= s) {
        a = x;
        b = y;
      }
      else {
        float z = sqrt(rSq - x2 - y2) ;
        a = round(x * magFactor / z);
        b = round(y * magFactor / z);

        // concave lens effect
        // float shift = magFactor/sqrt(magFactor*magFactor - (x*x + y*y - r*r));
        // a =int( x * shift - x  );
        // b =int( y * shift - y );
      }

      //  mirror quadrant of lens to make a complete circle
      lensArray[ temp2 - (-x + r)] =        ((-b + r) * lensD - (-a + r));          // bottom left
      lensArray[(temp2 + (-x + r))-lensD] = ((-b + r) * lensD + (-a + r))-lensD;    // bottom right
      lensArray[ ( y + r )*lensD + ( x + r)] =         ( b + r) * lensD + ( a + r);           // top left
      lensArray[(temp - ( x + r))+lensD] =  ( b + r) * lensD - ( a + r)+lensD;     // top right 
    }
  }
  println("this took:" + str(millis()-before));
  println("interations: "+counter);

  // Restore the original picture
  image(lensEffect, 0, 0, width, height); 

}

void draw() {
  //    calculate_tfm(256,byte(mouseX));

  // save the backgrounlensD of lensHeight*lensWilensDth pixels rectangle at the coorlensDinates 
  // where the lens effect will be applielensD.
  lensImage2.copy(lensEffect, xx, yy, lensD, lensD, 0, 0, lensD, lensD);

  for (int i = 0; i < lensImage.pixels.length-1; i++)  {
    lensImage.pixels[i] = lensImage2.pixels[lensArray[i]]; 
  } 
  lensImage.updatePixels();

  // Overlay the lens square
  image(lensImage, xx, yy, lensD, lensD); 

  image(bubble, xx, yy, lensD, lensD); 

  // Bounce lens around the screen
  if((xx+dx+lensD > lensEffect.width) || (xx+dx < 0)) {
    dx =- dx;
  } 
  if((yy+dy+lensD > lensEffect.height) || (yy+dy < 0)) {
    dy =- dy;
  }

  xx += dx;
  yy += dy;

  //   xx = constrain(mouseX-lensD/2,0,width-lensD);
  //   yy = constrain(mouseY-lensD/2,0,height-lensD);  
}







