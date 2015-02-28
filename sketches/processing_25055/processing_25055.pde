
//declare variables (initialize one of them) 
float r;
float g;
float b;
float backgroundMousea;
float backgroundMouseb;
float backgroundMousec=67;
float locX;
float locY;

void setup(){
size(500,500);
background(255);
}

void draw(){
//initialize variables 
r=random(255);
g=random(255);
b=random(255);
//make background color random
background(r,g,b);

//make background solid pink when mouse rolls over certain area
if (mouseY>250 && mouseY<=375){
r=255;
g=127;
b=255;
background(r,g,b);
}
//make background white if mouse is pressed
if (mousePressed){
  background(255);
}
//make background color determined by mouse location if mouse is near top of window
if (mouseY>=0 && mouseY<=125 && !mousePressed){
backgroundMousea=mouseX;
backgroundMouseb=mouseY;
background (backgroundMousea,backgroundMouseb,backgroundMousec);
}

//initialize locX and locY as random and constrained between x and y values 0 to 500 
locX=random(0,500);
locY=random(0,500);

//if any key is pressed and mouse is not pressed, make white squares appear at random locations
if (keyPressed && !mousePressed){
  fill(255);
  rect(locX,locY,40,40);
  
//if both the mouse is pressed and any key is pressed, make randomly colored squares appear at random locations
}else if (mousePressed && keyPressed){
  fill(r,g,b);
  rect(locX,locY,40,40);

}
}


