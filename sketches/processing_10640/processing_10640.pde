
PShape kopf;
PShape koerper; 
PShape arm_r;
PShape arm_l;
PShape bein_l;
PShape bein_r;

   void setup ()
   {
   size(500,500);
 
   background(255);
   smooth();
   }
    
   void draw()
   {
   
   scale(2);
   shape( loadShape( "koerper.svg" ), -45,20 );
   shape( loadShape( "kopf.svg" ), -160, -130 );
   shape( loadShape( "arm_r.svg" ), -120, -77 );
   shape( loadShape( "arm_l.svg" ), -143, -80 );
   shape( loadShape( "bein_r.svg" ), -92, -20 );
   shape( loadShape( "bein_l.svg" ), -135, -20 );
   
   
 }

