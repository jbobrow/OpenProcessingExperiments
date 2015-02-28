
//Julie O, CompProg1 Mods 4/5, Doubling Shapes

int totalNum = 5;
int r = int(random(0,255));
int g = int(random(0,255));
int b = int(random(0,255));

void setup()
{
  int variableSize = 10;
  int ellipseNumber = 1;
  int offsetX = 10;
  int offsetY = 10;
  size(450,450,P3D);
  frameRate(2);
  smooth();
}

void draw()
{
  background(0);
  //int variableSize = int(random(7,24));
  int ellipseNumber = 1;
  while(ellipseNumber<totalNum)
  {
    int offsetX = int(random(5,450));
    int offsetY = int(random(5,450));
    //println(offsetX + " " + offsetY,0);
    translate(offsetX,offsetY,0);
    box(7.5);
    translate(-offsetX,-offsetY,0);
    ellipseNumber++;
    strokeWeight(2);
    stroke(r+int(random(0,255)),g+int(random(0,255)),b+int(random(0,255)));
    fill(r+int(random(0,255)),g+int(random(0,255)),b+int(random(0,255)));
  }
  totalNum = totalNum*2;
  if(totalNum>1615)
  {
    totalNum = 5;
  }
}
