
/*Sarah Scialli
Homework 2- "Respond"
*/

PImage closedEyes;
int x = 325;
int y = 200;
int lowerEyes = 110;
int upperEyes = 260;

void setup(){
  size(640,480);
  background(255);
  smooth();
  strokeWeight(5);
  strokeCap(ROUND);
  openEyes(x,y);
 }
 
 
void draw(){
  background(255);
  if(inLeftEye() || inRightEye()){
    closeEyes(0,60);
  }
  else{
    openEyes(x,y);      
  }
 
 }
 
boolean inLeftEye(){
  return ((mouseX >= 20) && (mouseX <= 290) 
          && (mouseY <=upperEyes) &&(mouseY>=lowerEyes));   
 }

boolean inRightEye(){
  return (mouseX >= 350) && (mouseX <= 620) 
        &&(mouseY <=upperEyes) &&(mouseY>=lowerEyes);   
 }
 
void openEyes(int x, int y){
  float d= dist(mouseX,mouseY, x,y);
  
  //eye on left of screen
  color greenEye = color(0,153,0, 255-d/6);
  color blueLid = color(51,51,153);
  fill(blueLid);
  arc(x-165,y+60, 283, 296, radians(208), radians(337));
  fill(255);
  arc(x-165, y+120, 346,374, radians(220) , radians(319));
  noFill();
  arc(x-165, y-120, 370,340, radians(45) , radians(135));
  fill(greenEye);
  ellipse(x-165,y-10,102, 115);
  //pupil responds to distance
  fill(0);
  ellipse(x-165,y-10, 67- d/20, 95-d/15);
  fill(255);
  ellipse(x-150 - d/50, y-30 +d/40, 18,18);
  //lashes  
  line(x-195,y-65,x-215,y-110);
  line(x-235,y-53,x-263,y-95);
  line(x-266,y-32,x-295,y-68);

  //eye on right of screen
  fill(blueLid);
  arc(x+165,y+60, 283, 296, radians(208), radians(337));
  fill(255);
  arc(x+165, y+120, 346,374, radians(221) , radians(319));
  noFill();
  arc(x+165, y-120, 370,340, radians(45) , radians(135));
  fill(greenEye);
  ellipse(x+165,y-10, 102,115);
  fill(0);
  //pupil responds to distance
  ellipse(x+165,y-10, 67- d/20, 95-d/15);
  fill(255);
  ellipse(x+150 + d/50, y-30 +d/40, 18,18);
  //lashes
  line(x+195,y-65,x+215,y-110);
  line(x+235,y-53,x+263,y-95);
  line(x+266,y-32,x+295,y-68);
  
  
 }
 
void closeEyes(int x,int y){
  closedEyes= loadImage("closedEyes.png");
  image(closedEyes,x,y);  
 }


