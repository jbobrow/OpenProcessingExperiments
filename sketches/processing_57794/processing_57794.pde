
int x = 0; 
int y = 150;


void setup() {
  

  size(700,480);
}


void draw() {  

smooth();
strokeWeight(3);
background(176,244,238);
ellipseMode(RADIUS);


// Head
fill(0); //set fill to black
ellipse(x+288, y, 50, 50); //large head
fill(255); //set fill to white
ellipse(x+300, y-45, 15, 15); //middle right eye
fill(255); //set fill to white
ellipse(x+240, y, 15, 15); //middle left eye
fill(255); //set fill to white
ellipse(x+240, y, 5, 5); //small left eye
ellipse(x+300, y-45, 5, 5); //small right eye
fill(255); //set fill to white
quad(x+270,y, x+300, y-20,x+315, y-10, x+290, y+20);

 

 
//BODY
fill(0); //set fill to black
ellipse(x+330, y+50, 30, 30); //BODY 1
fill(255); //set fill to white
ellipse(x+345, y+40, 10, 10); //BODY 1 SMALL
fill(0); //set fill to black
ellipse(x+300, y+90, 30, 30); //BODY 2
fill(255); //set fill to white
ellipse(x+285, y+100, 10, 10); //BODY 2 SMALL
 
fill(0); //set fill to black
rect(x+320, y+70, 15, 130); //LONG BODY
 
fill(0); //set fill to black
rect(x+305, y+125, 45, 10); //SMALL BODY 1
 
fill(0); //set fill to black
rect(x+305, y+145, 45, 10); //SMALL BODY 2
 
fill(0); //set fill to black
rect(x+305, y+165, 45, 10); //SMALL BODY 3
 
fill(0); //set fill to black
ellipse(x+310, y+205, 20, 20); //LEG 1
 
fill(0); //set fill to black
ellipse(x+345, y+205, 20, 20); //BODY 1

  x = x + 1;
}


