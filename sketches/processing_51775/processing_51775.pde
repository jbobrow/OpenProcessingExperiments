

void setup() {
    size( 600, 600 );
    smooth();
}

void draw() {
    
    background( 51 ); //resents background color to dark gray
    int rbound = 200; //default
    
    fill( 255, 246, 64 ); //yellow
    stroke( 255, 246, 64 ); //yellow
    strokeWeight( 5 );
    int twinkle = 80; //distance change in ray length
    //float radius=200; //radius of rays
    float radius;
    int numPoints=130; //number of rays
    float angle=TWO_PI/(float)numPoints;
    
    //create rays
    for(int i=0;i<numPoints;i++)
    {
        radius = rbound - (int)random( 0, twinkle );
        line(300,300,radius*sin(angle*i)+300,radius*cos(angle*i)+300);
    } 
    
    //ellipse( 300, 300, 200, 200 ); //sun

    //face
    stroke( 51 ); //dark gray
    strokeWeight( 4 );
    
    if( mousePressed && mouseX < 300 ) {
        line( 230, 300, 270, 300 );
    } else {
        arc( 250, 300, 40, 30, PI, TWO_PI ); //left eye
    }
    
    if( mousePressed && mouseX > 300 ) {
        line( 330, 300, 370, 300 ); //right eye winking
    } else {
        arc( 350, 300, 40, 30, PI, TWO_PI ); //right eye
    }
    
    arc( 300, 335, 100, 70, PI/6, 5*PI/6 ); //mouth

}


