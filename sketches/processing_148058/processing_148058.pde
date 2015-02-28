
float playerPosX, playerPosY;
float player2PosX, player2PosY;
int t = 3;
int b = 3;
boolean right = false, left = false, a = false, d = false;


PFont f;

void setup() {  
  size(400,400);
  //top player
  playerPosX = 10;
  playerPosY = 10;
  //bottom player
  player2PosX = 360;
  player2PosY = 360;
  f = createFont("Arial",16,true);
}


void draw() {  
    
    stroke(15);
    rect(0,0,400,400);
    
    background(180);  
    
    fill(255);     
     
    rect(45,200 - (55/2), 55, 55); //center left
    rect(295,200 - (55/2), 55, 55); //center right
    rect(200 - (55/2),200 - (55/2), 55, 55); //center
    
    fill(255,0,0);
    rect (playerPosX, playerPosY, 35, 35);
    fill(0,0,255);
    rect (player2PosX, player2PosY, 35, 35);

    //textfont (f,16);
    fill(0,0,255);
    text( "Lives : " + t , 10 , 10);
    text( "Lives : " + b , 10 , 350);
    
    if (left == true) {
      if( player2PosX > 5) {
        player2PosX = player2PosX - 7;
      }
    }
    if (right == true) {     
      if( player2PosX < 360) {
        player2PosX = player2PosX + 7;
      }
    }  
    if (a == true) { // right
       if( playerPosX > 5) {
            playerPosX = playerPosX - 7;
       }
    }
    if (d == true) { //left
      if( playerPosX < 360) {
            playerPosX = playerPosX + 7;
      }
    }
    smooth();
   
  }

void keyPressed()
{
  if (keyCode == LEFT)
  {
    left = true;
  }
  if (keyCode == RIGHT)
  {
    right = true;
  }
  if (key == 'a')
  {
    a = true;
  }
  if (key == 'd' )
  {
    d = true;
  }
}
void keyReleased()
{
  if (keyCode == LEFT)
  {
    left = false;
  }
  if (keyCode == RIGHT)
  {
    right = false;
  }
  if (key == 'a')
  {
    a = false;
  }
  if (key == 'd')
  {
    d = false;
  }
}





