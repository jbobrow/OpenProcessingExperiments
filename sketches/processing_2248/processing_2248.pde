
import geomerative.*;   
PImage halle;

RShape vogel;


void setup ()
{
    size( 700, 500 );
    halle = loadImage( "halle.jpg" );
 
    RG.init( this );   
    
    smooth(); 
}


void draw ()
{   
    translate (0,495);
    image( halle, 0, 0, 700, -500 );
    
    
    if (mousePressed == true) {
    
 
  
    
    
    
    fill (#FFFFFF, 90);
    
    stroke (#000000, random (100, 200));
    strokeWeight (2);
    
    float g;
    g = random (3, 6);

    RG.beginShape();
    RG.vertex (44.9+g, -146.3);
    RG.vertex (44.9+g, -200.3);
    RG.bezierVertex (44.9+g, -200.3, 53.5+g, -218.3, 62.5+g, -225.3);
    RG.bezierVertex (71.6+g, -232.3, 86.7+g, -251.5, 81.4+g, -267.5);
    RG.bezierVertex (76.1+g, -283.5, 66.6+g, -295.3, 60.5+g, -299.4);
    RG.vertex (27.7+g, -319.5);
    RG.vertex (57.2+g, -323.6);
    RG.vertex (82.6+g, -337.9);      
    RG.bezierVertex (91.2+g, -347.8, 105.5+g, -362.9, 120.7+g, -361.7);    
    RG.bezierVertex (135.8+g, -360.4, 155.9+g, -350.2, 158+g, -333.4);
    RG.bezierVertex (160+g, -316.6, 159.6+g, -302.7, 162.5+g, -294.1);
    RG.bezierVertex (165.3+g, -285.5, 175.2+g, -258.5, 194.4+g, -244.6);
    RG.bezierVertex (213.7+g, -230.6, 249.7+g, -217.9, 273.4+g, -215.4);
    RG.bezierVertex (273.4+g, -215.5, 309.9+g, -209.7, 323+g, -216.3);
    RG.bezierVertex (336.1+g, -222.9, 352.9+g, -239.2, 363.9+g, -251.1);
    RG.bezierVertex (375+g, -263, 412.3+g, -308.4, 412.3+g, -308.4);
    RG.bezierVertex (412.3+g, -308.4, 452.8+g, -344.5, 473.7+g, -352.7);
    RG.vertex (506+g, -366.2);
    RG.vertex (497.4+g, -330.6);
    RG.bezierVertex (497.4+g, -330.6, 484.8+g, -298.2, 475.7+g, -284.3);
    RG.bezierVertex (466.7+g, -270.4, 459.4+g, -259.7, 459.4+g, -259.7 );
    RG.vertex (505.2+g, -289.2);
    RG.bezierVertex (505.2+g, -289.2, 539.6+g, -304.8, 558.1+g, -309.3);
    RG.vertex (588.4+g, -317);
    RG.vertex (574.8+g, -281);
    RG.bezierVertex (574.8+g, -281, 552.3+g, -241.3, 545+g, -231);
    RG.vertex (529.8+g, -211.4);
    RG.vertex (579.8+g, -230.6);
    RG.bezierVertex (579.8+g, -230.6, 610.1+g, -242.3, 651.8+g, -247.8);
    RG.vertex (669.4+g, -249.5);
    RG.bezierVertex (669.4+g, -249.5, 663.3+g, -216.3, 658+g, -202.4);
    RG.bezierVertex (652.7+g, -188.5, 628.9+g, -156.5, 628.9+g, -156.5);
    RG.vertex (97.1+g, -160.6);
    RG.vertex (93+g, -146.4);
    RG.vertex (44.9+g, -146.3);
    RG.breakShape( RG.CLOSE );
    
    // großes auge
    
    RG.vertex (100.8, -320);
    RG.bezierVertex (100.8, -320, 100.4, -300.1, 120.6, -300.1);
    RG.bezierVertex (140.8, -300.1, 140.8, -320.3, 140.8, -320.3);
    RG.bezierVertex (140.8, -320.3, 139.8, -339.5, 120.6, -339.5);
    RG.bezierVertex (101.5, -339.5, 100.8, -320, 100.8, -320); 
    RG.breakShape( RG.CLOSE );
    
    // kleines auge

    RG.vertex ( 114.5, -319.7 );
    RG.bezierVertex ( 114.5, -319.7, 114.4, -313.4, 120.7, -313.4 );
    RG.bezierVertex ( 127.1, -313.4, 127.1, -319.8, 127.1, -319.8 );
    RG.bezierVertex ( 127.1, -319.8, 126.8, -325.8, 120.7, -325.8 );
    RG.bezierVertex ( 114.7, -325.8, 114.5, -319.7, 114.5, -319.7 );
    RG.breakShape( RG.CLOSE );
    
    
    //wimper 1
    
    
    RG.vertex ( 109.4, -336.5 );
    RG.vertex ( 82.3, -375.7 );
    
    float xx, yy;
    int off = frameCount % 55;
    
    for ( int i = 0; i < 55; i++ )
        {
            off = (i + frameCount) % 55;
            xx = map( i, 0, 55, 180, 82.3 );
            yy = -375.7 + sin( map( off, 0,54, 0, TWO_PI * (55/40) ) ) * 12;
            RG.vertex(xx , yy );
            
        }
        
    RG.breakShape(RG.CLOSE );
    
    
    //wimper 2
    
    
    RG.vertex ( 115.9, -389.8 );   
    RG.vertex ( 118.4, -339.5 );
    
    float xx2, yy2;
    int off2 = frameCount % 55;
    
    for ( int i = 0; i < 55; i++ )
        {
            off = (i + frameCount) % 55;
            xx2 = map( i, 0, 55, 230, 82.3 );
            yy2 = -375.7 + sin( map( off2, 0,54, 0, TWO_PI * (55/40) ) ) * 12;
            RG.vertex(xx2 , yy2 );
            
        }
    
    RG.breakShape( RG.CLOSE );
    
    
    //wimper 3
    
    
    RG.vertex ( 128.3, -338.2 );
    RG.vertex ( 148.9, -383.2 );
    
    float xx3, yy3;
    int off3 = frameCount % 55;
    
    for ( int i = 0; i < 55; i++ )
        {
            off = (i + frameCount) % 55;
            xx3 = map( i, 0, 55, 280, 82.3 );
            yy3 = -375.7 + sin( map( off3, 0,54, 0, TWO_PI * (55/40) ) ) * 12;
            RG.vertex(xx3 , yy3 );
            
        }
    
    RG.breakShape( RG.CLOSE );
    
    //wimper 4
    
    RG.vertex ( 177.4, -363.8 );
    RG.vertex ( 136.3, -332.4 );
    
    float xx4, yy4;
    int off4 = frameCount % 55;
    
    for ( int i = 0; i < 55; i++ )
        {
            off = (i + frameCount) % 55;
            xx4 = map( i, 0, 55, 330, 82.3 );
            yy4 = -375.7 + sin( map( off4, 0,54, 0, TWO_PI * (55/40) ) ) * 12;
            RG.vertex(xx4 , yy4 );
            
        }
    
    RG.breakShape( RG.CLOSE );
    
    //fluegel1
    
    RG.vertex ( 506+g, -366.2);
    RG.vertex ( 497.4+g, -330.6 );
    RG.vertex ( 474+g, -328.5 );
    RG.vertex ( 473.7+g, -352.7 );
    
     
    RG.breakShape( RG.CLOSE );
    
    
       

    // all done, let's grab the ghost shape
    vogel = RG.getShape( );
    
    RG.setPolygonizer( RG.UNIFORMLENGTH ); // set the polygonizer: this creates segments with equal lenghts
    
    
    vogel = RG.polygonize( vogel );  // turn smooth curves into segments / lines
    

    RG.shape( vogel ); // draw ghost shape
    
    
     } else {
    image( halle, 0, 0, 700, -500 );
  }
}

