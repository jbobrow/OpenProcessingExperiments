
import fisica.*;

MainMenu menu;
FCircle player1;
FCircle player2;
FCircle ball;
FBox net;
FBox middle;
FBox leftSensor;
FBox rightSensor;
FWorld world;
ScoreBoard score;
Button reset;
Button exit;
boolean[] keys;
final int A = 0;
final int S = 1;
final int D = 2;
final int W = 3;
final int J = 4;
final int K = 5;
final int L = 6;
final int I = 7;


//Muestra el dialogo sobre como se juega
void showHowTo()
{
  menu.setAllButtons(false);
  PFont font = loadFont("ARDARLING-40.vlw");
  textFont(font);
  fill(0);
  text("Voley Style Game",width/3,height/5 );
  fill(255,0,0);
  text("Player1 Keys:",width/5,height/4 + 100);
  text("A = Go Left\nD = Go Right\nS = Little Jump\nW = Jump",width/5,height/4+150);
  fill(0,0,255);
  text("Player2 Keys:",3*width/5,height/4+100);
  text("J = Go Left\nL = Go Right\nK = Little Jump\nI = Jump",3*width/5,height/4+150);
  Button back;
  back = new Button("BACK",width/3+100,height-100,4*40,50);
  back.draw();
  if(back.clicked())
    menu.option = 0;
}
//INicializa las teclas, el array de booleanos que utilizamos para controlar la pulsacion de una o varias teclas
void setupKeys()
{
  keys = new boolean[8];
  for(int i = 0; i < 8; i++)
    keys[i] = false;
}
//Inicializa el menu principal
void setupMainMenu()
{
  menu = new MainMenu();
}
//Inicializa los botones reset y exit
void setupButtons()
{
  reset = new Button("RESET",width/3,height/2 + 100,48*5,48);
  exit = new Button("EXIT",width/3,height/2 + 200,48*4,48);
}

/*En esta funcion se inicializa el mundo, se ajustan sus parametros
  y se le añaden los objetos*/
void setupWorld()
{
  world = new FWorld();
  world.setGravity(0,1000);
  world.setEdges();
  world.top.setFriction(0);
  world.top.setRestitution(0);
  world.bottom.setFriction(1000);
  world.bottom.setRestitution(0);
  world.left.setRestitution(0.6);
  world.right.setRestitution(0.6);
  world.add(player1);
  world.add(player2);
  world.add(ball);
  world.add(net);
  world.add(middle);
  world.add(leftSensor);
  world.add(rightSensor);
}
//Inicialza el marcador
void setupScore()
{
  score = new ScoreBoard(width,height);
}
//Inicializa los sensores: detectan donde cae el balon
void setupSensors()
{
  leftSensor = new FBox(width/2-10,10);
  rightSensor = new FBox(width/2-10,10);
  leftSensor.setPosition(300,height-10);
  rightSensor.setPosition(width/2 +300,height-10);
  leftSensor.setSensor(true);
  rightSensor.setSensor(true);
  leftSensor.setDrawable(false);
  rightSensor.setDrawable(false);
  leftSensor.setStatic(true);
  rightSensor.setStatic(true);
  leftSensor.setGrabbable(false);
  rightSensor.setGrabbable(false);  
}
  
//Inicaliza los jugadores: color, densidad, friccion, elasticidad...
void setupPlayers()
{
  player1 = new FCircle(100);
  player2 = new FCircle(100);
  player1.setFill(255,0,0);
  player1.setDensity(30);
  player2.setFill(0,0,255);
  player2.setDensity(30);
  player1.setFriction(100);
  player2.setFriction(100);
  player1.setRestitution(0);
  player2.setRestitution(0);
  player1.setGrabbable(false);
  player2.setGrabbable(false);
  player1.setPosition(width/4,height-100);
  player2.setPosition(3*width/4,height-100);
}


//Inicializa la pelota
void setupBall()
{
  ball = new FCircle(60);
  ball.setFill(0,255,0);
  ball.setDensity(1);
  ball.setRestitution(0.6);
  ball.setPosition(width/2,height/5);
  ball.setGrabbable(false);
  ball.setBullet(true);
}

