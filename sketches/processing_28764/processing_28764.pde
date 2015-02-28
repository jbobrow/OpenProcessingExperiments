
float r = 10;

void setup()
{
    size( 450, 400 );
    
    background(0);
    noFill();
    stroke(255);
    smooth();    

    noLoop();
}

void draw()
{
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 9; j++) {
            pushMatrix();
            translate( i * 50, j * 50 );
            rotate( random( TWO_PI ));
            circleShape( r, floor(random(3, 6)) );
            popMatrix();    
        }
    }
}

void circleShape( float radius, int numSpikes )
{
    float amp = random( 0.05, 0.5 );

    beginShape();

    for (int i = 0; i < 360; i++) {
        float a =  (1 + amp * cos(radians(i * numSpikes)));
        float x = cos(radians(i)) * radius * a;
        float y = sin(radians(i)) * radius * a;
        vertex(x, y);
    }

    endShape(CLOSE);

}
