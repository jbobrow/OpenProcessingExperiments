
/**
 * author Oggy 2014
 * This sketch is composed of a tiling of size NB_TILES_SIDE*NB_TILES_SIDE.
 * For each tile, a Tree is built. It will hold all the nodes for this tile.
 * In the draw() method, each Tree will be browsed to display only the leaf nodes
 **/

final int NB_TILES_SIDE = 6;
final int NB_POINTS_SIDE = NB_TILES_SIDE+1;
final float TILE_SIZE = 110;
final int MAX_DEPTH = 5;
final int HEIGHT_H = 150;
float lowestH;//used to vertically translate the mountain3 in order to have it rotate correctly
float highestH;//used to vertically translate the mountain3 in order to have it rotate correctly
float deltaH;//used to vertically translate the mountain3 in order to have it rotate correctly
Tree[][] trees;//trees that will hold the nodes, one tree per tile
PVector[][] randomPoints;//add some randomness in the original points[][]
PVector[][] points;//original points of the tiling

void setup()
{
  size(800, 600, P3D);
  initPointsAndTrees();
}

void initPointsAndTrees()
{
  deltaH = 0;
  points = new PVector[NB_POINTS_SIDE][NB_POINTS_SIDE];
  randomPoints = new PVector[NB_POINTS_SIDE][NB_POINTS_SIDE];
  for (int i = 0; i < NB_POINTS_SIDE; i++)
  {
    for (int j = 0; j < NB_POINTS_SIDE; j++)
    {
      randomPoints[i][j] = new PVector(random(.1, .9) * TILE_SIZE, random(.1, .9) * TILE_SIZE);
    }
  }
  for (int i = 0; i < NB_POINTS_SIDE; i++)
  {
    for (int j = 0; j < NB_POINTS_SIDE; j++)
    {
      points[i][j] = new PVector(i*TILE_SIZE - TILE_SIZE*NB_TILES_SIDE/2 + randomPoints[i][j].x, 
      j*TILE_SIZE - TILE_SIZE*NB_TILES_SIDE/2 + randomPoints[i][j].y, 
      random(HEIGHT_H));
    }
  }

  trees = new Tree[NB_TILES_SIDE][NB_TILES_SIDE];
  for (int i = 0; i < NB_TILES_SIDE; i++)
  {
    for (int j = 0; j < NB_TILES_SIDE; j++)
    {
      trees[i][j] = new Tree(points[i][j], points[i+1][j], points[i+1][j+1], points[i][j+1]);
    }
  }

  for (int i = 0; i < NB_TILES_SIDE; i++)
  {
    for (int j = 0; j < NB_TILES_SIDE; j++)
    {
      deltaH += trees[i][j].deltaH;
    }
  }
  deltaH /= (NB_TILES_SIDE*NB_TILES_SIDE);
}

void draw()
{
  translate(width/2, height/2);
  rotateX(TWO_PI * mouseY / height);
  rotateZ(TWO_PI * mouseX / width);
  background(210);
  for (int i = 0; i < NB_TILES_SIDE; i++)
  {
    for (int j = 0; j < NB_TILES_SIDE; j++)
    {
      drawTree(trees[i][j].root);
    }
  }
}

void drawTree(Node p_node)
{
  if (p_node.depth == MAX_DEPTH)
  {
    drawTriangles(p_node);
  }
  else
  {
    drawTree(p_node.nodeA);
    drawTree(p_node.nodeB);
    drawTree(p_node.nodeC);
    drawTree(p_node.nodeD);
  }
}

void drawTriangles(Node p_node)
{ 
  PVector A = p_node.A;
  PVector B = p_node.B;
  PVector C = p_node.C;
  PVector D = p_node.D;
  PVector H = p_node.H;
  fill(p_node.colorNode, 200);
  stroke(p_node.colorNode/2, 50);
  //noStroke();
  beginShape(TRIANGLES);
  vertex(A.x, A.y, A.z-deltaH);
  vertex(H.x, H.y, H.z-deltaH);
  vertex(B.x, B.y, B.z-deltaH); 
  vertex(B.x, B.y, B.z-deltaH);
  vertex(H.x, H.y, H.z-deltaH);
  vertex(C.x, C.y, C.z-deltaH);  
  vertex(C.x, C.y, C.z-deltaH);
  vertex(H.x, H.y, H.z-deltaH);
  vertex(D.x, D.y, D.z-deltaH); 
  vertex(D.x, D.y, D.z-deltaH);
  vertex(H.x, H.y, H.z-deltaH);
  vertex(A.x, A.y, A.z-deltaH);  
  endShape(CLOSE);
}

void mousePressed()
{
  initPointsAndTrees();
}


