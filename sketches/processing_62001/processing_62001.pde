
float radius;
float ballY;
float ySpeed;

void setup() {
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(30);
  textSize(52);
  textAlign(CENTER);  
  text( "max is a g", 200, 100);



  // initialize the variables:
  radius = 40;
  ballY = radius;
  ySpeed = 3;
}

void draw() {
  background(random(255), random(255), random(255));
  fill(random(225), random(225), random(225));
  text( "TRIPPY", random(400), random(400));
  text( "MAX", random(400), random(400));
  text( "What", random(400), random(400));
  text( "HEHE", random(400), random(400));
  text( "HAHA", random(400), random(400));
  // If ball is at the bottom:
  if (ballY >= height-radius )
  {
    ballY = height-radius;
    ySpeed = ySpeed * (-1) ;
  }

  // If ball is at the top:
  if (ballY <= radius )
  {
    ballY = radius;
    ySpeed = ySpeed * (-1) ;
  }

  ballY = ballY + ySpeed;
  ellipse( width/2, ballY, radius*2, radius*2 );
  println(ballY);
  fill( random(255), random(255), random(255) );
  ellipse(random(200), random(300), 50, 50 );
  ellipse(random(400), random(600), 50, 50 );
  ellipse(random(500), random(600), 50, 50 );
}


