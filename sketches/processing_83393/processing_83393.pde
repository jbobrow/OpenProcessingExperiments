
void setup() {
  
size(400,400);
background(255);
smooth();
ellipseMode(CENTER);
rectMode(CENTER); 

}


void draw () {
  background(255);
// Body
stroke(0);
fill(3,60,88);
rect(200,200,40,200);

// Head

fill(245,222,228);
ellipse(200,140,150,150); 

// Eyes socket
stroke(0);
fill(255); 
ellipse(162,140,50,50); 
ellipse(238,140,50,50);

//eye colour
noStroke();
fill(81, 113, 237);
ellipse(162,140,35,35); 
ellipse(238,140,35,35);



//pupils
stroke(0);
fill(0); 
ellipse(162,140,20,20); 
ellipse(238,140,20,20);

// Legs
stroke(0);
line(180,300,160,360);
line(220,300,240,360); 

//Arms
stroke(0);
line(180,240,130,220);
line(220,240,270,220);

}
