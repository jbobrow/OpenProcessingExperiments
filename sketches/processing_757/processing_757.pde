
class Monstor
{ 
  int x, y, headSize;
  
  Monstor( int xPos, int yPos )
  {
    x = xPos; y = yPos;
  }
  
  void display()
  {
    rectMode(CENTER);
    pushMatrix();
    //robot center
    translate( x, y );
    rect(0,0,100,200);
    ellipseMode(CENTER);
    pushMatrix();
    translate( 0, -120 );
    // draw head
    ellipse(0,0,headSize,headSize);
    rect(17,-15,30,10);
    rect(-17,-15,30,10);
    ellipse(0,13,10,10);
    popMatrix();
    pushMatrix();
    translate(0,-50);
    // left arm
    line(-50,0,-150,20);
    // right arm
    line(50,0,150,20);
    popMatrix();
    pushMatrix();
    translate(0,100);
    line(0,0,-65,80);
    line(0,0,65,80);
    popMatrix();
    popMatrix();
  }
  
  void setHeadSize( int bigness )
  {
    headSize = bigness; 
  }

}



