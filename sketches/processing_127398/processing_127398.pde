
void setup()
{
  size(400, 400);
  background(140,178,198);
  
  strokeWeight(1);
  line(0, 0, 400, 400);
  
  strokeWeight(10);
  stroke(255, 0, 0);
  line(20, 100, 0, 200);
  
  strokeWeight(4);
  stroke(0, 255, 0);
  fill(0, 255, 0);
  rect(20, 20, 100, 60);
  
  ellipse(200, 200, 100, 100);
  
  stroke(#3A3DC6);
  strokeWeight(10);
  point(300, 300);
  
  arc(300, 300, 100, 100, 0, PI/2);
  arc(200, 200, 150, 150, radians(45), radians(90));
  
  fill(#3A3DC6);
  quad(38, 31, 86, 20, 69, 63, 30, 76);
}



