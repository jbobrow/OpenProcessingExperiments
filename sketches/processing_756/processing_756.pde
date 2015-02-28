
class Monster
{
  //variables
  int x, y;
  int legLength;
  int eyeSize;
  int headSize;
  int noseSize;
  int bodyHeight;
  int bodyWidth;
  int armSize;

  Monster()
  {
    legLength = 30;
    eyeSize = 3;
    headSize = 56;
    noseSize = 13;
    bodyHeight = 90;
    bodyWidth = 10;
    armSize = 80;
  }

  //dislay
  void display ()
  {
    
    if( keyPressed )
    {
      if( key == 'a' )
      {
        headSize++;
       println( "a key was pressed" ); 
      }
     
      if( key == 'b' )
      {
        headSize--;
       println( "b key was pressed" ); 
      }
      if( key == 'c' )
      {
       noseSize++;
       println( "c key was pressed" ); 
      }
    
      if( key == 'd' )
      {
        noseSize--;
       println( "d key was pressed" ); 
      }
        if( key == 'e' )
      {
        bodyWidth++;
       println( "e key was pressed" ); 
      }
        if( key == 'f' )
      {
        bodyWidth--;
       println( "f key was pressed" ); 
      }
      
      if( key == 'g' )
      {
        bodyHeight++;
       println( "g key was pressed" ); 
      }
        if( key == 'h' )
      {
        bodyHeight--;
       println( "h key was pressed" ); 
      }
  if( key == 'i' )
      {
        eyeSize++;
       println( "i key was pressed" ); 
      }
        if( key == 'j' )
      {
        eyeSize--;
       println( "j key was pressed" ); 
      }
      if( key == 'k' )
      {
        legLength++;
       println( "k key was pressed" ); 
      }
        if( key == 'l' )
      {
        legLength--;
       println( "l key was pressed" ); 
      }
    }
        
    pushMatrix();
    armSize = mouseX;
    rectMode(CENTER);
    ellipseMode(CENTER);
    smooth();

    int centerX = width/2;
    int centerY = height/2;
    int displacement = 15;

    ellipseMode(CENTER);
    rectMode(CENTER);
    stroke(0);
    fill(150);
    //body
    pushMatrix();
    translate(100, 100);
    rect(0, 0, bodyWidth, bodyHeight);
    fill(225);
    //head
    translate(0, -30);
    ellipse(0, 0, headSize, headSize);
    fill(0);
    //nose
    ellipse(0, 5, noseSize, noseSize*2);
    fill(255);
    stroke(0);
    fill(0);
    //right pupil
    ellipse(15, -5, eyeSize, eyeSize+3);
    //left pupil
    ellipse(-15, -5, eyeSize, eyeSize+3);
    //right arms
    translate(0, headSize/2);
    line(-bodyWidth/2, 0, -armSize, 0);
    //left arm
    line(bodyWidth/2, 0, armSize, 0);
    //left leg
    translate(0, bodyHeight/2);
    line (bodyWidth/2, 0, legLength, legLength);
    //right leg
    line(-bodyWidth/2, 0, -legLength, legLength);
    popMatrix();
    popMatrix();
  
  }
  
  void move( int x, int y )
  {
    
    
  }

}



