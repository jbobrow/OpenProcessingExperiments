
int a=500;
int b=700;

size (800, 600);
  background (0);
  noStroke();
  smooth ();
  fill (255, 150, 60, 25);
  
   for(int y=2; y<width; y+=10){
  stroke(255, 150, 60, 25);
  strokeWeight (2);
  line (y, 0, y, 600);
  line (0, y, 800,y);
  strokeWeight (3);
  line (y/2, 0, y, 600);
  line (0, y, 800,y/2);
  stroke (0, 175);
  strokeWeight (3.5);
  line (y, 0, y/2, 600);
  line (0, y/2, 800,y);
  stroke (0, 75);
  strokeWeight (2.5);
  line (y*.5, 0, y, 400);
  line (0, y, 300,y*.5);
  stroke (255, 75);
  strokeWeight (.5);
  line (y, 0, y/2, 500);
  line (0, y/2, 300,y);
  stroke (175, 50);
  strokeWeight (.5);
  line (y, 0, y, 800);
  line (0, y, 600,y);
  
}

