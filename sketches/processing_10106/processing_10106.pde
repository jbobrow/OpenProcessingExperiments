
 
void augen ( float x, float  y )
{
    auge(x - 20, y, 30, 30);
    auge(x + 20, y, 30, 30); 
}
void auge ( float pos1, float pos2, float rad1, float rad2)
{
    pushStyle();
    pushMatrix();
    noStroke();
    ellipse( pos1, pos2, rad1, rad2);
   fill(random (100), 0, 0 );
    stroke(255, 230, 0);
 
    float a = atan2( mouseY-pos2, mouseX-pos1 );
    float d = dist( mouseX, mouseY, pos1, pos2 );
    translate( pos1, pos2 );
    rotate(a);
    translate( d / 20, 0 );
    
    ellipse( 0,0, rad1/3, rad2/3 );
    popMatrix();
    popStyle();
}

