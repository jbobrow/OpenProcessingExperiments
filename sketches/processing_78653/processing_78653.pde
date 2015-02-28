
                //*************************\\
        //   *** HW#7__Nov_12_2012 ****\\
// ****  Dana Silberberg-Sahar **** \\
                //Part 2: Pixel Array\\

PImage munii;

void setup() {
size(800,800);
munii=loadImage ("munii.jpg");
colorMode (HSB, 360, 100, 100, 100);
photoFilter(0);
photoFilter(0);
  photoFilter(20);
  photoFilter(40);
  photoFilter(60);
}
void draw() {
 if (mousePressed){
  println ("x:"+mouseX+"y:"+ mouseY);
}  
}



//De-saturate filter - if mouse hovers over buttons:

void photoFilter (int c) {
 // if (mousePressed){
munii.loadPixels( );//without "munii", will load the screen
 int muniiSize=munii.width*munii.height;//# of pixels
 for (int i=0;i<muniiSize;i++) {
   color cp=munii.pixels[i];
   float h=hue(cp);
   float s=saturation(cp);
   float b=brightness(cp);
   munii.pixels[i]=color (h,s-c,b);
  }

munii.updatePixels();
   image (munii, 0, c*10);


//  }
}


