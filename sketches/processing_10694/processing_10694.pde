

Munster ohmy;

void setup ()
{
    size( 900, 900 );
    frameRate( 8 );  
    ohmy = new Munster();
}

void draw ()
{
    background( 255 );
    ohmy.moveMe();
    ohmy.drawMe();
}


void mouseMoved ()
{
    ohmy.testMouseOver( mouseX, mouseY );
}

void mousePressed ()
{
    ohmy.testMousePressed( mouseX, mouseY );   
}

void mouseDragged ()
{
    ohmy.handleMouseDragged( mouseX-pmouseX, mouseY-pmouseY );
}

void mouseReleased ()
{
    ohmy.handleMouseReleased();
}

