
/**
 *    SVGs laden mit PShape
 *
 *    http://processing.org/reference/loadShape_.html
 *    http://processing.org/reference/shape_.html
 *
 *    http://en.wikipedia.org/wiki/Scalable_Vector_Graphics
 *
 *    fjenett 20081101
 */
    PShape kopf;
    PShape rumpf;
    PShape armlinks;
    PShape armrechts;
    PShape beinlinks;
    PShape beinrechts;
    
    void setup ()
    {
    size(500,500);

    background(255); 
    smooth();
    }
    
    void draw()
    {
    translate(-300,-400);
    scale(2);
    shape( loadShape( "armlinks.svg" ), -40, 70 );
    shape( loadShape( "armrechts.svg" ), 50, 70 );
    shape( loadShape( "beinlinks.svg" ), -10, 120 );
    shape( loadShape( "beinrechts.svg" ), 30, 130 );
    shape( loadShape( "rumpf.svg" ), 0, 70 );
    shape( loadShape( "kopf.svg" ), 0, 0 );
   
    

    }

