
// Meredith Hasson's Snowman
size(640, 480);
noStroke();
/*colorMode(RGB, 0, 0, 255);
for(int i=0; i<640; i++) 
{
  for(int j=0; j<480; j++) 
  {
    stroke(i, j, 0);
    point(i, j);
  }
}*/

background(135,206,250);
smooth();
stroke(255,255,255);
strokeWeight(2);
for (int i = 0; i < 640; i = i+1) 
{
  float k = random(0, 480);
  int m = int(k);
  point(i, m);
}
for (int j = 0; j < 480; j = j+1) 
{
    float l = random(0, 640);
    int n = int(l);
    point(n, j);
}
fill(255,255,255);
stroke(255, 255, 255);
ellipse(320, 165, 80, 85);
ellipse(320, 260, 120, 125);
ellipse(320, 385, 160, 165);
fill(0, 0, 0);
stroke(255, 255, 255);
ellipse(305, 155, 10, 10);
ellipse(335, 155, 10, 10);
fill(255, 140, 0);
triangle(360, 180, 320, 165, 320, 180);
fill(148, 0, 211);
ellipse(320, 258, 12, 12);
fill(34, 139, 34);
ellipse(320, 225, 12, 12);
fill(28, 200, 100);
ellipse(320, 290, 12, 12);
fill(0,0,0);
stroke(0,0,0);
rect(280, 110, 80, 20);
rect(290, 90, 60, 40);
strokeWeight(3);
line(270, 240, 230, 180);
line(370, 240, 410, 180);



