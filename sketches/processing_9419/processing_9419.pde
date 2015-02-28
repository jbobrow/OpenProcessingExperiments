
/**
 * Pulsing RGB Donuts on a 3D Plane. Left-drag to rotate, right-drag or mouse wheel to zoom.<br>
 * Grid code ported from Mathnimatics 'Welcome' canvas demo: http://www.tamats.com/canvas/index.html <br>
 * Uses PeasyCam lib: http://mrfeinberg.com/peasycam/ <br>
 * by Felix Turner: http://www.airtightinteractive.com <br>
 */
 
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

int BLOCK_COUNT_HORIZ = 100;
int BLOCK_COUNT_VERT = 50;
int BLOCK_SIZE = 10;
float PULSE_SPEED = 0.003;

int planeWidth;
int planeHeight;
float aspect;
float x,y,v,t;

PeasyCam cam;

void setup() {

    size(920, 450,P3D);    
    frameRate(60); 
    colorMode(RGB, 1);
    rectMode(CORNER);
    noStroke();
    noSmooth();

    cam = new PeasyCam(this,500);    

    planeWidth = BLOCK_COUNT_HORIZ * BLOCK_SIZE;
    planeHeight = BLOCK_COUNT_VERT * BLOCK_SIZE;    
    aspect = float(planeHeight) / float(planeWidth);

}

void draw()
{
    background(0);
    t = millis() * PULSE_SPEED;
    translate(-planeWidth/2,-planeHeight/2);
   
    //draw each block
    for (int i = 0; i < planeWidth; i += BLOCK_SIZE)
    {
        for (int j = 0; j < planeHeight; j += BLOCK_SIZE)
        {
            //calculate color
            x = (i + BLOCK_SIZE*0.5)/planeWidth;
            y = (j + BLOCK_SIZE*0.5)/planeHeight;
            v = sqrt(pow(2*(x-0.5),2) + pow(aspect*2*(y-0.5),2));
            v=sin(v*4-t);
            fill(1-v,0.5-v,v*v);
            
            rect(i,j,BLOCK_SIZE,BLOCK_SIZE);
        }
    }
}


