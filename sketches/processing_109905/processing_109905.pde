
int startRectX , startRectY ;
int endRectX , endRectY ;
int rectWidth, rectHeight ;

void setup()
{
  size( 640 , 480 );
  background( #CFCFCF );
  smooth();
}


void draw()
{

}

boolean isRectCreated = false;

void mousePressed()
{   
    println( "mousePressed" );
    if( isRectCreated == false )
    {
        startRectX = mouseX;
        startRectY = mouseY;    
        endRectX = mouseX;
        endRectY = mouseY;
    }
}

void mouseClicked()
{   
    if( isRectCreated )
    {
    //println("mouseClicked");
      if( mouseX >= startRectX && mouseX <= endRectX && mouseY >= startRectY && mouseY <= endRectY )
      {
            float cX = -( ( endRectX - mouseX ) - ( mouseX - startRectX ) );
            float cY = -( ( endRectY - mouseY ) - ( mouseY - startRectY ) );
        
             int x = int( map( cX , -rectWidth , rectWidth , 0 , width ) );
             int y = int( map( cY , -rectHeight , rectHeight , 0 , height ) ); 
    

            println("X: "+x + "     Y: "+y);
    
            rectMode( CENTER );
            fill(#0000FF);
            noStroke();
            rect(x, y, 2, 2);
      }
    }
}


void mouseDragged()
{
    println("mouseDraged");
    rectMode( NORMAL );
    fill( #CFCFCF );
    noStroke();
    rect( 0 , 0 , width , height );

    
    endRectX = mouseX - startRectX;
    endRectY = mouseY - startRectY;


    noFill();
    stroke( #FF0000 , 100 );
    rect( startRectX , startRectY , endRectX , endRectY );

    rectWidth = endRectX - startRectX ;
    rectHeight = endRectY - startRectY ;
        
        //*
        line( startRectX + (rectWidth / 2) , startRectY , startRectX + ( rectWidth / 2 ) , endRectY );
        line( startRectX , startRectY + ( rectHeight / 2 ), endRectX , startRectY + ( rectHeight / 2 ) );
        //*/
        
        
        isRectCreated = true;
        
        
        
    println( "startRectX = " + startRectX + "    startRectY = " + startRectY );
    println( "endRectX = " + endRectX + "    endRectY = " + endRectY );
    println( "rectWidth: "+rectWidth + "   rectHeight: "+rectHeight );
}


void mouseMoved()
{
    //println("mouseMoved");
}
