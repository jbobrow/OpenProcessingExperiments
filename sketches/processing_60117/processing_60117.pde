
final int gridSize = 10;
final int numNodes = 200;
NodeManager nodeManager;

void setup()
{
  Time.initialize(millis());
  size(300, 300);

  println(int(width/gridSize) + "," + int(height/gridSize));
  //frameRate(10);

  nodeManager = new NodeManager(numNodes);

  smooth();
}

void draw()
{
  Time.update(millis());
  //println(Time.ElapsedSeconds());
  background(0);
  stroke(220);
  
  update();
  realDraw();
}

void update()
{
  nodeManager.update();
  
}

void realDraw()
{                                                          //  Draw a grid representing the spatial grid used for hashing. 
  for(int i = 0; i < (width/gridSize); i++)
  {
    stroke(255);
    line(i*gridSize,0,i*gridSize,height);
    line(0,i*gridSize,width,i*gridSize);
  }
  
  nodeManager.draw();
}

