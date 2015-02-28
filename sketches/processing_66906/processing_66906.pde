
class Ball{

//variables  
float xspeed = random(1,10);
float yspeed = random(1,10);
float r = 5;
float cirX;
float cirY;
color ballColor;
float t = 25;


//---------------------DECLARE OBJECT


//Constructor
Ball(float tempcirX, float tempcirY, color tempballColor) {
  cirX = tempcirX;
  cirY = tempcirY;
  ballColor = tempballColor;

}

//draw bouncing balls & grid
void display(){
//draw ball
  
  noStroke();

  fill(ballColor);
  int x = (floor(cirX/10)*10);
  int y = (floor(cirY/10)*10);
  rect(x,y,10,10);

}

//bouncing function
void run(){
  display();
  cirX = cirX + xspeed;
  cirY = cirY + yspeed;
  if ((cirX > width) || (cirX < 0)) {
    xspeed = xspeed * -1;
  } 
  if ((cirY > height) || (cirY < 0)) {
    yspeed = yspeed * -1;
  }


}
}



