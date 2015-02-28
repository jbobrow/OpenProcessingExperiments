
class Particle 
{

    // member variables
    PVector pos;    // pos.x pos.y pos.z
    PVector vel;    // vel.x vel.y vel.z
    PVector acc;    // acc.x acc.y acc.z
    
    Particle( float x, float y, float z )
    {
        // instantiate the vectors so we don't get null pointer exceptions
        pos = new PVector(x, y, z);   // set the position based on parameters 
        vel = new PVector();
        acc = new PVector();
    }
    
    void update()
    {
        pos.add( vel );               // add velocity to positon gives the illusion of moving particles)
        
        if ( pos.x-25 < 0 || pos.x+25 > width )
        {
            vel.x *= -1.0f;
        }
        
        if ( pos.y-25 < 0 || pos.y+25 > height )
        {
            vel.y *= -1.0f;
        }
    }
    
    void draw()
    {
        ellipse( pos.x, pos.y, 50, 50 );
        //noStroke(); sam says it makes the partilce move quicker with a stroke
        fill(10);    // draw the particle black
    }
}

