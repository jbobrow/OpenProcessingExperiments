
float circle1 = 0;
float circle2 = 0;
float center;
int CD = 1;
 
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

if (circle1 > 500) {
  circle1 = circle1 * -1;
}


fill (0,0);

  for (int CD=1; CD < 500; CD = CD + 100) { 
  ellipse (300, 300, CD, CD);
  }
  
  
  
  line (0,0, 600, 600);
  line (600,0, 0, 600);
  
  stroke (255, 0 , 0);
  ellipse (120, 230 , circle2 , circle2);
  circle2 = circle2 + 2;
  circle2 = circle2 % 20;

}


