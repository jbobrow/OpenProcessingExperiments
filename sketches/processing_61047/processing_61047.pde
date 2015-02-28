
float centerX, centerY;
float x, y;
float a,b;
float amp = 666;
 
//////////////////////////////////////////////////////////////////////////////
void setup() {  // this is run once.   
    
    background(#EFEFEF);
    size( 666, 666); 
 
    smooth();
    noFill();
 
    centerX = width/2;
    centerY = height/2;
 
    smooth();
    strokeWeight(2);
} 
 
 
//////////////////////////////////////////////////////////////////////////////
void draw() {
 
 
    stroke( random(frameCount), random(amp), random(amp), 10 ); 
    a = centerX + random(amp) * (180/TWO_PI);
    b = centerY + random(amp) * (180/TWO_PI);
 
    for( float t = 0; t <= 360; t += .1 ) {
 
        x = centerX - amp * sin(a * t * TWO_PI/180);
        y = centerY - amp * sin(b * t * TWO_PI/180);
 
        point( x, y );
        point( y, x );
 
    }
 
    if( frameCount % 60 == 0 )
    {
        amp *= .75;
    }
 
   if( frameCount > width*1.5 ) {
        textFont(createFont("Helvetica",11));
        fill(0);
        text("squared PT2", 3, height-5);
 
        noLoop();
    }
 
}
