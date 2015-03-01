
String [] pos2d;
String [] posd;
String [] boundb;

int index = 0;

void setup ()
{
  size (1000, 1000);
  background (255);
  frameRate(100);

  pos2d = loadStrings("Tracked2DPos_CamCenter_25fps.txt");
  println("pos2d hat " + pos2d.length+ " Zeilen");

  posd = loadStrings("Tracked3DPosition_25fps.txt");
  println("posd hat " + posd.length+ " Zeilen");

  boundb = loadStrings("BoundingBox_CamCenter_25fps.txt" );
  println("boundb hat " + boundb.length+" Zeilen");
}

void draw ()
{ 
  int Kx= int(pos2d[index].split(" ")[0])/2;
  int Ky= int(pos2d[index].split(" ")[1]);

  int dx = int(posd[index].split(" ")[1])*100;
  int dy = int(posd[index].split(" ")[2])*100;

  int bx1 = int(boundb[index].split(" ")[0])/2;
  int by1 = int(boundb[index].split(" ")[1]);
  int bx2 = int(boundb[index].split(" ")[2])/2;
  int by2 = int(boundb[index].split(" ")[3]);
  float x1= width/2;
  float y1= height/2;

  background(255);
  noStroke();
  fill(50);
  ellipse(x1, y1, 7, 7);
  ellipse(Kx, Ky, 7, 7);
  ellipse(dx, dy, 7, 7);
  ellipse(bx1, by1, 7, 7);
  ellipse(bx2, by2, 7, 7);
 // ellipse(x6, y6, 7, 7);
  stroke(0);
  line (x1, y1, Kx, Ky);
  line (x1, y1, dx, dy);
  line (x1, y1, bx1, by1);
  line (x1, y1, bx2, by2);
  //line (x1, y1, x6, y6);

  //outlines
  line (x1, y1, Kx, Ky);
  line (Kx, Ky, dx, dy);
  line (dx, dy, bx1, by1);
  line (bx1, by1, bx2, by2);
 // line (bx2, by2, x6, y6);


  index++;
}



