
float angle =45;
float ballX;
float ballY;
float ballXSpeed = .2;
float ballYSpeed = .3;
float comet=0;

void setup () {
  size( 500, 500);
  background (141, 223, 241);
}
void draw() {
  noStroke();
float y_value= sin(comet)*50;
float x_value = cos (comet)*50;

y_value+= 100;
x_value+= 120; 

comet += .03;
ellipse(x_value,y_value, 5,5);

  noStroke();
  ballX = ballX + ballXSpeed;
  ballY = ballY + ballYSpeed;
   
  fill(255, 254, 230);
  ellipse(ballX, ballY, 13, 13);
   
 
  if (ballX > width) {
      ballX = 0;
      }
  if (ballX < 0) {
      ballX = width;
  }
   
  //wrap screen on Y axis
  if (ballY > height) {
      ballY = 0;
      }
  if (ballY < 0) {
      ballY = height;
  }

  translate(120, 100);
  rotate( radians(angle)); 
  fill(241, 230, 141);
  ellipse(0, 0, 60, 60);
  angle +=1;


    fill(0, 5);
    rect(0, 0, width, height);

    fill(255);
    ellipse (random(width), random(height), 6, 6);
     
     

  }





