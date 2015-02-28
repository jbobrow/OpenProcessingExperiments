
//Interactive Design2
//Summer 2012, wk4
//Eonju Shin, #0227584



void setup() {
size(600, 600);
background(#FFFFFF);
smooth();
}


void draw() {
  smooth();
  
  float m = map(mouseX,0, width, 100, mouseX);
  float n = map(mouseX, 0, width, 5,100);
  float mf = map(mouseX, 0, width, 50, 1);
  float ev = map(mouseX, 0, width, 120, 1);
  float eh = map(mouseX, 0, width, 50, 90);
  
 int noseWidth = 100;
 int noseHeight = 100;

 int mouthWidth = 231;
 int mouthHeight = 38;
 
 int eyeVerticalWidth = 120;
 int eyeVerticalHeight = 600; 
 
 
//nose 
noStroke();
 fill (#FFFFFF);
 ellipse(300, 300, noseWidth,noseHeight);
 fill(0);
 ellipse(300, 300, n,n);
 
 
 
 
// mouse front
fill(#FFFFFF);
rect(160, 440, mouthWidth, mouthHeight);
fill(0);
rect(160,440, 230, mf);


// eye vertical left
fill(#FFFFFF);
rect(64, 0, eyeVerticalWidth, eyeVerticalHeight);
fill(0);
rect(64, 0, ev, 600);


// eye vertical Right

fill(#FFFFFF);
rect(415, 0, eyeVerticalWidth, eyeVerticalHeight);
fill(0);
rect(415, 0, ev, 600);

// mouse back
noFill();
stroke(0, 0, 0);
strokeWeight(1);
rect(0, 416, 599, 100);


// eye horizontal back
fill(#FFFFFF);
noStroke();
rect(0, 155, 599, eh);



// eye Left
fill(0, 0, 0);
rect(65, 172, 120, n/2);

// eye Right
fill(0, 0, 0);
rect(415, 172, 120, n/4);

}


