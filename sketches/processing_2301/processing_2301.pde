
PImage g_img;
SobelEdgeDetection sobel;
String imageFilename = "manga.png";

int flag = 0;

void setup()
{
  // Set up default canvas size
  size(634, 600);
  background(200,200,200);

  // Load an image
  g_img = loadImage(imageFilename);

  image(g_img,0,0,width,height);

  // Initialize and create a new sobel object
  sobel = new SobelEdgeDetection();
}



void draw()
{

}

void keyPressed()
{
  if(key == 'r')
  {
    resetImage();
  }
}
void mouseClicked()
{

  if(mouseButton == LEFT)
  {

    getEdges(g_img);

  }

  if(mouseButton == RIGHT)
  {
    background(0);
    g_img = sobel.noiseReduction(g_img, 1);
    image(g_img, 0, 0, width, height);
  }

}


void resetImage()
{
  background(200,200,200);
  g_img = loadImage(imageFilename);
  image(g_img, 0,0, width, height); 
}

void getEdges(PImage img)
{

  // Performs the edge detection routine, 
  g_img = sobel.findEdgesAll(img, 90);

  // Remove some noise from the conversion
  g_img = sobel.noiseReduction(g_img, 1);

  image(g_img, 0 , 0, width,height);

}





