
PImage img0; 
int radius = 10;
float circle_y = -100;
float speed = 0.0;
static float acceleration = 0.1;
boolean position_positive = true;
float[] line_y = new float [240];
int loop_control;

void setup() {
size(500,700);
img0 = loadImage("amperstand_art.jpg");
frameRate (60);
  for (int x = 0; x < line_y.length; x += 1)
    line_y[x] = 0;
}

void draw() {
background(255);
image(img0,60,110);
noStroke();

fill(#D1D1D1,100);
rect(30,500,400,600);
fill(#35A8D3,100);
rect(100,0,20,700);



   fill (222, 222, 222, 220);
   ellipse (0, (height/2) + circle_y, radius, radius);
   fill (0, 0, 0, 220);
   ellipse (0, ((height/2) - 14) + circle_y, radius, radius);
   ellipse (0, ((height/2) + 14) + circle_y, radius, radius);
   
    line_y[0] = circle_y;
    for (loop_control = (line_y.length - 1); loop_control > 0; loop_control -= 1){
      fill (220, 220, 220, 220);
      ellipse (249 - (line_y.length - loop_control), (height/2) + line_y[loop_control], 1, 1);
      fill (0, 0, 0, 220);
      ellipse (250 - (line_y.length - loop_control), (height/2) + line_y[loop_control - 1], 1, 1);
      line_y[loop_control] = line_y[loop_control - 1];
    }
 
  
   if (circle_y >= 0){
     speed += acceleration;
     circle_y += 10 * speed;
     position_positive = true;
   }
   else if (circle_y < 0){
     speed += acceleration;
     circle_y += 10 * speed;
     position_positive = false;
  }
 
   if ((circle_y >= 0 && position_positive == false)
        || (circle_y <= 0 && position_positive == true))
     acceleration *= -1.0;
   else if (circle_y > 100 || circle_y < -100)
     acceleration *= 1.0;
} 



