
int s;
int m;
int h;

 
void setup()
{
  size (1200, 500);
  background(255);

}
 
//this function is called 60 times per second
void draw()
{
  background(255);
  //update variables with time and date
  s = second();
  m = minute();
  h = hour();

strokeWeight(2);
stroke(124, 122, 122);
rect(0, 0, 1200, 0, 1200, 500, 0, 500);
line(400, 0, 400, 500);
line(800, 0, 800, 500);

strokeWeight(1);
stroke(124, 122, 122);

for(int i=0; i<s; i++)
  {
    float sHeight = map(i, 0, 60, 0, 500);
    line(800, sHeight, 1200, sHeight);
  }



strokeWeight(2);
for(int i=0; i<m; i++)
{
  float mHeight = map(i, 0, 60, 0, 500);
  line(400, mHeight, 800, mHeight);
}
 
strokeWeight(8);
strokeCap(SQUARE);
for(int i=0; i<h; i++)
{
  float hHeight = map(h, 0, 23, 0, 500);
  line(0, hHeight, 400, hHeight);
}

}
