
int x1 = 170; //top left circle bottom left
int x2 = 170;

void setup ()
{
size(355, 355); //holder for logo

smooth(); 
}
void draw ()
{
  background(30, 30, 30); //bg colour 
fill(172, 36, 229);
strokeWeight(10);
stroke(255, 235, 8);

if (x1>50)
{
x1 = x1-1;
}
if (x2<299)
{
x2 = x2+1;
}
ellipse(x1, 60, 78, 82);//left top

ellipse(x2, 60, 78, 82);//right top

ellipse(x2, 300, 78, 82);//right bottom

ellipse(x1, 300, 78, 82);//left bottom
 
ellipse(170, 170, 78, 82);//middle


}


