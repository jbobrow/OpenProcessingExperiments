
// Don Gochenour
// don@topenga.org
// 05/08/09

/*
 * HISTORY
 *
 *rev  date      by   discription
 *---  ----      --   ----------- 
 *0.0  05/08/09  dlg  created    
 *0.1  06/18/09  dlg  removed audio for now... too heavy for the Web
 */

// libraries

// global variables

int aspectX = 16;
int aspectY = 9;
int aspectMultiplier = 60;

float x = 0.0;
float y = 0.0;
float angle = 0.0;
float speed = 0.8;
boolean down = true;

// functions

void setup()
{

    size(aspectX*aspectMultiplier,aspectY*aspectMultiplier);
    colorMode(HSB);
    background(0);
    smooth();
    fill(0);
    stroke(random(0,360),255,255,150);
    x = random(0, width);
    
}
 
    
void draw()
{


    angle += random(-0.5, 0.5);
    
    // if we get to the bottom of the window, reverse direction
    if (y > height) {
        down = false;
    }
    // start a new run once we bounce back up to the top
    if (y < 0) {
        down = true;
        y = 0.0;
        x = random(0, width);
        stroke(random(0,360),100,100,150);
    }
    
    if (down) {
        // if we're going down, do this
        x += cos(angle) * speed;
        y += speed;
    } else {
        // if we're going up, do this
        x -= tan(angle) * speed;
        y -= speed;
    }
    
    translate(x, y);
    rotate(angle);
    //line(0, random(-300,-10), 0, 0);  
    triangle(0, random(-300,-10), 0, 0, random(5, 30), random(-300, -50));
}
 
void stop()
{
    super.stop();
}


