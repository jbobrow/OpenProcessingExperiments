
//Ben Norskov
//500 Bouncing Cirlces
//9-25-12
int number_of_circles = 500; //lets draw a bunch of circles
int[] circle_xes = new int[number_of_circles];
int[] circle_yes = new int[number_of_circles]; //keep track of all the positions
int[] circle_x_speeds = new int[number_of_circles];
int[] circle_y_speeds = new int[number_of_circles]; //keep track of all the speeds
int circle_radius = 5; //make them all the same size
void setup() {
  size(600, 400);
  //initalize circle position
  /* don't need this; The for loop takes care of it!
   circle_xes[0] = random(width);
   circle_xes[1] = random(width);
   circle_xes[2] = random(width);
   circle_xes[3] = random(width);
   circle_xes[4] = random(width);
   circle_xes[5] = random(width);
   circle_xes[6] = random(width);
   circle_xes[7] = random(width);
   circle_xes[8] = random(width);*/
  for (int i = 0; i<number_of_circles; i+=1) {// repeat for the number of circles you are drawing
    circle_xes[i] = int(random(width));
    circle_yes[i] = int(random(height)); //random position
    circle_x_speeds[i] = int(random(10)-5);
    circle_y_speeds[i] = int(random(10)-5);//random speed
    //the random function gives you a random float. to convert to an int, you have to write int(random(##))
  }
}

void draw() {
  background(29, 140, 80);
  for (int i = 0; i<number_of_circles; i+=1) {
    circle_xes[i] += circle_x_speeds[i];
    circle_yes[i] += circle_y_speeds[i];//move the circles

    if (circle_xes[i] > width-circle_radius) {//bounce off right side
      circle_x_speeds[i] *= -1;
      circle_xes[i] = width - circle_radius;
    }
    if (circle_xes[i] < circle_radius) {//bounce off left side
      circle_x_speeds[i] *= -1;
      circle_xes[i] = circle_radius;
    }
    if (circle_yes[i] < circle_radius) {//bounce off top
      circle_y_speeds[i] *= -1;
      circle_yes[i] = circle_radius;
    }
    if (circle_yes[i] > height - circle_radius) {//bounce off bottom
      circle_y_speeds[i] *= -1;
      circle_yes[i] = height - circle_radius;
    }
    fill(50, 100, 100);
    ellipse(circle_xes[i], circle_yes[i], 2*circle_radius, 2*circle_radius);
  }
}
