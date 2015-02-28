
//read p 213 in your book for more information
// a polar coordinate
float r = 125; // radius value
float theta = 0;
void setup () {
size (400, 400);
background (255);
smooth();
}
void draw () {
// polar to cartesian conversion
noStroke ();
fill (255, 20);
rect (0, 0, width, height);
float x = r*cos(theta); //add random values to jitter
float y = r* sin (theta); //add random values to jitter
//draw an ellipse at x, y
noStroke ();
int s = second(); // call the second value
stroke(map (s, 0, 70, 0, 255), 120, 240-map(s, 0, 59, 0, 240)); // map the second value change color over time
noFill();
strokeWeight (1);

    bezier(0,0,x,y,x,y,width,0);
    bezier(0,height,x,y,x,y,width,height);
    bezier(0,height/2,x,y,x,y,width,height/2);
    bezier(width/2,0,x,y,x,y,width/2,height);
    bezier(0,height,x,y,x,y,0,0);
    bezier(width,0,x,y,x,y,width,height);



//increment the angle
theta += 2; //increase this value to go faster

bezier(0,0,x,y,x,y,width,0);
    bezier(0,height,x,y,x,y,width,height);
    bezier(0,height/2,x,y,x,y,width,height/2);
    bezier(width/2,0,x,y,x,y,width/2,height);
    bezier(0,height,x,y,x,y,0,0);
    bezier(width,0,x,y,x,y,width,height);
    
    theta += .5;
}

