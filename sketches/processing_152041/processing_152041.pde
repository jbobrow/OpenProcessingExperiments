
String [] pos;
String [] boundb;
int index = 0;

void setup ()
{
  size (800, 800);
  background (255);
  frameRate(100);
  pos = loadStrings("Tracked2DPos_CamCenter_25fps.txt");

  println("pos hat " + pos.length+ " Zeilen");
  boundb = loadStrings("BoundingBox_CamCenter_25fps.txt" );
  println("boundb hat " + boundb.length+" Zeilen");
}

void draw ()
{ 
  int bx1 = int(boundb[index].split(" ")[0]);
  int by1 = int(boundb[index].split(" ")[1]);
  int bx2 = int(boundb[index].split(" ")[2]);
  int by2 = int(boundb[index].split(" ")[3]);
  /* float x1= width/2;
   float y1= height/2;
   float x2= ;
   float y2= ; 
   float x3= ;
   float y3= ; 
   float x4= ;
   float y4= ; 
   float x5= ;
   float y5= ; 
   float x6= ;
   float y6= ;
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
   line (x5, y5, x6, y6);*/
  println(bx1);
  println(bx2);
  println(by1);
  println(by2);
  int diffy = by2-by1;
  int diffx = bx2-bx1;
  translate(width/2,height/2);
  rect (0,0, diffx,diffy);
  println("y Seite ist "+ diffy);
  println("x Seite ist "+ diffx);
  index++;
}



