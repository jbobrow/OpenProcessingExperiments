
// This sketch is modified based on this flocking sketch
//http://www.openprocessing.org/sketch/48729
//Still cannot get many parts

ArrayList cells = new ArrayList();
//From Reference: An ArrayList stores a variable number of objects. This is similar to making an array of objects, but with an ArrayList, items can be easily added and removed from the ArrayList and it is resized dynamically. This can be very convenient, but it's slower than making an array of objects when using many elements. Note that for resizable lists of integers, floats, and Strings, you can use the Processing classes IntList, FloatList, and StringList.
Cells cc;
int amount = 500;
float vinit = 4.0;
float vmax = vinit*5;
float timeStep = 0.3;
float range = 18;
float lenA = 8;
float lenB = 6;
void setup()
{
  size(400, 600);
  background(255);
  smooth();


  for (int i=0; i<amount; i++)
  {
    int type = (random(10)<8) ? 1 : 2;
    cells.add(new Cells(type, random(width), random(height), random(2*PI)));
  }
}

void draw()
{
  background(0);

  for (int i=0; i<cells.size(); i++)
  {
    cc = (Cells) cells.get(i);
    cc.update();
    cc.display();
  }
  cc.interact();
}
