
float positionX;
float positionY;
float shadeX;
float shadeY;

void setup() {
// Set the size of the window
size(500,400);
smooth();
frameRate(30);
positionX = width/2;
positionY = (height/2)+140;
}

void draw() {
float r = random(255);
float g = random(255);
float b = random(255);
//positionX = random(75,325);
//positionY = random(75,325);
// Draw a blue background
background(200,240,255);
// Set ellipses and rects to CENTER mode
ellipseMode(CENTER);
rectMode(CENTER);
//Set a black stroke for shapes created beyond this point

if(mouseX<250)
if(mouseY<250)
{
shadeX=positionX+45;
shadeY=positionY+45;
}
if(mouseX>250)
if(mouseY<250) 
{
shadeX=positionX-45;
shadeY=positionY+45;
}
if(mouseX>250)
if(mouseY>250)
{
shadeX=positionX-45;
shadeY=positionY+45;
}
if(mouseX<250)
if(mouseY>250) 
{
shadeX=positionX+45;
shadeY=positionY+45;
}

noStroke();
fill(50,50,50,90);
ellipse(shadeX,shadeY,190,30);
//Sun
stroke(255,200,0);
strokeWeight(12);
fill(255,255,0);
ellipse(mouseX,mouseY,150,150);
noStroke();
fill(255,255,0,50);
ellipse(mouseX,mouseY,220,220);
fill(255,255,0,20);
ellipse(mouseX,mouseY,300,300);
//Creature's body
strokeWeight(5);
stroke(0);
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
ellipse(positionX,positionY+20,40,40);
float firsteyeX=constrain(mouseX,225,245);
float firsteyeY=constrain(mouseY,295,305);
float secondeyeX=constrain(mouseX,255,275);
float secondeyeY=constrain(mouseY,295,305);
strokeWeight(2);
//First eye pupil
fill(r,g,b,200);
ellipse(firsteyeX,firsteyeY,8,8);
//Second eye pupil
fill(r,g,b,200); 
ellipse(secondeyeX,secondeyeY,8,8);

}
void mousePressed() {
println( "Here comes the SUN!");
}


