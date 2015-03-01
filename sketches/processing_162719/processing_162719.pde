
/* @pjs preload="http://margforde.wpengine.com/wp-content/uploads/2014/06/logo1.png"; */
PImage logo;
int[] aPixels;

void setup()
{
  size(500,500);
  background(255);
  fill(255);
  noLoop();
String url = "http://margforde.wpengine.com/wp-content/uploads/2014/06/logo1.png";
 logo=loadImage(url);
 
 aPixels = new int[logo.width*logo.height];
 for(int i=0; i<width*height; i++) {

    aPixels[i] = logo.pixels[i];

  }
  
frameRate(30);

loop();
}

void draw(){  

int x;
int y;

x = (width  - logo.width) - (logo.width / 2) ;
y = height - logo.height;





/* image(logo,x,y); */




    println ("i is " + i);
    /* copy(logo,1,5,10,1,1,i,10,1); */
    
  loadPixels();

    for (int i=0; i<width*height; i++) { 

      pixels[i] = aPixels[int((width)+(i%width))];

    }

    updatePixels();  



}
