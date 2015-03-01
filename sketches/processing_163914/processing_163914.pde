
// setup the sketch
void setup() { 
size(700, 700); // size 700px by 700px
smooth(); 
background(0); // background color black
noLoop(); // stop draw loop
} 

void draw() {  
translate(350, 350); // x,y move to center
for (int an=1; an<360;an++) { //begin loop, angle<360
rotate(2*PI/an); //rotate angle 2*pi
niuniuniu(); // the image
} 
} 

void niuniuniu() { 
noFill(); 
beginShape(); //start 
vertex(0, 0); // the x is 0, y is 0
int c1 = int(random(100, 250)); 
int c2 = int(random(-40, 250)); 
stroke(100, 212, 101, 100); // ilnes color
bezierVertex(c2, c2, c1, c2, c1, c2); //set coordinate int c1 and c2 in sketch
bezierVertex(c1, c2, c1, c2, c1, c2); 
endShape(); // end
fill(250, 140, 63, 200); // point color
noStroke(); 
ellipse(c1, c2, 5, 5); // ellipse size and place
} 


