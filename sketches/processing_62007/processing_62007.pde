

float radius;
float ballX;
float ballY;
float xSpeed;
float ySpeed; 
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
}

void draw()
{
  fill( random(255), random(255), random(255) );
  triangle( 0,0,width,0, mouseX,mouseY );

  line( 0, 0, mouseX, mouseY );
  fill( 0, 200, 0 );
  ellipse( mouseX, mouseY, 50, 50 );
  
    println( "frameCount: " + frameCount );
      
   textSize(48);
   textAlign(CENTER);
  text("hello", width/2, height/2);
  radius = 20;
  ballX = width/2;
  ballY = height/2;
  xSpeed = 1;
  ySpeed = 1;
 
}



void mouseDragged()
{
  ballX = mouseX;
  xSpeed = mouseX - pmouseX ;

  ballY = mouseY;
  ySpeed = mouseY - pmouseY ;
}

