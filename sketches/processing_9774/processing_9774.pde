
// David Hockney Photo-Collage 
//Sara Gernsbacher
//CMSC 117, Keith O'Hara
//5.17.10



int numImages = 75;//75 individual photographs in the piece
float[] x = new float[numImages];
float[] y = new float[numImages];
PImage [] Hockney = new PImage [numImages];

void setup()
{
  size(500, 500);
  smooth();
  for (int i = 0; i < numImages; i++)
  {
    PImage img;
    println(i);
    Hockney[i] = loadImage("image" + i + ".jpg");
    x[i] = random(width);
    y[i] = random(height);
  }
}

int ourImage = 0;//variable for the image that the mouse holds

void draw()
{
  x[ourImage] = mouseX;
  y[ourImage] = mouseY;

  background(0);
  for (int i = 0; i < numImages; i = i + 1)
  {
    image(Hockney[i], x[i], y[i]);
  }
}

void mousePressed()
{
  ourImage = int(random(0, numImages));//randomly picks a new image once you click the mouse and drop the previous image
}














