
//Setup canvas
void setup(){
  
//Set canvas size   
size(600,600);
//Set canvas background colour to light blue
background(126,242,242);
}


//Draw picture
void draw(){
//Smooth lines 
smooth();


//Waves

//Set pen colour for waves to white
stroke(255);

//Set fill of waves to null
noFill();

//Nested loop, when x gets to the end, y jumps down and it loops

//This is the y coordinate
for (int movey = 0; movey<660; movey = movey+60){  
  
  //This is the x coordinate
  for (int movex=0; movex<660; movex = movex+60){
  
  //Draw waves
  arc(movex,movey,60,60,HALF_PI,PI);
  arc(movex,movey,60,60,PI+HALF_PI,TWO_PI);
 
  }
}

//Boat

//Set pen colour to black
stroke(0);
//Set pen width
strokeWeight(2);
//Set line to rounded
strokeCap(ROUND);

//Boat body colour
fill(255,13,13);

//Boat body
arc(300,300,80,80,0,PI-QUARTER_PI,CHORD);

//Boat mast pole
line(300,315,280,280);

//Boat mast
//Set boat mast colour to white
fill(255);
triangle(280,280,290,300,330,280);

//Number on mast
//Set boat mast number to black
fill(0);
//Rotate number to fit in with the angle of the boat mast
rotate(-0.3);
//Set text size to 12
textSize(12);
//Set number on boat mast to 11
text("11",190,367);

//Island

//Set no border to shape
noStroke();
//Set island colour to yellow/sand colour
fill(242,219,0);
//Draw island shape
ellipse(0,0,400,400);

//Pam tree

//Set pam tree values
int long1 = 10;
int long2 = 100;

//Set pam tree outline to green
stroke(45,145,20);

//
for (int i=0; i<600; i=i+50){
//Set pam tree colour to green
fill(45,145,20);
//Draw triangle (pam tree leaves)
triangle(0,0,5,0,long1,long2);

//Fans out pam tree 
long1 = long1 + 20;
long2 = long2 - 20;
}

}


