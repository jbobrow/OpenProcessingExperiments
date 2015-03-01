
float slow_circle_x[] = {
};
float slow_circle_y[] = {
};
float move_x[] = {
};
float move_y[] = {
};
void setup() {
  size(480, 360);
  stroke(255);
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
  noFill();

  int i=0;
  while (i<slow_circle_x.length) {
    float slow_circle_size = random(10,100);
    ellipse(slow_circle_x[i]+random(-10,10), slow_circle_y[i]+random(-10,10), slow_circle_size, slow_circle_size);
    slow_circle_x[i] = slow_circle_x[i] + move_x[i]; 
    slow_circle_y[i] = slow_circle_y[i] + move_y[i];

    if (slow_circle_x[i] > width) {
      slow_circle_x[i] = 0;
      //move_x[i] = -move_x[i];
    }

    if (slow_circle_y[i] > height) {
      slow_circle_y[i] = height;
      move_y[i] = -move_y[i];
    }
    if (slow_circle_x[i] < 0) { 
      slow_circle_x[i] = 0;
      move_x[i] = -move_x[i];
    }
    if (slow_circle_y[i] < 0) {
      slow_circle_y[i] = 0;
      move_y[i] = -move_y[i];
    }
    i =i+1;
  }
}

void mousePressed() {
  slow_circle_x=append(slow_circle_x, mouseX);
  slow_circle_y=append(slow_circle_y, mouseY);
  move_x = append(move_x, random(-2, 2));
  move_y=append(move_y, random(1, 4));
}

