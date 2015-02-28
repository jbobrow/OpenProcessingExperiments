
int square = 500;
int[] x = new int[square];
int[] y = new int[square];
float radius =50;
float a = 100;
float b = 50;
float c = 70;
float ballX;
float ballY;
float ballXSpeed = 20;
float ballYSpeed = 100;

void setup() {
  size(800, 800);
  for (int i = 0; i<x.length; i++) {
    x[i] = int( random(width) );
    y[i] = int( random(height) );
  }
}
void draw() {
  background(22, 95, 125);
  for (int i = 0; i<x.length; i++) {
    ellipse(x[i]+(mouseX/2)*i, y[i], 35, 35);
    
    noStroke();
     if ( dist(mouseX, mouseY, a, b) < radius+400) {
    fill(129, 125, 122);
    ellipse(400, 400, 100, 100);
  } else {
    fill(237, 153, 108);
    ellipse (400, 350, 40, 40);
  }
  ellipse(a, b, radius*2, radius*2);

}
 for (int z = 1; z <=width; z = z + 50) { 
   noFill();
   stroke(255);
   strokeWeight(2);
   ellipse(120, random(width), 20, 20);
   ellipse(700, random(width), 20, 20);
   ellipse(20, random(width), 20, 20);
   ellipse(260, random(width), 20, 20);
   ellipse(500, random(width), 20, 20);
 
 noStroke();
  for (int i = 0; i <= 600; i++){

      float d = dist(mouseX, mouseY, 50, i);
      fill(50, mouseX, mouseY);
      if (d < 600) {
        c = 0;
      }
      else {
        c = 50;
      }
      ellipse(400, 350, c, c);
      
       
}
 
  //background(255);
  ballX = ballX + ballXSpeed;
  ballY = ballY + ballYSpeed;
   
  fill(122, 222, 218);
  ellipse(ballX, ballY, 30, 30);
   
  if (ballX > width) {
      ballX = 0;
      }
  if (ballX < 0) {
      ballX = width;
  }
   
  if (ballY > height) {
      ballY = 0;
      }
  if (ballY < 0) {
      ballY = height;
  }
   
}

    }