//Inicializa la red
void setupNet()
{
  net = new FBox(10,200);
  middle = new FBox(10,height);
  middle.setPosition(width/2,height-400);
  middle.setStatic(true);
  middle.setSensor(true);
  middle.setDrawable(false);
  net.setFill(100);
  net.setStatic(true);
  net.setPosition(width/2,height-100);
  net.setGrabbable(false);
  middle.setGrabbable(false);
}
//Resetea el juego para comenzar un nuevo
void resetGame()
{
  score = new ScoreBoard(width,height);
  menu.option = 1;
  ball.setStatic(false);
}
//Controla el juego: pulsacion de teclas, cuando se acaba, etc.
void playGame()
{
  //Reconocimiento de teclas del jugador 1
  if(keys[W] == true && player1.isTouchingBody(world.bottom))
  {
    player1.addForce(0,-20000000);
  }
  else if(keys[S] == true && player1.isTouchingBody(world.bottom))
  {
    player1.addForce(0,-10000000);
  }
  else if(keys[A] == true)
  {
    player1.adjustPosition(-7,0);
  }
  else if(keys[D] == true && player1.isTouchingBody(middle) == false)
  {
    player1.adjustPosition(7,0);
  }
  
  //Reconocimiento de teclas del jugador 2
  if(keys[I] == true && player2.isTouchingBody(world.bottom))
  {
    player2.addForce(0,-20000000);
  }
  else if(keys[K] == true && player2.isTouchingBody(world.bottom))
  {
    player2.addForce(0,-10000000);
  }
  else if(keys[L] == true)
  {
    player2.adjustPosition(7,0);
  }
  else if(keys[J] == true && player2.isTouchingBody(middle) == false)
  {
    player2.adjustPosition(-7,0);
  }
  
  //Reconocimiento de la partida
  if(ball.isTouchingBody(leftSensor))
  {
    
    ball.setPosition(width/2,height/5);
    score.scoreIncrease(2);
    ball.setVelocity(0,0);
  }
  else if(ball.isTouchingBody(rightSensor))
  {
    ball.setPosition(width/2,height/5);
    score.scoreIncrease(1);
    ball.setVelocity(0,0);
  }
  
  //Reconocimiento del estado de la partida(FIN o Continuar)
  if(score.getScore(1) == 7)
  {
    score.showWinner(1);
    reset.draw();
    exit.draw();
    ball.setStatic(true);
    if(reset.clicked())
      resetGame();
    if(exit.clicked())
    {
      
      menu.option = 2;
    }
    
  }
  else if(score.getScore(2) == 7)
  {
    score.showWinner(2);
    reset.draw();
    exit.draw();
    ball.setStatic(true);
    if(reset.clicked())
      resetGame();
    if(exit.clicked())
    {
      
      menu.option = 2;
    }
    

  }
  //Aumento de la gravedad de los jugadores
  player1.addForce(0,900000);
  player2.addForce(0,900000);
}

void setup()
{
  Fisica.init(this);
  size(1300,700);
  smooth();
  setupKeys();
  setupButtons();
  setupPlayers();
  setupBall();
  setupNet();
  setupSensors();
  setupScore();
  setupMainMenu();
  setupWorld();

 
  
}

void draw()
{
  background(255);
  if(menu.option() == 0)
  {
    menu.draw();
  }
  else if(menu.option() == 1)
  {
    playGame();
    world.step();
    score.draw();
    world.draw();
  }
  else if(menu.option() == 2)
  {
    exit();
  }
  else if(menu.option() == 3)
  {
    
    showHowTo();
  }
    
}

void keyPressed()
{
  switch(key)
  {
    case 'a':
    case 'A':
      keys[A] = true;
      break;
    case 's':
    case 'S':
      keys[S] = true;
      break;
    case 'd':
    case 'D':
      keys[D] = true;
      break;
    case 'w':
    case 'W':
      keys[W] = true;
      break;
    case 'j':
    case 'J':
      keys[J] = true;
      break;
    case 'k':
    case 'K':
      keys[K] = true;
      break;
    case 'l':
    case 'L':    
      keys[L] = true;
      break;
    case 'i':
    case 'I':
      keys[I] = true;
      break;
  }
}

void keyReleased()
{
    switch(key)
  {
    case 'a':
    case 'A':
      keys[A] = false;
      break;
    case 's':
    case 'S':
      keys[S] = false;
      break;
    case 'd':
    case 'D':
      keys[D] = false;
      break;
    case 'w':
    case 'W':
      keys[W] = false;
      break;
    case 'j':
    case 'J':
      keys[J] = false;
      break;
    case 'k':
    case 'K':
      keys[K] = false;
      break;
    case 'l':
    case 'L':    
      keys[L] = false;
      break;
    case 'i':
    case 'I':
      keys[I] = false;
      break;
  }
}

