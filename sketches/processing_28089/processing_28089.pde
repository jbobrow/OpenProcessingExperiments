
float angle, spin;
int dotCnt, gap;
int halfW, halfH;
  
void setup() {
  size(600,400, P3D);
  colorMode(HSB,100,100,15);
  
  angle = 0.0; //main counter
  spin = PI/25; // the amount our counter changes per draw cycle
  halfW = width/2; // for translating to center of screen
  halfH = height/2; // for translating to center of screen
  dotCnt = 60; // number of dots accross and down in one quadrant
  gap = 20; //size of gap between dots
}

void draw() {
  angle -= spin; //main counter
  
  background(0);
  pushMatrix();
    translate(halfW, halfH, -200); //set origin to center of screen and out a little bit
    rotateX((float)mouseY/-height); //the "tilt" of the view is based on the mouse's up/down movement
    rotateY(radians(angle*2)); //slowly spins around the origin just for fun
    float magn = (float)mouseX*0.25; //the quasi-magnitude is based on the mouse's horizontal position
    for (int z=0; z < dotCnt; z++) {
      for (int x=0; x < dotCnt; x++) {
        //we're only figuring 1/4 of the grid, so 0=origin and dotCnt=edge
        float dotX = x*gap; //expand x by the gap amount
        float dotZ = z*gap; //same for z
        float dotDist = sqrt(sq(x) + sq(z)); //get this dot's distance from the origin
        float dotY = sin(angle+dotDist)*magn/dotDist; //this is where the magic happens
        float dotHue = dotDist*2; //hue is based simply on the dot's distance from the origin
        float dotSat = 100; //saturation is maxed out
        float dotBrt = (dotY + 15)/(dotDist*0.15); // brightness is based on dots height, giving us the bright peaks/dark troughs, and dims with distance from origin
        
        stroke(dotHue, dotSat, dotBrt); //color
        
        // four dots - one for each quadrant
        point(dotX, -dotY, dotZ);
        point(-dotX, -dotY, dotZ);
        point(dotX, -dotY, -dotZ);
        point(-dotX, -dotY, -dotZ);
      }
    }  
  popMatrix();
}

