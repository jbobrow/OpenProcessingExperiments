
void setup()
{
    size(450, 400);
    rectMode(CENTER);
    
    noLoop();
}

void draw()
{
    background(0);
    translate(width/2, height/2);
    smooth();
    noFill();
    stroke(255);

    for (int i = 1; i < 20; i++) {
        roundedRect( i * 20, i * 15, i ); 
    }
}


void roundedRect(float w, float h, float r)
{
    beginShape();
    vertex(  w/2 - r, -h/2 );
    bezierVertex( w/2 - r , -h/2, w/2, -h/2, w/2 , -h/2 + r);
    vertex(  w/2 , h/2 - r );
    bezierVertex( w/2, h/2 , w/2 - r , h/2 , w/2 - r, h/2);
    vertex( -w/2 + r,  h/2 );
    bezierVertex( - w/2, h/2, -w/2, h/2 - r, -w/2 , h/2 - r );
    vertex( -w/2 , -h/2 + r );
    bezierVertex( -w/2, -h/2, -w/2 + r, -h/2, -w/2 + r, -h/2 );
    endShape(CLOSE);
}               
