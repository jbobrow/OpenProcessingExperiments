
float angle = 0.0;
float offset = 60;
float scalar = 40;
float speed = 0.03;
int [] colors;

void setup() {  
  size(400, 120);
  smooth(); 
  colors = new int [5];
  colors[0] = #161BF0;
  colors[1] = #8216F0;
  colors[2] = #61F016;
  colors[3] = #F06616;
  colors[4] = #16F0DF;
  frameRate(5);
}

void draw() {

   background(0);
   for (float x = 0.0; x <= width + 100; x +=0.5) {
     float y1 = offset + sin(angle) * scalar;
     float y2 = offset + sin(angle + 0.4) * scalar;
     float y3 = offset + sin(angle + 0.8) * scalar;
     fill(colors[floor(random(1, 5))]);
     ellipse(x, y1, 40, 40);
     ellipse(x-40, y2, 40, 40);
     ellipse(x-80, y3, 40, 40);
     angle += speed;
   }
}
