
int counter = 0;

void setup()
{
  size (400, 400);
  background (90, 242, 228);
  
  strokeWeight (6);
  stroke (255, 0, 0);
  line (0, 0, 400, 400);
  
  strokeWeight (10);
  stroke (0, 0, 255);
  line (20, 100, 0, 200);
  
  noStroke();
  fill (0, 255, 0);
  rect (50, 50, 40, 80);

  ellipse (200, 200, 100, 100);
  
  fill(#3A3DC6);
  stroke (0);
  triangle (50, 50, 75, 0, 100, 50);
  
  strokeWeight (10);
  point (300, 300);
  
  quad (38, 31, 86, 20, 69, 63, 30, 76);
  
  arc (300, 300, 100, 100, radians(45), radians (90));
}





