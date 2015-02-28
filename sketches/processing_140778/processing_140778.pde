
//add bricks
int xspacing = 10;
int yspacing = 10;
int x=320;
int y= 180;
int i=255;
boolean backward=false;
boolean gameover=false;
String prev = "";
//int brix = int(random(8,632));//x value of brick
//int briy = int(random(8,352));
//int wbri = int(random(10,50));//width of brick
//int lbri = int(random(5,50));

int foodx = int(random(8,632));
int foody = int(random(8,352));
boolean catchFood = false;
//boolean brixCollision = false;
int score=0;
void setup() 
{
  size(640, 360);
  //background(147,190,250);
}
void draw()
{  
   if (gameover==false || catchFood== false)
   {
     fill(255,i,255);
     ellipse(x,y,16,16);
     whereToTurn();
     colorOfSnake();
     addFood();
     
     isGameOver(); 
     didSnakeCatchFood();
     
   }
   isGameOver(); 
   didSnakeCatchFood();
   
}

void isGameOver()
{
    if (x<=8 || y<=8 || x>=632 || y>=352  && catchFood==false)
    {
      textSize(50);
      fill(255,0,255);
      text("GAME OVER!", 200, 170); 
      gameover=true;
      print("   Collided with wall!   ");
    }
    if ( gameover==true && catchFood==false)
    {
      textSize(50);
      fill(255,0,255);
      text("GAME OVER!", 200, 170);
      noLoop();
    }
    
}
void whereToTurn()
{
   
   if (keyCode == UP )
   {
     background(147,190,250);
     ellipse(x,y-yspacing,16,16);
     ellipse(x, y, 16, 16);
     ellipse(x, y+yspacing, 16, 16);
     ellipse(x, y+(2*yspacing), 16, 16);
     y= y-10;
     if ( prev=="DOWN")
     {
       gameover=true;
       print("Collided with Self!");
     }
     prev= "UP";
     
     //keyPressed = false;
   } 
 
   if (keyCode == DOWN )
   {
     background(147,190,250);
     ellipse(x,y+yspacing,16,16);
     ellipse(x, y, 16, 16);
     ellipse(x, y-yspacing, 16, 16);
     ellipse(x, y-(2*yspacing), 16, 16);
     y= y+10;
     if ( prev=="UP")
     {
       gameover=true;
       print("Collided with Self!");
     }
     prev= "DOWN";
     //keyPressed = false;
   } 
   if (keyCode == LEFT )
   {
     background(147,190,250);
     ellipse(x-xspacing,y,16,16);
     ellipse(x, y, 16, 16);
     ellipse(x+xspacing, y, 16, 16);
     ellipse(x+(2*xspacing), y, 16, 16);
     x= x-10;
     if ( prev=="RIGHT")
     {
       gameover=true;
       print("Collided with Self!");
     }
     prev= "LEFT";
     //keyPressed = false;
   } 
   if (keyCode == RIGHT)
   {
     background(147,190,250);
     ellipse(x+xspacing,y,16,16);
     ellipse(x, y, 16, 16);
     ellipse(x-xspacing, y, 16, 16);
     ellipse(x-(2*xspacing), y, 16, 16);
     x= x+10;
      if ( prev=="LEFT")
     {
       gameover=true;
       print("Collided with Self!");
     }
     prev= "RIGHT";
     //keyPressed = false;
   } 
}


void colorOfSnake()
{
  //////This changes color of snake
 if (i==50)
 {
   i++;
   backward=true;
   background(147,190,250);
 }
 if (backward==true)
 {
   i++;
 }
 if (i==255)
 {
   i--;
   backward= false;
   background(147,190,250);
 }
 if (backward==false)
 {
   i--;
 }
}
void addFood()
{
  
  fill(188, 188, 188);
  ellipse(foodx, foody, 25, 25);
  
}
/*void addBrix()
{
  fill(138, 36, 36);
  rect(brix, briy, wbri, lbri);
}*/
void didSnakeCatchFood()
{
  if (x<=foodx+23 && x>=foodx-23 && y<=foody+23 && y>=foody-23 && gameover==false)
  {
    catchFood=true;
    score++;
  }
  if (catchFood==true && score!=5)
  {
      foodx = int(random(8,632));
      foody = int(random(8,352));
      addFood();
      catchFood=false;
  }
  if ( score==5)
  {
      textSize(50);
      fill(255,0,255);
      text("YOU WON!", 200, 170);
      noLoop(); 
  }
  fill(255,0,255);
  textSize(15);
  text("score: " + score, 550, 345);
}

 /*void didCollideBrix()
 {
  if (x<=brix && x>=brix+wbri && y<=briy && y>=briy+lbri && gameover==false)
  {
    brixCollision=true;
    gameover= true;
  }
  
 }*/
//void 
//http://processing.org/reference/keyPressed_.html
