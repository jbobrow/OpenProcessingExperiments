
int rotation;
boolean clearCanvas = true;

int speed = 2;
int numOfRects = 8;

int radius = 10;
int rectWidth = 16;
int rectHeight = 16;

float r = 0, b = 0, g = 0;

int lx = 0;
int ly = 0;

void setup() {
    size( 900 , 450 );
    background( 0 );
    frameRate( 24 );
    smooth();
    noStroke();
}

void draw() {  //draw function loops 
    int i = 0;
    int tx = 0;
    int ty = 0;
    
    if ( clearCanvas ) {
        fill( 0 , 0 , 0 , 50 );
        rect( 0 , 0 , screenWidth , screenHeight );
    }
    
    tx = mouseX <= 0 ? screenWidth / 2 : mouseX;
    ty = mouseY <= 0 ? screenHeight / 2 : mouseY;
    
    // Tranlate the world to the center.
    translate( tx , ty );

    // rotate the entire world.
    rotate( rotation * PI / 180 );
    
    for (i = 0; i < numOfRects; i += 1) {
        
        r += HALF_PI / 60;
        g += HALF_PI / 50;
        b += HALF_PI / 40;
        
        fill( 120 + sin( HALF_PI * r ) * 130, 
              110 + sin( THIRD_PI * g ) * 140, 
              100 + sin( QUARTER_PI * b ) * 150, 
              180 );

        rotation += speed;

        rotate( ( i + 360 / numOfRects ) * PI/ 180 );

        rect( radius , 0 , rectWidth , rectHeight );
    }
    
    lx = tx;
    ly = ty;
}

void mouseReleased() {
    clearCanvas = !clearCanvas;
}
                                                                                                                
