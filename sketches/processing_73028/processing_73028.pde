
//Shape shp1;
Shape [] shp1;
Shape [] shp2;
Shape [] shp3;
Shape [] shp4;
//Shape [] shp5;

void setup()
{
  size(600,600);
  smooth();
  //shp1 = new Shape(0, 0, 0, 0);
  int numSets = width;
  shp1 = new Shape[numSets];
  shp2 = new Shape[numSets];
  shp3 = new Shape[numSets];
  shp4 = new Shape[numSets];
  for (int i = 0; i < numSets; i++)
  {
   shp1[i] = new Shape (i*100,i, 5, 5); 
   shp2[i] = new Shape (i*100,i*60, 5, 5);
   shp3[i] = new Shape (i*100, i*150, 5, 5);
   shp4[i] = new Shape (i, i*100, 5, 5);
  }
}

void draw()
{
  for (int i = 0; i <width; i++)
  {
  shp1[i].display();
  shp2[i].display();
  shp3[i].display();
  shp4[i].display();
  }
}

