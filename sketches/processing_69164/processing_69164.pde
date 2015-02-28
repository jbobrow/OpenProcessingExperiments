
int n = 60;

void setup()
{
  size(700,400);
  smooth();
}

void draw()
{
  background(0);
  outerWalls();
  innerWalls();
}

void outerWalls()
{
  //outer rectangle
  stroke(0,0,255);
  noFill();
  rect(10,10,680,380);
  rect(20,20,660,360);
  
  //4 rectangles attaching to outer rectangle
  rect(195,20,10,85);
  rect(700-205,20,10,85);
  rect(195,295,10,85);
  rect(700-205,295,10,85);
  stroke(0);
  strokeWeight(2);
  line(197,20,203,20);
  line(497,20,503,20);
  line(197,380,203,380);
  line(497,380,503,380);
}

void innerWalls()
{
  //L's
  stroke(0,0,255);
  strokeWeight(1);
  rect(83,95,58,10);
  rect(73,95,10,77);
  rect(83,295,58,10);
  rect(73,228,10,77);
  rect(559,95,58,10);
  rect(617,95,10,77);
  rect(559,295,58,10);
  rect(617,228,10,77);
  stroke(0);
  strokeWeight(2);
  line(83,97,83,103);
  line(83,297,83,303);
  line(617,97,617,103);
  line(617,297,617,303);
  
  //horizontal walls
  stroke(0,0,255);
  strokeWeight(1);
  rect(142,162,63,10);
  rect(142,227,63,10);
  rect(495,162,63,10);
  rect(495,227,63,10);
  rect(259,95,182,10);
  rect(259,295,182,10);
  
  //monster nest
  rect(259,159,182,82);
  rect(269,169,162,62);
  stroke(0);
  strokeWeight(2);
  rect(310,159,80,10);
  stroke(0,0,255);
  strokeWeight(1);
  line(310,159,310,169);
  line(390,159,390,169); 
}
