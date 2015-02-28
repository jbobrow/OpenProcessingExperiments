
//MAZE GENERATION
//DHRUV DAMLE

//--------------PARAMETERS
int BLOCKWIDTH = 20;      //WIDTH OF A BLOCK IN PIXELS
int GAP = 10;             //WIDTH OF THE WALL SEPARATING THE BLOCKS, IN PIXELS
int SIDE = 15;            //NUMBER OF BLOCKS IN A ROW (OR COLUMN) 
//------------------------

int bridge = GAP;
int BLOCKS = SIDE*SIDE;  //NUMBER OF BLOCKS (OR CELLS) IN THE MAZE
int[] Visited = new int[BLOCKS];
ArrayList Vis = new ArrayList();
int choice;
int b1 = -1;
int b=0;
int seed;
void setup()
{
  //size(SIDE*(BLOCKWIDTH+GAP)+GAP, SIDE*(BLOCKWIDTH+GAP)+GAP);
  size(460, 460);  //Use the size() function above if you have downloaded the sketch.
  noStroke();
  frameRate(30);
  for (int i=0; i<BLOCKS; i++)
    Visited[i] = 0;
  seed = (int)random(1, BLOCKS);
  Visited[seed] = 1; 
  Vis.add(seed);
  colorBasicScreen();
}

void draw()
{
  for (int i=0; i<Vis.size(); i++)
    print(Vis.get(i) + ", ");
  if (areNodesLeft())          // IF AT LEAST ONE NODE IS YET TO BE VISITED
  {
    do {
      b = (Integer)Vis.get((int)random(Vis.size()));
      println("Random node from Visited : " + b);
      b1 = -1;
      switch((int)random(4))
      {
      case 0 : 
        if ((b+1)%SIDE != 0   && Visited[b+1]==0)
        {//make link
          println("right");
          b1 = b+1;
          choice = 3;
          // break;
        }
        break;
      case 1 : 
        if ((b+SIDE) <BLOCKS  && Visited[b+SIDE]==0)
        {  //make link
          println("lower");
          b1 = b+SIDE;
          choice = 2;
          //break;
        }  
        break;      
      case 2 : 
        if (b % SIDE != 0  && Visited[b-1]==0)
        {  //make link
          println("left");
          b1 = b-1;
          choice = 1;
          //break;
        }
        break;
      case 3 : 
        if ((b-SIDE) >=0  && Visited[b - SIDE]==0)
        { //make link
          println("upper");
          b1 = b - SIDE;
          choice = 0;
          //break;
        }
        break;
      default: 
        b1 = -1;
        choice = -1;
        println("default");
      }

      println("random b1 : " +b1);
    }
    while (b1 <0 || b1>=BLOCKS);

    println(".........decided");
    Visited[b1] = 1;
    connect(b, choice);  //CONNECTS AN ALREADY VISITED NODE b TO ITS NEIGHBOUR DETERMINED BY choice (UPPER/ LEFT/ LOWER/ RIGHT).
  }
  else
    noLoop();
  
  Vis = null;
  Vis = new ArrayList();
  for (int i=0; i<BLOCKS; i++)
    if (Visited[i] == 1)
      Vis.add(i);
}

void colorBasicScreen()
// COLORS THE BASIC SCREEN
{
  fill(255, 0, 0, 100);
  //RED MARKERS SUGGESTING ENTRY AND EXIT POINTS
  rect(0, GAP, GAP, BLOCKWIDTH);
  //rect(width-GAP, height-(BLOCKWIDTH+GAP), GAP, BLOCKWIDTH);
  rect(SIDE*(BLOCKWIDTH+GAP), SIDE*(BLOCKWIDTH+GAP)-BLOCKWIDTH, GAP, BLOCKWIDTH);
  //SIDE x SIDE, CELLS OF THE SQUARE GRID 
  fill(255);
  for (int i=0; i<BLOCKS; i++)
    rect((float)((int)(i%SIDE)*(BLOCKWIDTH + GAP) + GAP), (float)((int)(i/SIDE)*(BLOCKWIDTH + GAP) + GAP), BLOCKWIDTH, BLOCKWIDTH);
}

boolean areNodesLeft()  //RETURNS TRUE IF AT LEAST ONE NODE IS YET TO BE VISITED
{
  for (int i=0; i<BLOCKS; i++)
    if (Visited[i] == 0)
      return true;
  return false;
}

void connect(int b, int c)
//CONNECTS AN ALREADY VISITED NODE b TO ITS NEIGHBOUR DETERMINED BY c (UPPER/ LEFT/ LOWER/ RIGHT).
{
  println("in connect...choice : " + c + ", seed : " +b);
  fill(255);
  switch(c)
  {
  case 0 : //connect to upper 
    rect((float)((int)(b%SIDE)*(BLOCKWIDTH + GAP) + GAP), (float)((int)(b/SIDE)*(BLOCKWIDTH + GAP) + GAP - bridge), BLOCKWIDTH, bridge);
    break;
  case 1 : //left
    rect((float)((int)(b%SIDE)*(BLOCKWIDTH + GAP) + GAP - bridge), (float)((int)(b/SIDE)*(BLOCKWIDTH + GAP) + GAP), bridge, BLOCKWIDTH);
    break;
  case 2 : //lower
    rect((float)((int)(b%SIDE)*(BLOCKWIDTH + GAP) + GAP), (float)((int)(b/SIDE)*(BLOCKWIDTH + GAP) + (GAP+BLOCKWIDTH)), BLOCKWIDTH, bridge);
    break;
  case 3 : //right
    rect((float)((int)(b%SIDE)*(BLOCKWIDTH + GAP) + (GAP+BLOCKWIDTH)), (float)((int)(b/SIDE)*(BLOCKWIDTH + GAP) + GAP), bridge, BLOCKWIDTH);
    break;
  }
}


