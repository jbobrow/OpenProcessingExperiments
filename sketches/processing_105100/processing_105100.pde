

int ballSize = 20;
float ballX = 0;
float ballY = 0;
float dX;
float dY;
float easing = 0.1;
int pallX = 25;
int pallY = 550;
int pallSize = 25;
color red = color(255,44,44);
color green = color(66,203,99);
color blue = color(27,108,147);


void setup(){
  size (600,600);
  ballX = width/2;
  ballY = height/2;
  background(0);
  ellipseMode(CENTER);
  //pallette background
  fill(0);
  rect(0,520, 600,80);
  //red paint
  fill(red);
  ellipse(pallX,pallY, pallSize,pallSize);
  //green paint
  fill(green);
  ellipse(pallX+40,pallY, pallSize,pallSize);
  //blue paint
  fill(blue);
  ellipse(pallX+80,pallY, pallSize,pallSize);
}

void draw() {
  noStroke();
  dX = mouseX - ballX;
  ballX = ballX + dX/25.0;
  dY = mouseY - ballY;
  ballY = ballY + dY/25.0;
  ellipse(ballX,ballY, ballSize,ballSize);
  
  if (mouseY > 500 && mouseX > 450) {
      background(0);
      //pallette background
      fill(0);
      rect(0,520, 600,80);  
      //red paint
      fill(red);
      ellipse(pallX,pallY, pallSize,pallSize);
      //green paint
      fill(green);
      ellipse(pallX+40,pallY, pallSize,pallSize);
      //blue paint
      fill(blue);
      ellipse(pallX+80,pallY, pallSize,pallSize);
      } 
    else if (mouseY > 525) {
      ballY = 500;
      }
  
  if (mouseX > pallX-10 && mouseX < pallX+10 && 
      mouseY > pallY-10 && mouseY < pallY+10) {
      fill(red);
      } 
    else if (mouseX > pallX+30 && mouseX < pallX+50 && 
      mouseY > pallY-10 && mouseY < pallY+10) {
      fill(green);
      }
    else if (mouseX > pallX+70 && mouseX < pallX+90 && 
      mouseY > pallY-10 && mouseY < pallY+10) {
      fill(blue);
    }  
  } 


