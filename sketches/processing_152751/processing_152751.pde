
// Learning Processing by Daniel Shiffman
// Example 3-6: Interactive Zoog?
// http://www.learningprocessing.com/examples/chapter-3/example-3-6/
float zoogX;
float zoogY;
float eyeR;
float eyeG;
float eyeB;
float ant;
float shake;

void setup()
{
  // setup() runs once
  size(300,300);
  smooth();
  frameRate(30);
  
  // Position Zoog at center of screen
        zoogX = width/2;
        zoogY = height+100;
}

void draw()
{
// draw() loops forever, until stopped
// Draw a white background
background(245);

// Set ellipses and rects to center
rectMode(CENTER);
ellipseMode(CENTER);

// Set stroke color (0) and weight
stroke(0);
strokeWeight(1);

// random para shake
shake = random(-1,1);

// random para antenas
ant = random(-2,2);

// Antenna 1
line((zoogX-20)+ ant,zoogY-95,zoogX-16,zoogY-68);

// Antenna 2
line((zoogX+20) + ant, zoogY-95, zoogX+16, zoogY-68);

strokeWeight(5);


//Body
fill(0,75,175);
rect(zoogX,zoogY,80,78);

//Head
stroke(0);
fill(0,225,0);
ellipse(zoogX,zoogY-40,60,60);

// Arms
fill(0,175,175);
rect(zoogX-40,zoogY,20,31);
rect(zoogX+40,zoogY,20,31);

//Legs
fill(0,105,175);
rect(zoogX-40,zoogY+40,24,32);
rect(zoogX+40,zoogY+40,24,32);

// Legs lines
stroke(0);
strokeWeight(6);
line(zoogX-40,zoogY+40,zoogX-40,zoogY+61);
line(zoogX+40,zoogY+40,zoogX+40,zoogY+61);

// Eyes
eyeR = random(255);
eyeG = random(255);
eyeB = random(255);
// Eye color is randomly determined
fill(eyeR,eyeG,eyeB); 
noStroke();
// Draw left eye
ellipse(zoogX-14,zoogY-41,16,16);

// Draw right eye
ellipse(zoogX+14,zoogY-41,16,16); 




if (zoogY == width/2) {
println("¡Llegue al centro!");
zoogY = 150; 
} 
    else {zoogY = zoogY - 1;
    zoogX = zoogX + shake;
    zoogY = zoogY + shake;
     }

}

void mousePressed()
{
println("Take me to your leader!");
}
