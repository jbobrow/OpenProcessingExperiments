
/*
    by Charles Carr
    Any size Polygons!!
*/

int WIDTH = 600;
int HEIGHT = 600;

// The number of sides. This will increase over time.
int x = 1;

void setup()
{
    size(600,600);
    frameRate(8);
    textAlign(CENTER,CENTER);
}

void draw()
{
    background(0);
    stroke(255);
    
    // Increase the number of sides.
    x++;
    
    // Draw the polygon in the middle fo the screen with x sides and 500 diameter.
    polygon(WIDTH/2,HEIGHT/2,x,500);
    
    // Text to display.
    text("This is a Polygon with "+x+" sides.",WIDTH/2,HEIGHT/2);
    text("This is just an example of a function that can draw",WIDTH/2,(HEIGHT/2)+30);
    text("and size polygon. Eventually it'll look like a circle! ^_^",WIDTH/2,(HEIGHT/2)+45);
    text("Press Numbers 1-9 to start over. The number you press",WIDTH/2,(HEIGHT/2)+75);
    text("multiplied by 3 will be the new frame rate. :)",WIDTH/2,(HEIGHT/2)+90);
}

// The big stinky nasty function of doom and despair.
void polygon(float tx, float ty, int n, float d)
{
    // I'm using pushMatrix so that I can make the center the origin for easy trig.
    pushMatrix();
    translate(tx,ty); // changes the origin
    float r = d/2; // radius is half the diameter. Duh.
    noFill(); // Don't be fillin my shiz. I need text there. GOSH
    //ellipse(0,0,d,d); // Uncomment this to see the polygon inscribed in a circle.
    float[] x = new float[n]; // this line has something to do with llamas.
    float[] y = new float[n]; // just kidding. It's a float array. Duh.
    
    // The first point will be 0,-r. On the unit circle, -r is -1. In this case, it's -250.
    // Keep in mind this is slightly different than a unit circle in that this is actually
    // an upside down unit circle. You can thank processing for that one.
    x[0] = 0;
    y[0] = -r;
    
    // This is the magic formula that finds the angle between each side depending
    // on variable n (the number of sides). Take my word for it.
    float theta = (PI/2)-(TWO_PI/n);
    
    // This loop uses that angle to find each other point on the polygon.
    for (int i = 1; i < n; i++)
    {
        x[i] = r*cos(theta);
        y[i] = -r*sin(theta);
        line(x[i-1],y[i-1],x[i],y[i]);
        ellipse(x[i],y[i],4,4);
        theta = theta - (TWO_PI/n);
    }
    
    
    line(x[x.length-1],y[y.length-1],x[0],y[0]);
    //ellipse(x[0],y[0],10,10);
    popMatrix();
}

void keyPressed()
{
    if (key == '1' || key == '2' || key == '3' || key == '4' || key == '5'
        || key == '6' || key == '7' || key == '8' || key == '9')
    {
        x = 1;
        frameRate((int(key)-48)*3);
    }
}

