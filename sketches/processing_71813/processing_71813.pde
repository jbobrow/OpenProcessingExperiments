
// creature's local origin
int localX = 170;
int localY = 360;

color dOr = color(228,110,37);
color bOr = color(247,148,30);
//color redEyes = color(255,0,0);
float eyer = 255;
float eyeg = 0;
float eyeb = 0;
color grayD = color(61);   
color grayM = color(86);    
color grayL = color(111);

float distanceX; 
float distanceY; 
float newX; 
float newY; 

float speedX = 0.05;
float speedY = 0.1;

int shrink = 1;

//---------------------------------------------------


void setup() {
  size( 1024, 512 );        // size of the window
  smooth();                // antialiasing 
}

void draw_creature( int localX, int localY ) {

ellipseMode(CORNERS);
rectMode(CORNERS);
smooth();
noStroke();

//pushMatrix ();
//translate(0,180);

// Ears
fill(dOr);
triangle(localX-10,localY-340,localX-30,localY-280,localX-10,localY-280);
triangle(localX+10,localY-340,localX+10,localY-280,localX+30,localY-280);

// Body
fill(grayM);
ellipse (localX-30,localY-240,localX+30,localY-180);
ellipse (localX-30,localY-180,localX+30,localY-120);
fill(grayL);
ellipse (localX-20,localY-210,localX+20,localY-150);

// Upper Arms
fill(dOr);
rect(localX-110,localY-250,localX-30,localY-230);
rect(localX+30,localY-250,localX+110,localY-230);

// Shoulders
fill(grayD);
ellipse(localX-50,localY-260,localX-10,localY-220);
ellipse(localX+10,localY-260,localX+50,localY-220);

// Head
fill(bOr);
ellipse(localX-31,localY-301,localX+31,localY-239);
triangle(localX-30,localY-260,localX+30,localY-260,localX,localY-225);

// Eyes
//stroke(redEyes);
stroke(eyer,eyeg,eyeb);
strokeWeight(3.5);
line(localX-27,localY-270,localX-10,localY-260);
line(localX+10,localY-260,localX+27,localY-270);
noStroke();

// Lower Arms
fill(bOr);
ellipse(localX-150,localY-260,localX-90,localY-140);
ellipse(localX+90,localY-260,localX+150,localY-140);

// Claws
stroke(grayD);
strokeCap(SQUARE);
strokeWeight(4.0);
// Outer
line(localX-130,localY-150,localX-127,localY-125);
line(localX+128,localY-150,localX+125,localY-125);
// Middle
line(localX-120,localY-150,localX-117,localY-125);
line(localX+118,localY-150,localX+115,localY-125);
// Inner
line(localX-110,localY-150,localX-107,localY-125);
line(localX+108,localY-150,localX+105,localY-125);
noStroke();

// Mid Legs
fill(dOr);
rect(localX-70,localY-100,localX-50,localY-60);
rect(localX+70,localY-100,localX+50,localY-60);

// Feet
fill(bOr);
triangle(localX-50,localY-80,localX-30,localY-80,localX-70,localY);
triangle(localX+30,localY-80,localX+50,localY-80,localX+70,localY);

// Upper Legs
fill(grayD);
ellipse(localX-80,localY-160,localX-20,localY-80);
ellipse(localX+20,localY-160,localX+80,localY-80);

//popMatrix ();
}


void draw() {
  
float alphaR = 20;
  
//Follow mouse on left click
if(mousePressed==true){
    //create transition from original position to mouse position
    newX = mouseX;
    newY = mouseY;
        distanceX = newX - localX;
        localX += distanceX*speedX;
        distanceY = newY - localY;
        localY += distanceY*speedY;
        //black background fade-in
        fill(0, 0, 0, 20);
        rect(0, 0, width, height);
        //change eye colour
        eyeg = constrain (eyeg,0,255);
        eyeg = eyeg + 5;
} 

else if(mousePressed==false){
    localX = localX;
    localY = localY;
        //black background fade-out
        fill(255, 255, 255,alphaR);
        rect(0, 0, width, height);
        //change back eye colour
        eyeg = constrain (eyeg,0,255);
        eyeg = eyeg - 5;
}


shrink =+ shrink + 1;

for ( int j= -200-shrink; j< 200-shrink; j+= 100-shrink ) {
    for ( int i=-400-shrink; i<=400-shrink; i+= 200-shrink ) {
      draw_creature( localX-i+j, localY+j );
      
      if(shrink==50){
        shrink = 0;
      }
     
}


}
}
