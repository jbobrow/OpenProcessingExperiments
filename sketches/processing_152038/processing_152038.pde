
String [] pos;
String [] boundb;

void setup ()
{
  size (800, 800);
  background (255);
  frameRate(5);
  pos = loadStrings("BoundingBox_CamCenter_25fps.txt");
  
  println("pos hat " + pos.length+ " Zeilen");
  boundb = loadStrings("Tracked2DPos_CamCenter_25fps.txt" );
   println("boundb hat " + boundb.length+" Zeilen");
}

void draw ()
{ 
  float x1= width/2;
  float y1= height/2;
  float x2= random(width);
  float y2= 100; 
  float x3= random(width);
  float y3= 70; 
  float x4= random(width);
  float y4= 10; 
  float x5= random(width);
  float y5= 200; 
  float x6= random(width);
  float y6= 350;
  background(255);
  noStroke();
  fill(50);
  ellipse(x1, y1, 7, 7);
  ellipse(x2, y2, 7, 7);
  ellipse(x3, y3, 7, 7);
  ellipse(x4, y4, 7, 7);
  ellipse(x5, y5, 7, 7);
  ellipse(x6, y6, 7, 7);
  stroke(0);
  line (x1, y1, x2, y2);
  line (x1, y1, x3, y3);
  line (x1, y1, x4, y4);
  line (x1, y1, x5, y5);
  line (x1, y1, x6, y6);

  //outlines
  line (x1, y1, x2, y2);
  line (x2, y2, x3, y3);
  line (x3, y3, x4, y4);
  line (x4, y4, x5, y5);
  line (x5, y5, x6, y6);
}



