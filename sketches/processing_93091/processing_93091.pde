
final int MAX = 3;

float [ ] xList = {random(0, 250), random(0, 250), random(0, 250), random(0, 250),
                  random(0, 250), random(0, 250), random(0, 250), random(0, 250),
                  random(0, 250), random(0, 250)};
float [ ] yList = {random(100, 1000), random(100, 1000), random(100, 1000), random(100, 1000),
                  random(100, 1000), random(100, 1000), random(100, 1000), random(100, 1000),
                  random(100, 1000), random(100, 1000) };
float [ ] sizeList = {random(10, 40), random(10, 40), random(10, 40), random(10, 40),
                    random(10, 40), random(10, 40), random(10, 40), random(10, 40),
                    random(10, 40), random(10, 40)};
color [ ] col = {color(random(255), random(255), random(255)),
                   color(random(255), random(255), random(255)),
                   color(random(255), random(255), random(255)),
                   color(random(255), random(255), random(255)),
                   color(random(255), random(255), random(255)),
                   color(random(255), random(255), random(255)),
                   color(random(255), random(255), random(255)),
                   color(random(255), random(255), random(255)),
                   color(random(255), random(255), random(255)),
                   color(random(255), random(255), random(255)) };
void setup()
{
  size(600, 600);
  background (0);
}

void draw()
{
  for (int i = 0; i<xList.length; i++)
  {
    stroke(col [i]);
    noFill();
    ellipse(xList[i], yList[i], sizeList[i]*1.5, sizeList[i]*1.5);
    ellipse(xList[i]*2, yList[i]*2, sizeList[i]*.25, sizeList[i]*.25);
    ellipse(xList[i]/2, yList[i]/2, sizeList[i]*4, sizeList[i]*4);
  }
}
