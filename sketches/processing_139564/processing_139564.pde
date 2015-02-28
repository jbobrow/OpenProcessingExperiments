

class Node extends PVector
{
  int depth;
  PVector origine ;
  float distance;
  float distanceO;//original distance
  float myAngle;
  float angleO;//original angle
  int nbNodes;
  int rank;
  color myColor;
  Node[] tabNodes;

  public Node(int p_depth, int p_nbNodes, PVector p_origine, float p_angle, float p_distance, int p_rank, color p_color)
  { 
    depth = p_depth;
    nbNodes = p_nbNodes;
    origine = p_origine;
    x = origine.x;
    y = origine.y;
    rank = p_rank;
    myColor = p_color;
    myAngle = angleO = p_angle;
    distance = distanceO = p_distance;

    tabNodes = new Node[nbNodes];
  }

  void updateNodeInfos(float p_newX, float p_newY, float p_newAngle, float p_newDistance)
  {
    x = p_newX;
    y = p_newY;
    myAngle = p_newAngle;
    distance = p_newDistance;
  }

  void shuffle()
  {
    int m = nbNodes;
    int i;
    Node tmpNode;

    while (m > 0)
    {
      i = floor(random(1) * m--);
      tmpNode = tabNodes[m];
      tabNodes[m] = tabNodes[i];
      tabNodes[i] = tmpNode;
    }
  }
}


