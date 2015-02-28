
/* built with Studio Sketchpad: 
 *   http://sketchpad.cc
 * 
 * observe the evolution of this sketch: 
 *   http://studio.sketchpad.cc/sp/pad/view/ro.I$zaCazzfSD/rev.1635
 * 
 * authors: 
 *   Graham Jans
 
 * license (unless otherwise specified): 
 *   creative commons attribution-share alike 3.0 license.
 *   http://creativecommons.org/licenses/by-sa/3.0/ 
 */
 
 
 
// Pressing Control-R will render this sketch.
 
int rows = 20;
int cols = 20;
float spacing = 1.0;
 
toy[] toys;
 
float lastTime = 0;
 
void setup() 
{
    size(500, 500, OPENGL);
     
    // limit the number of frames per second
    frameRate(30);
     
    int total = (rows+1)*(cols+1);
    toys = new toy[total];
     
    for( int j = 0; j <= rows; j++ )
    {
        for ( int i = 0; i <= cols; i++ )
        {
            toys[(j*(rows+1))+i] = new toy( (height/rows)*j,
                                            (width/cols)*i, 
                                            (width/cols)*spacing );
        }
    }
     
} 

void draw()
{
    float dist = width;
     
    camera(width/2.0, height/2.0, dist,
           width/2.0, height/2.0, 0,
           0, 1, 0);
             
    perspective(45, 1, dist-100, dist+100);
     
    background(200);
     
    lights();
 
    // box(x, y, z);
 
    noStroke();
    fill(100);
     
 
        float delta = millis() - lastTime;
        lastTime = millis();
    for ( int i = 0; i < toys.length; i++ )
    {
         
        toys[i].update(delta);
        toys[i].draw();
    }
}
 
void mouseMoved()
{
    for ( int i = 0; i < toys.length; i++ )
    {
        toy t = toys[i];
        if ( abs(t.x - mouseX) < 50 &&
             abs(t.y - mouseY) < 50 )
        {
            t.back = true;
        }
    }
}
 
 
class toy
{
    float x;
    float y;
    float s;
     
    color c;
    color c2;
     
    float rot;
    float maxRot;
     
    bool back = false;
     
    toy(float x, float y, float s)
    {
        this.x = x;
        this.y = y;
        this.s = s;
         
        this.c = color(random()*100+150,random()*50,random()*50);
        this.c2 = color(random()*100+150,random()*100+150 ,random()*100+150);
         
        this.maxRot = HALF_PI;
    }
     
    void draw()
    {
        pushMatrix();
        translate( x, y, 0 );
        rotateX(rot);
         
        color col = lerpColor(c2, c, abs((rot/maxRot)*2-1) );
         
        fill(col);
        box(s, s, s);
        popMatrix();
    }
     
    void update(float delta)
    {
        float time = delta * 0.001;
         
        if ( random() < 0.02 )
            back = false;
             
        if ( back && rot < maxRot )
        {
            rot += time;
            if ( rot > maxRot )
                rot = maxRot;
        }
         
        if ( !back && rot > 0.0 )
        {
            rot -= time;
            if ( rot < 0.0 )
                rot = 0.0;
        }
    }
    
}
