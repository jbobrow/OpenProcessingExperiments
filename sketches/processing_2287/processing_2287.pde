


import geomerative.*;


RShape Viech;
float m,n;

void setup ()
{
    size(500,350);  
    
    RG.init( this);
    
    smooth();
}


void draw()
{
     PImage Pap = loadImage( "PackpapierQuer1.png" );
     
     image( Pap, 0,0, 500,350 );        //background pic
     

     
     translate(50, 250);
     

     fill(30, 170);

     
     
     RG.beginShape();                //draw body
     
       RG.vertex( 106.7, -17.9 );
       RG.bezierVertex( 80.0,-30,  80.0,-60.0, 85.7,-75.3 );         //lower butt
       RG.bezierVertex( 95,-105,  140,-106.1, 150.1,-106.1 );        //upper butt
       RG.bezierVertex( 160,-106.1,  175.5,-109, 181.5,-111.6 );     //lower neck       
       RG.bezierVertex( 183,-111.6,  207.4,-124.9, 207.4,-124.9 );   //upper neck
       RG.bezierVertex( 231,-140,  249,-126, 250.9,-120.7 );         //upper head
       RG.bezierVertex( 265,-80,  217,-80, 218.4,-67.6 );            //lower head
       RG.bezierVertex( 218.4,-55,  236.8,-45, 236.8,-29.8 );        //front foot
       RG.bezierVertex( 235,-10,  191.3,-24.9, 191.3,-24.9 );        //base front foot
       RG.bezierVertex( 180,-28,  170,-30, 165.4,-28.4 );            //tummy front
       RG.bezierVertex( 155,-30,  145,-19.3, 138.2,-19.3 );          //tummy back
       RG.bezierVertex( 138.2,-15,  106.7,-15,  106.7,-17.9 );       //base rear foot  
     
     RG.breakShape( RG.CLOSE );

       
       
       Auge();
     
     Viech = RG.getShape( );
     RG.shape( Viech );
     
     
     stroke(0,100);            //hair
       
         int steps = 30;
         for (int i = 0; i <= steps; i++) {
            float t = i / float(steps);
            float x = bezierPoint(106.7, 80.0, 80.0, 85.7, t);
            float y = bezierPoint(-17.9, -30, -60.0, -75.3, t);
            float tx = bezierTangent(106.7, 80.0, 80.0, 85.7, t);
            float ty = bezierTangent(-17.9, -30, -60.0, -75.3, t);
            float a = atan2(ty, tx);
            a -= HALF_PI+QUARTER_PI;
            line(x, y, cos(a)*random(20,35) + x, sin(a)*random(5,15) + y);
         }
         
         int steps1 = 25;
         for (int i = 0; i <= steps1; i++) {
            float t = i / float(steps1);
            float x = bezierPoint(85.7, 95, 140, 150.1, t);
            float y = bezierPoint(-75.3, -105, -106.1, -106.1, t);
            float tx = bezierTangent(85.7, 95, 140, 150.1, t);
            float ty = bezierTangent(-75.3, -105, -106.1, -106.1, t);
            float a = atan2(ty/2, tx/3);
            a -= HALF_PI+QUARTER_PI;
            line(x, y, cos(a)*random(20,40) + x, sin(a)*random(10,20) + y);
         }
         
         int steps2 = 10;
         for (int i = 0; i <= steps2; i++) {
            float t = i / float(steps2);
            float x = bezierPoint(150.1, 160, 175.5, 181.5, t);
            float y = bezierPoint(-106.1, -106.1, -109, -111.6, t);
            float tx = bezierTangent(150.1, 160, 175.5, 181.5, t);
            float ty = bezierTangent(-106.1, -106.1, -109, -111.6, t);
            float a = atan2(ty, tx);
            a -= HALF_PI+QUARTER_PI;
            line(x, y, cos(a)*random(10,20) + x, sin(a)*random(10,20) + y);
         }
         for (int i = 0; i <= steps2; i++) {
            float t = i / float(steps2);
            float x = bezierPoint(181.5, 183, 207.4, 207.4, t);
            float y = bezierPoint(-111.6, -111.6, -124.9, -124.9, t);
            float tx = bezierTangent(181.5, 183, 207.4, 207.4, t);
            float ty = bezierTangent(-111.6, -111.6, -124.9, -124.9, t);
            float a = atan2(ty, tx*4);
            a -= HALF_PI+QUARTER_PI;
            line(x, y, cos(a)*random(10) + x, sin(a)*random(10) + y);
         }
         
       
       m = map(mouseX, 0, width, -3,3);
       n = map(mouseY, 0, height, -3,3);
       
       fill(255, 150);
       
       RShape Pupille = RG.getEllipse( 230+m,-100+n , 7 );
       
     RG.shape( Pupille );
     
     
}


void Auge()
{
      float a, d;
      d = 7 ;
        for ( int r = 360; r >= 0; r-- )
        {
            a = radians( r );
            RG.vertex( 230 + cos(a) * d , -100 + sin(a) * d );
        }
}


