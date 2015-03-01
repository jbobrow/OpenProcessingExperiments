
float startTime, time;
float dir = 2;
float alpha = 0;

void setup() 
{
  size(500,500);
  startTime = millis();
}


void draw() 
{
    time = (millis() - startTime) * 0.001f;
    
    background( 0 );

    fill(255, 0, 0);
    ellipse( width*0.5+cos(time)*200, height*0.5+cos(time*4)*200, 100,100 );
    
    
    alpha += dir;
    fill( 0, alpha );
    rect( 0, 0, width, height );
    
    if( alpha < 0 || alpha > 255 ) dir *= -1;
}

