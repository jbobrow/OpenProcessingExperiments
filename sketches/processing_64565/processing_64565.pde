
//  Buffer class, takes each particle, and draws it to a buffer, that we can post process on,
//  and then display the result to the screen.

class BackBuffer
{
   private PGraphics canvas;   
   
   //  Particle Manager
   ParticleManager pManager;
   
   private float    trailLength;
      
   BackBuffer()
   {
      canvas       = createGraphics( width , height , P2D );            
      pManager     = new ParticleManager( canvas );
      trailLength  = 90;
   }

   
   
   //  Runs the buffer, and all of the particles in it
   public void Update()
   {
     //  Write the particles to the buffer
     canvas.beginDraw();
     canvas.fill( 0 , trailLength );
     canvas.rect( 0 , 0 , width , height );
     canvas.noFill();
     //  Updates Particles - this has a reference through to the canvas
     pManager.Update();
     
     canvas.endDraw();
     
     //  This is the actual element that draws to the screen
     image( canvas , 0 , 0 );
   }
   
   //  Sets the length of the trails
   public void SetTrailLength( float _value )
   {
     //  Reduce the strength of the input
      trailLength = trailLength + ( -_value * 0.00001 );
  
      // Ensure speed is never too high or too low
      if( trailLength > 150  )   trailLength = 150;
      if( trailLength < 70  )   trailLength  = 70;  
   }
   
   
   public float GetTrailLength()
  {
    //  flip values so that the larger value
    //  is equal to a larger trail
    float tempTrail = 220 - trailLength;
    return tempTrail;
  } 
   
}

