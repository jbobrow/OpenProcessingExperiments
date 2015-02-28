

int y = 150;

int radius = 40; float x = -radius; float speed = 10;

void setup() {
  size(700,480);
}


void draw() {  

  x += speed; 
  if (x > width+radius) 
x = -radius;  
  
smooth();
strokeWeight(3);
background(139-136-120);
ellipseMode(RADIUS);


// Head
fill(0); //set fill to black
ellipse(x, y, 50, 50); //large head
fill(255); //set fill to white
ellipse(x+12, y-45, 15, 15); //middle right eye
fill(255); //set fill to white
ellipse(x-48, y, 15, 15); //middle left eye

fill(random(255), random(255), random(255));
   frameRate(10);
ellipse(x-48, y, 5, 5); //small left eye

 fill(random(255), random(255), random(255));
   frameRate(10);
ellipse(x+12, y-45, 5, 5); //small right eye

 fill(random(255), random(255), random(255));
   frameRate(10);
   quad(x-12,y, x+12, y-20,x+27, y-10, x+2, y+20);

 

 
//BODY
fill(0); //set fill to black
ellipse(x+42, y+50, 30, 30); //BODY 1

fill(255); //set fill to white
   ellipse(x+57, y+40, 10, 10); //BODY 1 SMALL

fill(0); //set fill to black
ellipse(x+12, y+90, 30, 30); //BODY 2

fill(255); //set fill to white
ellipse(x-3, y+100, 10, 10); //BODY 2 SMALL
 
fill(0); //set fill to black
rect(x+32, y+70, 15, 130); //LONG BODY
 
fill(0); //set fill to black
rect(x+17, y+125, 45, 10); //SMALL BODY 1
 
fill(0); //set fill to black
rect(x+17, y+145, 45, 10); //SMALL BODY 2
 
fill(0); //set fill to black
rect(x+17, y+165, 45, 10); //SMALL BODY 3

 fill(random(255), random(255), random(255));
   frameRate(10);
ellipse(x+22, y+205, 20, 20); //LEG 1

 fill(random(255), random(255), random(255));
   frameRate(10);
ellipse(x+57, y+205, 20, 20); //BODY 1
}


