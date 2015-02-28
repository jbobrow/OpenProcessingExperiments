
void setup () {
  size (600,600);
  int a= mouseX;
  int b=mouseY;
  background (255);
}

void draw () {
  strokeWeight (1); 
  noFill(); 
  stroke (0);
  triangle (100,200,450,10,270,270);
  triangle (100,200,370,400,270,270);
  triangle (260,318,50,490,370,400);
  line (450,10,180, 90);
  line (180,90,100,200);
  line (180,90,270,270);
  line (50,490,300,490);
  line (300,490,370,400);
  stroke (100);
  line (300,490,260,318);
  
}                
