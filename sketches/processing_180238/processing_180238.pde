

float chx = 25;
float chy  = 175;

void setup()
{
  size (400, 450);
}

void drawhouse1 (float h1x, float h1y)
{
  //house
  fill  (125, 25, 10);
  rect (h1x, h1y, 30, 30);
  //roof
  fill (230);
  triangle (h1x, h1y, h1x +15, h1y -10, h1x + 30, h1y);
  //windows
  fill (240, 220, 20);
  rect (h1x +5, h1y +5, 5, 5);
  rect (h1x +20, h1y +5, 5, 5);
  //door
  fill (10, 24, 142);
  rect (h1x +15, h1y +15, 10, 15);
}
void drawhouse2 (float h2x, float h2y)
{
  //house
  fill  (125, 25, 10);
  rect (h2x, h2y, 40, 25);
  //roof
  fill (230);
  triangle (h2x, h2y, h2x +20, h2y -10, h2x + 40, h2y);
  //windows
  fill (240, 220, 20);
  rect (h2x +5, h2y +5, 5, 5);
  rect (h2x +25, h2y +5, 5, 5);
  //door
  fill (10, 24, 142);
  rect (h2x +15, h2y +10, 10, 15);
}

void drawhouse3 (float h3x, float h3y)
{
  //house
  fill  (0);
  rect (h3x, h3y, 30, 30);
  //roof
  fill (230);
  triangle (h3x, h3y, h3x +15, h3y -10, h3x + 30, h3y);
  //windows
  fill (240, 220, 20);
  rect (h3x +5, h3y +5, 5, 5);
  rect (h3x +20, h3y +5, 5, 5);
  //door
  fill (10, 24, 142);
  rect (h3x +15, h3y +15, 10, 15);
}
void draw ()
{
  background (66, 54, 252);
  noStroke ();


  //sky
  fill (66, 54, 252);
  rect (random (0, width), random( 0, 50), width, height);

  //moon
  fill (255);
  ellipse (350, 50, 30, 30);
  fill (66, 54, 252);
  ellipse (340, 50, 30, 30);

  //star
  stroke (255);
  strokeWeight (2);
   point ( random (0, 400), random (0, 100));

  noStroke ();

  //foreground
  fill (255);
  rect (0, 200, 400, 200);

  fill (250);
  ellipse (50, 200, 200, 100);
  ellipse (200, 220, 200, 100);
  ellipse (350, 210, 200, 100);
  ellipse (100, 210, 200, 100);

  fill (255);
  ellipse (100, 350, 300, 100);
  ellipse (300, 350, 200, 100);
  ellipse (300, 350, 200, 100);

  //pond
  fill (236, 235, 255);
  ellipse (250, 300, 60, 50);
  ellipse (270, 300, 50, 40);
  //road
  fill (200);
  ellipse (0, 400, 100, 270);
  fill (255);
  ellipse (- 10, 400, 95, 270);
  //paths
  stroke (200);
  strokeWeight (5);
  //line ( 50, 270, 30, 270);
  line ( 50, 300, 30, 300); 
  line ( 60, 330, 35, 330);
  line ( 70, 360, 40, 360);
  line ( 80, 390, 45, 390);

  noStroke ();
  drawhouse1 (50, 270);
  drawhouse1 (60, 300);   
  drawhouse1 (75, 330);
  drawhouse1 (90, 360);

  drawhouse2 (200, 350);
  drawhouse2 (250, 350);
  drawhouse2 (300, 350);
  drawhouse2 (350, 350);
  
  drawhouse3 (100,230);
  drawhouse3 (200,200);
  drawhouse3 (290,220);
//roads
  stroke (200);
  strokeWeight (10);
  line (180, 390, width, 390);
  line (180,390, 160, 230);
  //housepaths
  strokeWeight (5);
  line (220, 385, 220, 375);
  line (270, 385, 270, 375);
  line (320, 385, 320, 375);
  line (375, 385, 375, 375);
  //hillpaths
  line(160,280, 120,260);
  line(160,280,215,230);
  line (160, 280, 310, 250);
  //churchpath
  line (160,230, 100,215);
  
  noStroke ();
//church
//light
fill (240, 220, 20);
triangle (chx, chy + 45, chx + 100, chy + 45,chx +100,chy +10);
fill (19,7,162);
rect (chx, chy, 75, 45);

//windows
  fill (240, 220, 20);
  rect (chx +2,chy + 2,8,30);
  rect (chx +12,chy +2,8,30);
  rect (chx + 22,chy + 2,8,30);
  rect (chx +32,chy +2,8,30);
  rect (chx +42,chy +2,8,30);
  rect (chx +52,chy +2,8,30);
  rect (chx +62,chy +2,8,30);
  
//steeple
fill (200);
triangle (chx,chy, chx +30, chy, chx + 15, chy - 70);
//roof
rect (chx,chy ,75, 25);

fill (0);
textSize (10);
text ("no one heard a thing..... ",5,420);
text ("but in the morning it was simply no longer there.......", 5,435);
text ("One old man said that it had... 'just gone back home.......'", 5, 445);

chx = chx + 0.05;
chy= chy - 0.05;
}

