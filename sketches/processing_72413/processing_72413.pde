
float circle1 = 0;
float circle2 = 0;
float center;

 
void setup() {
  size(600,600);
  smooth();
  background(0);
  center = width / 2;
} 
   
    
void draw() {

  stroke (100, 255, 100);
  fill (50, 50);
  
ellipse (center, center , circle1 , circle1);

circle1 = circle1 + 10;


circle1 = circle1 % 500;


fill (0,0);

  ellipse (300, 300, 510, 510);
  ellipse (300, 300, 505, 505);
  ellipse (300, 300, 500, 500);
  ellipse (300, 300, 400, 400);
  ellipse (300, 300, 300, 300);
  ellipse (300, 300, 200, 200);
  ellipse (300, 300, 100, 100);
  line (0,0, 600, 600);
  line (600,0, 0, 600);
  
  stroke (255, 0 , 0);
  ellipse (120, 230 , circle2 , circle2);
  circle2 = circle2 + 2;
  circle2 = circle2 % 20;
  
  ellipse (400, 160 , circle2 , circle2);
  circle2 = circle2 + 2;
  circle2 = circle2 % 20;

}


