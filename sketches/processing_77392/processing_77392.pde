
float xScale = 0.1;
float tScale = 1;

PImage[] imgList;
int[] imgSize;
float[] imgCursor;
float[] imgSync;

int n;

void setup()
{
  size(720,486);
  noiseDetail(3, 0.75);
  
  String path = sketchPath  + "\\data";
  File dataFolder = new File(path);
  String[] fileList = dataFolder.list();
  n = fileList.length;
  
  imgList = new PImage[n];
  imgSize = new int[n];
  imgCursor = new float[n];
  imgSync = new float[n];
  
  for(int j=0; j<n; j++)
  {
    imgList[j] = loadImage(fileList[j]);
    imgList[j].loadPixels();
    imgSize[j] = imgList[j].pixels.length;
    imgCursor[j] = 0;
    imgSync[j] = 1 + random(0.01) - random(0.01);
    println("sync[" + j + "] = " + imgSync[j]);
  }
  
  size(imgList[0].width, imgList[0].height);
}

void draw()
{
  float t = frameCount * tScale;
  float hSync = map(mouseX, 0, width, 0.99, 1.01);
  background(0);
  
  loadPixels();
  for(int j=0; j<n; j++)
  {
    for(int i=0; i<pixels.length; i++)
    {
      float p = (imgCursor[j] + i * (1 + hSync - imgSync[j])) % imgSize[j];
      while (p < 0) p += imgSize[j];
      pixels[i] += imgList[j].pixels[floor(p)]; 
      if (i==pixels.length-1) imgCursor[j] = p;
    }
  }
  updatePixels();
  
  stroke(255,0,0);
  for (int j=0; j<n; j++)
  {
    float x = map(imgSync[j], 0.99, 1.01, 0, width);
    line(x,0, x,height);
  }
}




