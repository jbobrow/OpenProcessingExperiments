
//this is my homework for drawing a tree using recursion

//int branchLength;

//this is for angling my tree
float theta;

void setup(){
  
 size(600, 600);
 
 //branchLength = 200;
  
}

void draw(){
 background(102, 198, 234);
 stroke(255);
 strokeWeight(3);
 
 //I have to use angles and radians to make my branches go out at angles. This is tricky business.
 float angle = 80f ;
 theta=radians(angle);
 //I want my tree to grow at an angle from the bottom left corner
 translate(0, height);
 line(0, 0, 200, -200);
 //now move to the end of that line to make the branches sprout off of it
 translate(200, -200);
 //now for the rest of my branches
 drawTree(200); 
  
}

void drawTree(float branchLength){
  
 branchLength *=.8;

if (branchLength > 10){
//i had brown branches, but it looks more like a snowflake so I'm turning it white
 stroke(255);
//I need to somehow make an angle as a variable, so the branches angle off..added this in draw
pushMatrix();
rotate(theta); //rotate the whole screen then draw a line, this should make angle?
//branch to right, then branch to left, so have to do this twice I think
line(0, 0, 0, -branchLength);
translate(0, -branchLength);
drawTree(branchLength);
popMatrix();

pushMatrix();
rotate(-theta); //now go the other way
line(0, 0, 0, -branchLength);
translate(0, -branchLength);
drawTree(branchLength);
popMatrix();
}
}
  

