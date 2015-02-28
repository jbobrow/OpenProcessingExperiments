

 
boolean runStop = true;
float ballSize = 15;
 
Ball[] balls = new Ball[100];
 
void setup()
{ 
  
  size(500,500);
  smooth();
  
  for (int i=0; i< 100; i++){
    balls[i] = new Ball(random(400),random(400));
  }
}
 
void draw()

{
  background(0);
  
  // Aquí utilitzem l´eina bucle per crear el 
 //fons que en aquest cas son les elipses blanques amb el fons negre

    for (int y=0; y< 35; y++)
  {
     
    for(int x = 0;x < 35; x++)
    {
      stroke(0);
      fill(250,250,250);
      ellipse( x *25, y*25,23,18);
     
    }
  }
      
  fill(0,20);
  noStroke();
  rect(0,0,width,height);
  
  // Aqu;i creem la resta de boles que es moran per 
  // el dibuix i que rebotaran amb les parets
   
  for (int i=0; i<balls.length; i++){
    balls[i].update();
    balls[i].checkSides();
    balls[i].display();
  }
}
 
 // Originalment totes les elipses que e desplacen 
 // seràn blanques
 
class Ball {
  color ballColor = color(255,255,255);
  
 // Afegim velocitats en els eixos x i y
 
  float ball_x;
  float ball_y;
  float speed_x = 2;
  float speed_y = 4; 
   
  Ball(float x, float y){
    ball_x = x;
    ball_y = y;
  }
   
  void update(){
     
    ball_x = ball_x + speed_x;
    ball_y = ball_y + speed_y;
   
  }
   
 void checkSides()
 {
      //Aquí establim els imits de txoc amb les parets
      // i condicionem que si les boles txoquen 
      //aquestes agafaran una direcció i un color random
      
    if (ball_x > width-ballSize/2-5){
      ball_x = width-ballSize/2-5 - 1;
      speed_x = speed_x * -1;
      speed_x = speed_x + random(-0.5, 0.5);
      ballColor = color(random(255),random(255),random(255));
    }
    else if(ball_x < ballSize/2+5){
      ball_x = ballSize/2+5 + 1;
      speed_x = speed_x * -1;
      speed_x = speed_x + random(-0.5, 0.5);
      ballColor = color(random(255),random(255),random(255)); 
    }   
       
    if (ball_y > height-ballSize/2-5){
      ball_y = height-ballSize/2-5 - 1;
      speed_y = speed_y * -1;
      speed_y = speed_y + random(-0.5, 0.5);
      ballColor = color(random(255),random(255),random(255));
    }
    else if(ball_y < ballSize/2+5){
      ball_y = ballSize/2+5 + 1;
      speed_y = speed_y * -1;
      speed_y = speed_y + random(-0.5, 0.5);
      ballColor = color(random(255),random(255),random(255));     
    }
  }
   
  void display(){
    stroke(ballColor);
    strokeWeight(5);
    noFill();
    ellipse(ball_x,ball_y, ballSize,ballSize); 
  }
}



