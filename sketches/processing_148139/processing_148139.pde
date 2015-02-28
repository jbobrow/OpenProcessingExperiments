
PImage map;

void setup()
{
  float[][] terrain = readData("NZ26.asc");
  map = makeImage(terrain);
  size(200,200);
}

void draw()
{
  image(map,0,0);
}

PImage makeImage(float[][] data)
{
  PImage mapdata = createImage(200,200,RGB);
  for(int i=0 ;i<200 ; i++)
  {
    for(int j=0 ; j<200 ; j++)
    {
      color c = spotheight(data[i][j]);
      mapdata.set(i,j, c);
    }
  }
  return mapdata;
}

float[][] readData(String file)
{
   String data[] = loadStrings(file);
   data = subset(data, 5);
   
   float[][] heights = new float[200][];
   for(int i=0 ; i<data.length ; i++)
   {
     heights[i] = float( split(data[i], ' ') );
   }
   return heights;
}

color spotheight(float h)
{
  float scaleh = norm(h, -20, 200);
  color c = lerpColor( color(0), color(255), scaleh);
  return c;
}


