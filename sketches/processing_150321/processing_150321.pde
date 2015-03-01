
float ball_x;
float ball_y;
float ball_dir = 0;
float ball_size = 30.0;
float grav = 0.6;  // Gravity
float pfx = 100.0;
float pfy = 75.0;
float pfh = 200.0;
float pfw = 25.0;



void setup()

{

  size(600, 600);
  rectMode(CORNER);
  ellipseMode(CENTER);
  noStroke();
  smooth();
  ball_y = mouseY;
  ball_x = mouseX;

}

void draw() 

{  
  background(0);

  fill(0,255,0);
  rect(pfx, pfy, pfw, pfh);
  fill(255,0,0);
  rect(430, 75, 25, 330);
  fill(0,0,255);
  rect(500, 46, 25, 330);
    

  ball_x = mouseX;
  ball_y = mouseY;
   
  boolean detected = Collision(ball_x, ball_y,
      ball_size, pfx, pfy, pfw, pfh);
       
  boolean detected2 =  Collision(ball_x, ball_y,
      ball_size, 430, 75, pfw, pfh);
      
  boolean detected3 =  Collision(ball_x, ball_y,
      ball_size, 500, 46, pfw, pfh);    
   

  if (detected == true){
    fill(0,255,0);
  }
  else if (detected2 == true) {
    fill(255,0,0);
  }
    else if (detected3 == true) {
    fill(0,0,255);
  }
  else {fill(255);}
  
  ellipse(ball_x, ball_y, ball_size*2.0, ball_size*2.0);

}

boolean Collision(
float cirX,
float cirY,
float rad,
float rectX,
float rectY,
float rectW,
float rectH)
{
  float ball_disX = abs(cirX-rectX-rectW/2);
  float ball_disY = abs(cirY-rectY-rectH/2);
  
  if(ball_disX > (rectW/2 + rad)){return false;}
  if(ball_disY > (rectH/2 + rad)){return false;}
  
  if(ball_disX <= (rectW/2)){return true;}
  if(ball_disY <= (rectH/2)){return true;}
  
   float cdist = pow(ball_disX - rectW/2, 2);
  
  return (cdist <= pow(rad,2));

}


