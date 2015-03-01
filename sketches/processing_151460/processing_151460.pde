
int x;
int y;

float ballX;
float ballY;
float ballD = .5;
float ballS = 60; 
float dy = 0;  


//float timer = 30;
//int destcount = 3;
//int gamestate = 0;
//int MENU_STATE = 0;
//int PLAY_STATE = 1;
//int WIN_STATE = 2;
//int LOSE_STATE = 3;
 
//int clicker = 0;


PImage background;
PImage kirby;
PImage cake;


void setup(){
  size(500,500);
  cake = loadImage("cake.jpg");
  kirby = loadImage("kirby.jpg");
  background = loadImage("background.jpg");
  //lose = loadImage("lose.jpg");
  //win = loadImage("win.jpg");
  //intro = loadImage("intro.jpg");

  x = 120;
  y = 120;
}


void draw(){
  //if (gamestate == MENU_STATE)
  //{
    //background(0);
    //image(intro, 250, 250, width, height);
     
    //if (mousePressed == true)
    //{
      //clicker += 1;
    //}
     
    //if (clicker == 1)
    //{
      //gamestate = PLAY_STATE;
    //}
  //}
  
//if (gamestate == PLAY_STATE){
  image(background,0,0);
  ballX += ballD * 10;
  ballY += dy;

  if (keyPressed && (keyCode == UP)){
    y -= 10;
  }
  if (keyPressed && (keyCode == DOWN)){
    y += 10 ;
  }
  if (keyPressed && (keyCode == LEFT)){
    x -= 10;
  }
  if (keyPressed && (keyCode == RIGHT)){
    x += 10;
  }
  if (keyPressed && (key == ' ')){
    y -= 10;
  }



if (ballX > width+ballS)
  {
    ballX = -width/2 - ballS;
    ballY = random(0, height);
    dy = 0;
  }
   
  if(ballY < ballS && ballD == -1)
  {
    ballD *= -1;
  }
   
  if (ballX >= height)
  {
    dy = dy * -1;
  }
   
  if (ballX <= 0)
  {
    dy = dy * -1;
  }

  if(y<=ballY && (y+250)>=(ballY+50)){
  if(x<=ballX+46 && (x+106)>=(ballX+46)){
  }
}
else {image(cake, ballX, ballY, ballS, ballS);
}

//if (timer < 0)
    //{
      //if (destcount > 0)
      //{
        //gamestate = WIN_STATE;
      //}
    //}
     
    //if (destcount <= 0)
    //{
      //gamestate = LOSE_STATE;
    //}


  //image(cake, ballX, ballY, ballS, ballS);
  image(kirby,x,y);
  
  //if (gamestate == WIN_STATE)
  //{
   //background(0);
   //image(win, 250, 250, width, height);
  //}
   
  //if (gamestate == LOSE_STATE)
  //{
    //background(0);
    //image(lose, 250, 250, width, height);
  //}
//}

}



