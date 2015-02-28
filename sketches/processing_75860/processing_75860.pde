
//Sarah C, CP1 16/17, DoublingShapes
int limit = 1;

void setup()
{
  size(400, 400);
  frameRate(8);
}

void draw()
{
  int r = 1;
  background(80,31,31); 
  noStroke();
  cat();
  fill(int(random(150, 255)), int(random(30, 70)), int(random(60, 105)), 100);  
  while (r <= limit)
  {
    ellipse(int(random(400)), int(random(400)), int(random(40)), int(random(40)));
    r++;
  }
  limit = limit * 2;

  if (limit == 2048*2)
  {
    limit = 4;
    r = 2;
  }
  
  //text
  textAlign(CENTER);
  textSize(r + 8);
  fill(int(random(200)),0,0,140);
  text("AAAAAHHH!!!", 200,200);
}

void cat()
{
  //head
  fill(227,87,87,90);
  ellipse(200,200,50,50);
  triangle(170,170,175,200,190,190);
  triangle(230,170,215,200,200,190);
  
  //eyes
  fill(0,0,0,90);
  ellipse(185,200,8,12);
  ellipse(195,200,8,12);
  
  //mouth
  ellipse(205,214,13,9);
}



