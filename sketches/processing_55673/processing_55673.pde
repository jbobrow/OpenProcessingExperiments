
void setup(){
  
  size(500, 500); 
smooth(); 
noStroke();
background(204); 
ellipseMode(RADIUS);
rectMode(CENTER);
}

void draw(){

//Variables
int xCoord = width/2;
int yCoord = height/2;
int bodyHeight = 150;
int bodyWidth = 100;

//Antennae 
stroke(0);
strokeWeight(3);
smooth();
strokeCap(ROUND);
line(210,110, 200, 70); //left antennae
line(290,110, 300, 70); // right antenna
noStroke();

//Head
smooth(); 
fill((255*mouseY/500));
ellipse(xCoord, yCoord-bodyHeight+25, bodyWidth/2, bodyWidth/2); 
fill(#88D5FA); //colour light blue
rect(xCoord, yCoord-bodyHeight+45, bodyWidth-20, 24); //mask

//orb
smooth(); 
fill(#88D5FA);
ellipse(xCoord, yCoord+bodyHeight/2, 30, 30); 

//Body
fill((255*mouseX/500));
noStroke(); //Disable stroke
rect(xCoord, yCoord, 100, 150); 
fill(#88D5FA);
rect(xCoord, yCoord-bodyHeight+105, 100, 10); //chest strap


//Face
//Eyes
fill(255); // Set fill to White
ellipse(xCoord-20, yCoord-bodyHeight+45, 12, 12); //left eye
ellipse(xCoord+20, yCoord-bodyHeight+45, 12, 12); //right eye 

fill(0); //Set fill to Black
ellipse(xCoord-20, yCoord-bodyHeight+43, 9, 9); //left eye
ellipse(xCoord+20, yCoord-bodyHeight+43, 9, 9); //right eye 

fill(0); //fill to grey
smooth();
rect(xCoord, yCoord-bodyHeight+65, 20, 5); //mouth


}

