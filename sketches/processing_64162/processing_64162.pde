
import processing.net.*; 

final int pathSize = 25;
final int gridSize = 50;
final int numNodes = 100;


float scaleValue = 0.8;

//NetworkManager networkManager;
NodeManager nodeManager;
CollisionManager collisionManager;
EventManager eventManager;
InputManager inputManager;
PlayerManager playerManager;
//InterfaceManager interfaceManager; 


void setup()
{
  Time.initialize(millis());
  size(800, 800);

  println(int(width/gridSize) + "," + int(height/gridSize));
  //frameRate(10);

  //networkManager = new NetworkManager(true);
  nodeManager = new NodeManager(numNodes);
  collisionManager = new CollisionManager();
  eventManager = new EventManager();
  inputManager = new InputManager();
  playerManager = new PlayerManager(random(0 + 10, width - 10), random(0 + 10, height - 10), false);
  //interfaceManager = new InterfaceManager();

  //networkManager.setupNetwork(new Server(this, 5204), new Client(this, "127.0.0.1", 5204));

  nodeManager.InitializeOtherManagers(collisionManager);
  collisionManager.InitializeOtherManagers(nodeManager, eventManager, playerManager);
  eventManager.InitializeOtherManagers(collisionManager);
  inputManager.InitializeOtherManagers(eventManager, playerManager);
  playerManager.InitializeOtherManagers(collisionManager, eventManager, inputManager);
  //networkManager.InitializeOtherManagers(nodeManager, collisionManager, eventManager);

  smooth();
}

void draw()
{
  Time.update(millis());
  //println(Time.ElapsedSeconds());
  background(0);
  stroke(220);

  translate(width/2, height/2);
  scale(scaleValue);
  translate(-width/2, -height/2);

  update();
  realDraw();
}

void update()
{
  //networkManager.update();
  playerManager.update();
  collisionManager.update();
  nodeManager.update();
  inputManager.update();
  eventManager.update();
}

void realDraw()
{                                                          //  Draw a grid representing the spatial grid used for hashing. 

  /*
  for(int i = 0; i < (width/gridSize); i++)
   {
   stroke(255);
   line(i*gridSize,0,i*gridSize,height);
   line(0,i*gridSize,width,i*gridSize);
   } 
   */

  nodeManager.draw();
  eventManager.draw();
  playerManager.draw();
}

void mouseClicked()
{
  inputManager.ProcessMouseClicked();
}

void mousePressed()
{
  inputManager.ProcessMousePressed();
}

void mouseReleased()
{
  inputManager.ProcessMouseReleased();
}

void keyPressed()
{
  inputManager.ProcessKeyPressed(key);
}

void keyReleased()
{
  inputManager.ProcessKeyReleased(key);
}

void keyTyped()
{
  inputManager.ProcessKeyTyped();
}


