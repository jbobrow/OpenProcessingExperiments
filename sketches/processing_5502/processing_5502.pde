
/**
 *    a smiley thing that's hooked to the frameCount
 *
 *    fjenett 20091027
 */

    // setup is called once at startup
    void setup ()
    {
        size( 300, 300 );        // size of the drawing area
        
        frameRate( 24 );        // set the speed, frames per second
    }
    
    
    // draw is being called again and again allowing for your code to
    // be dynamic and interactive
    void draw () 
    {
        background(255);        // clear the drawing area with white
    
        float r = 40 + ( sin(frameCount) * 20 );  // calculate r to be a float value between 20.0 and 60.0
        // frameCount is the internal counter that holds how often draw() was called
        // sin() will return a value between -1.0 and 1.0 depending on the value passed to it
    
        // the drawing below is based on the variable "r" allowing it become dynamic
    
        ellipse( width/2, height/2, 2*r, 2*r ); // "width" and "height" hold the size of the drawing area
    
        ellipse( width/2-r/2, height/2-r/2, r/2, r/2 );
        ellipse( width/2+r/2, height/2-r/2, r/2, r/2 );
    
        rect( width/2-r/2, height/2, r, r/2 );
    }


