
float x1, y1, x2, y2, x3, y3, current_x, current_y;

void setup() {
     size(400, 400);
     frameRate(1000);
     x1 = 200;
     y1 = 10;

     x2 = 10;
     y2 = 390;

     x3 = 390;
     y3 = 390;

     current_x = x1;
     current_y = y1;

     background(200);
}

void draw() {
     for (int i = 0; i < 1000; i++) {
          stroke(0);
          int choice = (int)random(3) + 1;
          if (choice == 1) {
               current_x = (current_x + x1)/2;
               current_y = (current_y + y1)/2;
          }
          else if (choice == 2) {
               current_x = (current_x + x2)/2;
               current_y = (current_y + y2)/2;
          }
          else if (choice == 3) {
               current_x = (current_x + x3)/2;
               current_y = (current_y + y3)/2;
          }
          point(current_x, current_y);
     }
}



