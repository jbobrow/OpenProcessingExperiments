
float positionX;
float positionY;
void setup() {
// Set the size of the window
size(400,400);
smooth();
frameRate(2);
positionX = width/2;
positionY = height/2;
}
void draw() {
float r = random(255);
float g = random(255);
float b = random(255);
positionX = random(75,325);
positionY = random(75,325);
// Draw a gray background
background(255,200,20,100);
// Set ellipses and rects to CENTER mode
ellipseMode(CENTER);
rectMode(CENTER);
//Set a black stroke for shapes created beyond this point
stroke(0);
strokeWeight(5);
//Creature's body
fill(100,100,0);
ellipse(positionX-25,positionY+45,45,17);
fill(100,100,0);
ellipse(positionX+25,positionY+45,45,17);
fill(100,100,0);
ellipse(positionX,positionY,100,100);
//Creature's first eye
fill(255,255,255);
ellipse(positionX-15,positionY-40,30,30);
//Creature's second eye
fill(255,255,255);
ellipse(positionX+15,positionY-40,30,30);
//Creature's eyebrows
strokeWeight(3);
fill(0);
rect(positionX-15,positionY-65,20,5);
rect(positionX+15,positionY-65,20,5);
//Creature's mouth
strokeWeight(2);
fill(255,0,0,200);
ellipse(positionX,positionY+20,random(20,45),random(10,50));
if(positionX>200)
if(positionY>200)
{
positionX=positionX-5;
positionY=positionY-5;
}
if(positionX<200)
if(positionY<200)
{
positionX = positionX+5;
positionY = positionY+5;
}
if(positionX>200)
if(positionY<200) 
{
positionX = positionX-5;
positionY = positionY+5;
}
if(positionX<200)
if(positionY>200)
{
positionX = positionX+5;
positionY = positionY-5;
}
if(positionX>193)
if(positionX<207)
{
positionX=positionX;
}
if(positionY>193)
if(positionY<207)
{
positionY=positionY;
}
strokeWeight(2);
//First eye pupil
fill(r,g,b,200);
ellipse(positionX-15,positionY-40,8,8);
//Second eye pupil
fill(r,g,b,200); 
ellipse(positionX+15,positionY-40,8,8);
}
void mousePressed() {
println( "STOP! I'm getting dizzy!");
}


