
float mx;
float my;
float easing;
int index;
float[] xPoints;
float[] yPoints;
float rotate;
float scale;
float translateX;
float translateY;

void setup()
{
    size( 700, 400 );
    smooth();
    easing = .015;
    index = 0;
    xPoints = new float[4];
    yPoints = new float[4];
    translateX = width/2;
    translateY = height/2;
}

void draw()
{
    rotate(rotate);
    scale(scale);
    translate(translateX, translateY);
    mx += easing*(mouseX - mx);
    my += easing*(mouseY - my);
    
    background( 0, 0, 0, 10 );
    stroke( 255, 0, 0, 70 );

    for( float i = 0; i < 4; i += .3 )
    {
        line( xPoints[0], yPoints[0], mx - mx*i, my - my*i );
        line( xPoints[2], yPoints[2], mx - mx*i, my - my*i );
        line( xPoints[1], yPoints[1], mx - mx*i, my - my*i );
        line( xPoints[3], yPoints[3], mx - mx*i, my - my*i );
        line( xPoints[0], yPoints[0], mx + mx*i, my + my*i );
        line( xPoints[2], xPoints[2], mx + mx*i, my + my*i );
        line( xPoints[1], xPoints[1], mx + mx*i, my + my*i );
        line( xPoints[3], xPoints[3], mx + mx*i, my + my*i );
        line( xPoints[0], xPoints[0], mx*i, my*i );
        line( xPoints[2], xPoints[2], mx*i, my*i );
        line( xPoints[1], xPoints[1], mx*i, my*i );
        line( xPoints[3], xPoints[3], mx*i, my*i );
    }
    
}

void mouseClicked()
{
    xPoints[index] = mouseX;
    yPoints[index] = mouseY;
    index = (1 + index) % xPoints.length;
    rotate += .1;
    scale = random( 4 );
    translateX -= 10;
    translateY -= 10;
}

