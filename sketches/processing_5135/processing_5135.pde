
// kieran's triangle program

int triSize=20; float triRand;
float xoff; float yoff;
float spread = 80;
float randAng;
float r; float g; float b;
int col;

void setup() {
    size(800, 400, JAVA2D);
    background(0, 0, 0);
    smooth();
    strokeWeight(2);
    fill(0, 0, 0);
    stroke(0, 0, 0);
}

void draw() {
}

void mouseDragged() {
    randAng = radians(random(360)); // generate a random angle for the orientation of the triangle
    
    // generate some nice bright colours for the triangles
    col = floor(random(6));
    switch(col) { 
        case 0:
            r = 255; g = 0; b = random(255);
            break;
        case 1:
            r = 255; g = random(255); b = 0;
            break;
        case 2:
            r = 0; g = random(255); b = 255;
            break;
        case 3:
            r = 0; g = 255; b = random(255);
            break;
        case 4:
            r = random(255); g = 255; b = 0;
            break;
        case 5:
            r = random(255); g = 0; b = 255;
            break;
    }
      
    
    fill (r, g, b);
    
    xoff = random(-spread, spread); yoff = random(-spread, spread); // generate a random offset from the mouse pointer for drawing the triangle
    triRand = random(triSize) + triSize*2; // generate a random size for the triangle

    // draw the actual triangles!!!
    triangle(  xoff + mouseX + (sin(randAng)*triRand),                                 yoff + mouseY - triRand + (cos(randAng)*triRand),
               xoff + mouseX + (sin(randAng+PI/3)*triRand) - (sqrt(3)/2)*triRand,      yoff + mouseY + (cos(randAng+PI/3)*triRand) + 0.5*triRand,
               xoff + mouseX + (sin(randAng+(2*PI/3)*triRand)) + (sqrt(3)/2)*triRand,  yoff + mouseY + (cos(randAng+(2*PI/3)*triRand)) + 0.5*triRand);
   
}

  

