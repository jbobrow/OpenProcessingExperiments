
class Node
{
  int x;
  int y;
  int weightCount;
  PVector weight; 

  Node(int _x, int _y, int n)
  {
    x = _x;
    y = _y;
    weightCount = n;

    // initialize weights to random values
      weight = new PVector(random(-sketchW, sketchW), random(-sketchH, sketchH), random (0, sketchH));
    }
}


