
float x1, y1, z1, 
x2, y2, z2, 
x3, y3, z3, 
x4, y4, z4, 
x5, y5, z5, 
current_x, current_y, current_z;

void setup() {
     size(500, 500, P3D);
     frameRate(60);
     x1 = 200;
     y1 = 0;
     z1 = -100;

     x2 = 0;
     y2 = 400;
     z2 = 0;

     x3 = 400;
     y3 = 400;
     z3 = 0;

     x4 = 0;
     y4 = 400;
     z4 = -200;

     x5 = 400;
     y5 = 400;
     z5 = -200;

     current_x = x1;
     current_y = y1;
     current_z = z1;

     background(200);
}

void draw() {
     for (int i = 0; i < 1000; i++) {
          stroke(0);
          int choice = (int)random(5) + 1;
          if (choice == 1) {
               current_x = (current_x + x1)/2;
               current_y = (current_y + y1)/2;
               current_z = (current_z + z1)/2;
          }
          else if (choice == 2) {
               current_x = (current_x + x2)/2;
               current_y = (current_y + y2)/2;
               current_z = (current_z + z2)/2;
          }
          else if (choice == 3) {
               current_x = (current_x + x3)/2;
               current_y = (current_y + y3)/2;
               current_z = (current_z + z3)/2;
          }
          else if (choice == 4) {
               current_x = (current_x + x4)/2;
               current_y = (current_y + y4)/2;
               current_z = (current_z + z4)/2;
          }
          else if (choice == 5) {
               current_x = (current_x + x5)/2;
               current_y = (current_y + y5)/2;
               current_z = (current_z + z5)/2;
          }
          point(current_x, current_y, current_z);
     }     
}




