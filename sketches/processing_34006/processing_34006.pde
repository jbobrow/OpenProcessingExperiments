

int number_of_squares = 100;
int[] ball_x_pos = new int[number_of_squares];
int[] ball_y_pos = new int[number_of_squares];
int[] x_speed = new int[number_of_squares];
int[] y_speed = new int[number_of_squares];
int[] sizes = new int[number_of_squares];

int temp_x_speed = 3;
int temp_y_speed = 3;

void setup() {
  size(400,400);
  rectMode(CENTER);
//  noStroke();
  for ( int i=0; i<number_of_squares; i++) {
    ball_x_pos[i] = int(random(width));
    ball_y_pos[i] = int(random(height));
    x_speed[i] = int( random(1,7));
    y_speed[i] = int( random(1,7));
    sizes[i] = int( random(10, 50) );
  }
  
}
void draw() {
  background(0, 140, 255);
  
  for (int i = 0; i<number_of_squares; i++) {
    //move object 
    ball_x_pos[i] += x_speed[i];
    ball_y_pos[i] += y_speed[i];
  
    //check the edges of the screen
    
    if ((ball_x_pos[i] > width) || (ball_x_pos[i]<0)) {
      x_speed[i] *= -1;  
//      temp_x_speed *= -1;
    }
    if ((ball_y_pos[i] > width) || (ball_y_pos[i]<0)) {
      y_speed[i] *= -1;    
    }
    
    //draw object
    strokeWeight(1);
    rect(ball_x_pos[i], ball_y_pos[i], sizes[i], sizes[i]);
    strokeWeight(4);
    point(ball_x_pos[i], ball_y_pos[i]);
  }
}
