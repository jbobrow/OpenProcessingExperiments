
PImage photo;

void setup()
{
  size(600,480);
  photo= loadImage("Snapshot_20120325.jpg");
}

void draw()
{
  println("X: " +mouseX, " Y: "+mouseY);
  image(photo,0,0,width,height);
  
  //face (right)//
  fill(#d1a594);
  stroke(#d1a594); //light//
  strokeWeight(6);
  triangle(378,253,428,360,450,303);
  fill(#9e7c70);
  stroke(#9e7c70);
  triangle(425,362,394,298,376,406);
  //face(left)//
  fill(#d1a594);
  stroke(#d1a594); //light//
  triangle(300,261,283,370,260,319);
  fill(#9e7c70);
  stroke(#9e7c70); //dark//
  triangle(285,373,296,310,339,406);
  //face center//
  fill(#d4907f);
  stroke(#d4907f); //light//
  triangle(299,302,319,347,377,327);
  quad(343,400,350,412,371,406,377,350);
  fill(#c46f69);
  stroke(#c46f69); //dark//
  triangle(323,359,340,394,381,345);
  triangle(349,312,385,325,390,293);
  
    //chin//
  noFill();
  strokeWeight(6);
  stroke(#ffc9b5);
  //left//
  bezier(261,322,265,371,303,397,350,412);
  //right//
  bezier(350,412,389,413,455,359,453,290);
  
  //lip top//
  fill(#a31939);
  stroke(#a31939);
  bezier(303,346,330,337,345,330,351,350);
  bezier(345,350,350,330,371,330,393,339);
  //lip bottom//
  fill(#d12049);
  stroke(#d12049);
  arc(350,347,94,32,0,PI);
  arc(350,347,94,32,(11*PI/6),(2*PI));
  
  //nose (left)//
  noFill();
  stroke(0,255,0);
  bezier(316,272,300,284,308,310,324,305);
  //nose (right)//
  bezier(367,267,383,275,390,302,368,302);
  //nose (bottom)//
  bezier(332,304,340,308,350,308,357,302);
  
  //background (left)//
  noStroke();
  fill(100,250,0,150);
  ellipse(52,95,180,400);
  fill(255,0,255,150);
  ellipse(52,95,100,300);
  fill(0);
  ellipse(52,95,50,50);
  
  //background (right)//
  fill(250,0,30,150);
  ellipse(600,60,265,150);
  fill(255,255,255,220);
  ellipse(600,60,230,100);
  fill(0,200);
  ellipse(600,60,80,80);
  
  //hair (left)//
  stroke(0,0,255);
  strokeWeight(3);
  float ly = 8.0;
  float lx = 305.0;
  while (lx > 10)
  {
  float nextX = lx - random(40);
  float nextY = ly + random(100);
  line(lx, ly, nextX, nextY);
  lx = nextX;
  ly = nextY;
  }
  //hair (right)//
  float lly = 35.0;
  float llx = 305.0;
  while (llx < width)
  {
  float nextXX = llx + random(30);
  float nextYY = lly + random(40);
  line(llx, lly, nextXX, nextYY);
  llx = nextXX;
  lly = nextYY;
  }
  
}


