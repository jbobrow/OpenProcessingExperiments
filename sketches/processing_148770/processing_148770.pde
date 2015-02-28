
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: PARK Hyebin
 // ID: 201420081

float xLast;
float yLast;
boolean backGround = true;
boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
 

// -------------------------------------------- 
void setup(){
  size(800,600);
  smooth();
  background(#eeeeee,40);
  frameRate(10);
}
// -------------------------------------------- 
void draw(){
  if (backGround){
    fill(#eeeeee,30);
    stroke(0,50);
  }
  if(backGround){
    fill(0,30);
    stroke(255,50);
  }
  rect(0,0,width,height);
  line(mouseX, mouseY, pmouseX, pmouseY);
  fill(random(255));
  ellipse(mouseX, mouseY,30,30);
 
 stroke(random(255),random(155),random(200));
  line(mouseX,mouseY,xLast,yLast);
  xLast=pmouseX;
  yLast=pmouseY;
  title();
}
  // -------------------------------------------- 
 
void title(){
  fill(127);
  text("PARK Hyebin, title of work, Dynamic Media, 2014",width-300, height-20);
}
