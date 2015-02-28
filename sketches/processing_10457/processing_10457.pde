


float[] gX = new float[0];  // un vector buit
float[] gY = new float[0];  // un altre
int nodes = 10;  // quadricula 10x10



void setup() 
{
  size(400,400); 
  smooth(); 
  background(255); 
  frameRate(20);
  float x=100.5;
  initGrid();
  
//  aux.updatexSquare();
}

void draw() 
{
 
}

void mouseClicked() 
{
  
 background(255);
  xSquare aux = new xSquare();
  
 // aux.updatexSquare();
}

void initGrid()
{
 
  float auX,auY;
  auX=(width/nodes)/2;  // coord x del primer centre de quadrat
gX = append(gX,auX);
for(int j=0;j<nodes;j++)
{
  auX=auX+width/nodes;
  gX = append(gX,auX);
}

 auY=(height/nodes)/2;  // coord y del primer centre de quadrat
gY = append(gY,auY);
for(int j=0;j<nodes;j++)
{
  auY=auY+height/nodes;
  gY = append(gY,auY);
//  println(j);
//  println(gY[j]);
  
}

}


