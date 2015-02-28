
//(c) Robb Godshaw 2012 www.robb.cc
//Homework 4
//CLICK FOR BLACK
//MOVE FOR WIGGLE                            

float x1, y1, xD, yD, n1, n2, nR, nG, nB; //I feel like these aren't boyant.

float yoff1 = 0.0;
float yoff2 = 0.0;
float coloroffR = random(255);
float coloroffG = random(255);
float coloroffB = random(255);

void setup() {
  size(400,400);//This seems like a good size.
  smooth();//Aliasing is ugly.
  noStroke();//Strokes are ugly.
}

void draw() {
   
yoff1 = yoff1 + .01; //this increments the offset with which the noisey line is read
yoff2 = yoff2 + .016; //this does the same, but a little more aggressively.
n1 = noise(yoff1) * height;//this scales the noise value to match its application.
n2 = noise(yoff2) * height; //in this case, the logical denominator for the noisey value is the height

y1=mouseY+n2-50;
xD=50;  
yD=0;  
  
  // ~~~~COLOR~~~~~
coloroffR = coloroffR + .008;//.008 is arbitary. Played until pretty.
coloroffG = coloroffG + .008;
coloroffB = coloroffB + .008;
nR = noise(coloroffR) * 255;//these values are scaled from (0-1) to (0-255) 'cuz they're colors.
nG = noise(coloroffG) * 255;
nB = noise(coloroffB) * 255;
  
  if (mousePressed == true) {//on click, paint it black.
    fill(0);
  } else {
    fill(255-nR,255-nG,255-nB);;//set background to inverse color of fill
  }

background(nR, nG,nB);//set fill to noise map values
  
  beginShape();

vertex(
        -50, height //X,Y first point of blob
        ); 
bezierVertex(
        50,50,  //X,Y control point for first point
        mouseX-xD,y1-yD,  //X,Y control point for second point
        mouseX,y1);  //X,Y second point
bezierVertex(
        mouseX+xD,y1+yD,//X,Y control point for second point, ineverted to keep colinear with it's doppelganger. Colinearity btwn a point and it's control points is key to illustrator smoothness.
        350,n1,//arbitrary control point with noisy component.
        2*width,2*height);//last anchor bottom corner
    
    
    endShape();






//I referenced BezierJoins.pde Marius Watz - http://workshop.evolutionzone.com
//for smoother bezier curves (similar to illustrator)

//I also Referenced one of the Perlin noise examples on Prossesing.org

//I am fond of this noise.
}
