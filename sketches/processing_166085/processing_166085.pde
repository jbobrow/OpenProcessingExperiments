
void setup() {
  size(500, 400);
}
//Init
int x = 300;
int y = 50;
int x_direction = 1;
int y_direction = 1;
int game_over = 0;
int score = 0;

void draw() {
  if (game_over == 0) {
    background(240);
    fill(0, 0, 255);
    noStroke();
    rect(0, 0, 35, height);

    //Draw Red Ball
    fill(255, 0, 0);
    noStroke();
    ellipse(x, y, 30, 30);

    //Move Red Ball Coordinates
    x += (4 * x_direction);
    y += (4 * y_direction);

    //Draw Paddle
    strokeWeight(5);
    stroke(0);
    line(50, mouseY+25, 50, mouseY-25);


    //Change Direction
    if ((x + 15 > width) || (x < 15) || (   ((x-15 >= 45) && (x-15 <=55)) && ( (mouseY+25>=y) && (y>=mouseY-25) )   )) {
      x_direction *= -1;
      score+=1;
    }
    if ((y + 15 > height) || (y < 15)) {
      y_direction *= -1;
    }

    //Score
    text(round(score / 2), width/2, height/2);
    //Game Over
    if (x<15) {
      game_over = 1;
    }
  }
}



