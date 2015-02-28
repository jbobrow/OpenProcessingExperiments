
/*
*    how to build an icosahedron from 3 rects
*    http://en.wikipedia.org/wiki/Icosahedron
*
*    fjenett, 2009-05-30
*/

import controlP5.*;

ControlP5 cp5;

float phi;
float radius = 300, length;

PGraphics back;

float[][] vertices;
int[][] triangles;

float ry,rz;
boolean showNums = false, showGUI = false, showTris = true, showQuads = false;


void setup ()
{
    size( 500, 500, P3D );
    
    cp5 = new ControlP5( this );
    cp5.load( "interface.xml" );
    if ( !showGUI ) cp5.hide();
    
    back = createGraphics( width, height, P2D );
    
    // see:
    // http://en.wikipedia.org/wiki/Icosahedron#Cartesian_coordinates
    length = radius / 0.951056163;
    phi = (1 + sqrt(5)) / 2; // = 1.6180339887, golden ratio
    
    vertices = new float[][] {
         new float[] {  length/2, (-phi*length)/2, 0 }, //0
         new float[] { -length/2, (-phi*length)/2, 0 },
         new float[] { -length/2, ( phi*length)/2, 0 },
         new float[] {  length/2, ( phi*length)/2, 0 },
         
         new float[] { 0,  length/2, (-phi*length)/2 }, // 4
         new float[] { 0, -length/2, (-phi*length)/2 },
         new float[] { 0, -length/2, ( phi*length)/2 },
         new float[] { 0,  length/2, ( phi*length)/2 },
         
         new float[] { (-phi*length)/2, 0,  length/2 }, // 8
         new float[] { (-phi*length)/2, 0, -length/2 },
         new float[] { ( phi*length)/2, 0, -length/2 },
         new float[] { ( phi*length)/2, 0,  length/2 }
         
    };
    
    // these are indices into the vertices array
    triangles = new int[][]
    {
        new int[]{ 0, 1, 6 },
        new int[]{ 0, 6, 11 },
        new int[]{ 0, 11, 10 },
        new int[]{ 0, 10, 5 },
        new int[]{ 0, 5, 1 },
        
        new int[]{ 1, 8, 6 },
        new int[]{ 8, 6, 7 },
        new int[]{ 6, 7, 11 },
        new int[]{ 7, 11, 3 },
        new int[]{ 11, 3, 10 },
        new int[]{ 3, 10, 4 },
        new int[]{ 10, 4, 5 },
        new int[]{ 4, 5, 9 },
        new int[]{ 5, 9, 1 },
        new int[]{ 9, 1, 8 },
        
        new int[]{ 2, 8, 7 },
        new int[]{ 2, 7, 3 },
        new int[]{ 2, 3, 4 },
        new int[]{ 2, 4, 9 },
        new int[]{ 2, 9, 8 }
    };
    
    back.beginDraw();
    back.textFont( createFont( "Lucida Grande", 20 ) );
    back.fill( 0 );
    back.endDraw();
    
    strokeWeight( 1.5 );
}

void draw ()
{
    if ( showNums ) {
        background( back );
        back.beginDraw();
        back.background( 255 );
        back.translate( width/2, height/2 );
        back.scale( 0.45 );
        back.translate( -width/2, -height/2 );
    }
    else
        background( 255 );
    
    pushMatrix();
    
    translate( width/2, height/2, -500 );
    
    ry += 0.008;
    rz += 0.005;
    
    rotateY(ry);
    rotateZ(rz);
    
    noFill();
        
    if ( showQuads )
    {
        stroke( 0 );
        if ( showTris )
            stroke( 120 );
        fill( 255 );
        beginShape( QUADS );
        for ( int i = 0; i < vertices.length; i++ )
        {
            vertex(vertices[i][0], vertices[i][1], vertices[i][2]);
        }
        endShape();
    }
    
    
    if ( showTris )
    {
        stroke(0);
        fill( 255 );
        if ( showQuads )
            noFill();
        int t;
        float cx=0, cy=0, cz=0;
        for ( int i = 0; i < triangles.length; i++ )
        {
            beginShape( TRIANGLES );
            t = triangles[i][0];
            vertex(vertices[t][0], vertices[t][1], vertices[t][2]);
            cx = vertices[t][0];
            cy = vertices[t][1];
            cz = vertices[t][2];
            
            t = triangles[i][1];
            vertex(vertices[t][0], vertices[t][1], vertices[t][2]);
            cx += vertices[t][0];
            cy += vertices[t][1];
            cz += vertices[t][2];
            
            t = triangles[i][2];
            vertex(vertices[t][0], vertices[t][1], vertices[t][2]);
            cx += vertices[t][0];
            cy += vertices[t][1];
            cz += vertices[t][2];
            endShape();
        
            float[] sc = cartesian2spherical( cx/3, cy/3, cz/3 );
            float[] xyz = spherical2cartesian( sc[0], sc[1], radius );
            line( cx/3, cy/3, cz/3, xyz[0], xyz[1], xyz[2] );
        }
    }
    
    noStroke();
    fill(255,0,0);
    for ( int i = 0; i < vertices.length; i++ )
    {
        float x,y;
        pushMatrix();
    
        float[] sp = cartesian2spherical( vertices[i][0], vertices[i][1], vertices[i][2] );
        
        rotateZ( sp[1] );
        rotateY( sp[0] );
        
        translate( 0, 0, radius );
        fill( map(i,0,vertices.length-1,0,255), map(i-(i/4),0,3,0,255), map(i/4,0,(vertices.length-1)/4,255,0) );
        sphere(10);
        
        x = screenX(0, 0, radius);
        y = screenY(0, 0, radius);
    
        popMatrix();
        back.text( i, x, y );
    }
    
    back.endDraw();
    
    popMatrix();
    cp5.draw();
}


// as explained here:
// http://www.math.montana.edu/frankw/ccp/multiworld/multipleIVP/spherical/body.htm
float[] cartesian2spherical ( float x, float y, float z )
{
    float r = sqrt( x*x + y*y + z*z );
    float s = sqrt( x*x + y*y );
    
    double phi = Math.acos( z / r );
    double theta = Math.asin( y / s );
    if ( x < 0 ) theta = PI - theta;
    
    return new float[]{ (float)phi, (float)theta };
}

// again:
// http://www.math.montana.edu/frankw/ccp/multiworld/multipleIVP/spherical/body.htm
float[] spherical2cartesian ( float phi, float theta, float radius )
{
    return new float[]{ radius * sin(phi) * cos(theta), 
                        radius * sin(phi) * sin(theta),
                        radius * cos(phi) };
}

void showHideNums () { showNums = !showNums; }
void showHideTris () { showTris = !showTris; }
void showHideQuads () { showQuads = !showQuads; }

void keyPressed ()
{
    switch ( key ) {
        case 's':
            cp5.save( "interface.xml" );
        break;
        case 'h':
        case ' ':
            if ( showGUI ) cp5.hide();
            else cp5.show();
             showGUI = !showGUI;
        break;
    }   
}

