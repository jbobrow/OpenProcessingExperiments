
drop water = new drop();
int ranx;
int rany;

void setup()
{
  size(650,650);
  ranx = width/2;
  rany = height/2;
  background(255);
}



void draw()
{
  
  fill(0,90);
  noStroke();
  water.drawdrop(2,ranx,rany);
  ranx = ranx + int(random(-3,3));
  rany = rany + int(random(-3,3));
  if ((rany==width) || (rany==0) || (ranx==width) || (ranx==0))
  {
    println("Piece complete");
    //saveFrame("piece-######.png"); //uncomment to save each peice
    ranx = width/2;
    rany = height/2;
    background(255);
    //println("Piece saved, starting next");
  }
}

public class drop
{
  public void drawdrop(int size,int x, int y)
  {
    ellipse(x,y,size,size);
  }
 
}
