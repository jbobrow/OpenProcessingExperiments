

int bound = 200; //default

void setup() {
    size( 600, 600 );
    smooth();
}

void draw() {
    
    background( 51 ); //resents background color to dark gray

    int slider = 600;

    fill( 100 ); //gray
    stroke( 100 ); //gray
    rect( 0, 0, 600, 30 ); //bar
    
    fill( 150 ); //light gray
    stroke( 150 ); //light gray
    
    if( mouseY < 30 && mousePressed ) { 
        bound = mouseX/3;
        slider = mouseX;
        ellipse( slider, 15, 20, 20 ); //slider
    }
    
    ellipse( bound*3, 15, 20, 20 ); //slider
    
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
        radius = bound - (int)random( 0, twinkle );
        line(300,300,radius*sin(angle*i)+300,radius*cos(angle*i)+300);
    } 
    
    //ellipse( 300, 300, 200, 200 ); //sun

    //face
    stroke( 51 ); //dark gray
    strokeWeight( 4 );
    
    arc( 250+(50-bound*0.25), 300, bound*0.2, bound*0.15, PI, TWO_PI ); //left eye
    //arc( 250, 300, 40, 30, PI, TWO_PI );
    

    arc( 350-(50-bound*0.25), 300, bound*0.2, bound*0.15, PI, TWO_PI );
    //arc( 350, 300, 40, 30, PI, TWO_PI ); //right eye
    
    
    arc( 300, 335-(35-bound*0.175), 0.5*bound, 0.35*bound, PI/6, 5*PI/6 ); //mouth
    //arc( 300, 335, 100, 70, PI/6, 5*PI/6 ); //mouth


    
}


