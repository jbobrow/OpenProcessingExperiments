
/*
Taller de programación IXD Veritas
Helberth Delgado
Tarea 01
Moving Balls
Basado en el que Mainor creó
*/

//Lista de todas las bolas
ArrayList<ball> balls = new ArrayList<ball>();
 
//Cantidad de bolas por crear
int nBolas = (int)round(random(50,100));
 
//Colores y transparencia
int red = (int)random(0,#FF004D);
int green = (int)random(0,#00FF1F);
int blue = (int)random(0,#00ACFF);
int trans = (int)random(0,200);
 
//Límite de distancia
int limit = 125;
 
void setup(){
  size(700,500);
  smooth(); 
  for(int i=0;i<nBolas;i++){
    balls.add(new ball());
  }
 
}
 
void draw(){
   
  background(#FF004D);
  //proceso para pintar las bolas
  //movimiento, pintada y chequeo de los bordes
  for(int i = 0;i < balls.size();i++){
    ball ball = balls.get(i);
    ball.move();
    ball.paint();
    ball.borders(); 
    //revisión de la distancia entre las bolas
      for(int x = 0; x < balls.size();x++)
    {
      ball tmpBall = balls.get(x);
      float distance = sqrt(sq(ball.ballX-tmpBall.ballX)+sq(ball.ballY-tmpBall.ballY));
      if(distance < limit){
        fill(#FF004D);
        strokeWeight(5);
        stroke(1,50);
        line(ball.ballX,ball.ballY,tmpBall.ballX,tmpBall.ballY);
      }
    }
  }
}
 
//clase para la bola y los atributos
class ball {
   
  float ballX;
  float ballY;
  float speedX;
  float speedY;
  float ballSize;
  int red;
  int green;
  int blue;
  int trans;
  //constructor
  ball(){
    ballX = random(50, width-50);
    ballY =random(30, height-30);
    speedX = random(-5, 5);
    speedY = random(-5, 5);
    ballSize = random(20,40);
    red=round(random(0,#FF004D));
    green = (int)random(0,#00FF1F);
    blue = (int)random(0,#00ACFF);
    trans = (int)random(0,200);
     
  }
  //método para mover las bolas
  void move(){
    ballX += speedX;
    ballY += speedY;
  }
  //write in the screen
  //used the ellipse mode radius
  void paint(){
    stroke(#670115);
     
    fill(red,green,blue,trans);
    ellipseMode(RADIUS);
    ellipse(ballX,ballY,ballSize,ballSize);
  }
   
   
   
  //revisión del límite de las bolas cuando pegan en la pared
  void borders()
  {
    if (ballX < (ballSize)){
       speedX = speedX * -1;
       ballX = ballSize;
       red=round(random(0,#FF004D));
       green = (int)random(0,#00FF1F);
       blue = (int)random(0,#00ACFF);
       trans = (int)random(0,200);
    }
    if (ballX > (width - (ballSize))){
        speedX = speedX * -1;
        ballX = width - (ballSize);
        red=round(random(0,#FF004D));
        green = (int)random(0,#00FF1F);
        blue = (int)random(0,#00ACFF);
        trans = (int)random(0,200);
    }
    if (ballY < (ballSize)){
        speedY = speedY * -1;
        ballY = (ballSize);
        red=round(random(0,#FF004D));
        green = (int)random(0,#00FF1F);
        blue = (int)random(0,#00ACFF);
        trans = (int)random(0,200);
    }
    if (ballY >= (height -(ballSize))){
        speedY = speedY * -1;
        ballY = height -(ballSize);
        red=round(random(0,#FF004D));
        green = (int)random(0,#00FF1F);
        blue = (int)random(0,#00ACFF);
        trans = (int)random(0,200);
    }
  }
}
 

 
void keyPressed(){
  balls.add(new ball());
   
}
