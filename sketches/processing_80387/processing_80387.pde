
//http://www.openprocessing.org/sketch/51775

/* @pjs preload="happy.jpg"; */

PImage img;

void setup() {
    size( 600, 400 );
    smooth();
    img= loadImage("happy.jpg");
    image(img,0,0);
}
 
void draw() {
     
    background( img ); //resents background color to image
    int rbound = 200; //default
     
    fill( 255, 246, 64); //yellow
    stroke( 255, 246, 64); //yellow
    strokeWeight( 3 );
    int twinkle = 80; //distance change in ray length
    //float radius=200; //radius of rays
    float radius;
    int numPoints=100; //number of rays
    float angle=TWO_PI/(float)numPoints;
     
    //create rays
    for(int i=0;i<numPoints;i++)
    {
        radius = rbound - (int)random( 0, twinkle );
        line(100,100,radius/2*sin(angle*i)+100,radius/2*cos(angle*i)+100);
    }
    
    
    //third (the grass from right to left)
    
    stroke( 165, 200, 4); //green
    strokeWeight( 2 );
    
        //create rays
    for(int i=0;i<numPoints;i++)
    {
        radius = rbound - (int)random( 0, twinkle );
        line(500,550,radius/2*sin(angle*i)+600,radius/2*cos(angle*i)+430);
    }
    
    stroke( 135, 200, 4); //green
    strokeWeight( 2 );
    
     //create rays
    for(int i=0;i<numPoints;i++)
    {
        radius = rbound - (int)random( 0, twinkle );
        line(400,550,radius/2*sin(angle*i)+500,radius/2*cos(angle*i)+430);
    }
    
     for(int i=0;i<numPoints;i++)
    {
        radius = rbound - (int)random( 0, twinkle );
        line(300,550,radius/2*sin(angle*i)+400,radius/2*cos(angle*i)+430);
    }
    
    stroke( 165, 200, 4); //green
    strokeWeight( 2 );
    
         //create rays
    for(int i=0;i<numPoints;i++)
    {
        radius = rbound - (int)random( 0, twinkle );
        line(200,550,radius/2*sin(angle*i)+300,radius/2*cos(angle*i)+430);
    }
    
    //create rays
    for(int i=0;i<numPoints;i++)
    {
        radius = rbound - (int)random( 0, twinkle );
        line(100,550,radius/2*sin(angle*i)+200,radius/2*cos(angle*i)+430);
    }
    
    stroke( 195, 200, 4); //green
    strokeWeight( 3 );
    
        //create rays
    for(int i=0;i<numPoints;i++)
    {
        radius = rbound - (int)random( 0, twinkle );
        line(10,550,radius/2*sin(angle*i)+20,radius/2*cos(angle*i)+430);
    }
    
            //create rays
    for(int i=0;i<numPoints;i++)
    {
        radius = rbound - (int)random( 0, twinkle );
        line(50,550,radius/2*sin(angle*i)+100,radius/2*cos(angle*i)+430);
    }
  
 
}

