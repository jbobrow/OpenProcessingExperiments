
size(430,430);
background(232,229,218);

//*****rectangles******
//red rect big
noStroke();
fill(232,12,19);
rect(50,50,200,200);
//red RHS
rect(400,300,30,100);

//yellow rect RHS
fill(250,219,96);
rect(250,0,150,150);
//Yellow rect LHS
rect(0,300,50,100);

//black rect LHS
fill(0);
rect(50,250,100,100);
//smaller black rect
rect(150,350,100,35);

//Blue rect
fill(10,52,165);
rect(250,300,150,85);

//****LINES*****
//Horizontal
stroke(0);
strokeCap(SQUARE);
strokeWeight(8);
line(5,50,(width-30),50);
line(5,150,50,150);
line(250,150,(width-30),150);
line(50,250,(width-30),250);
line(5,300,(width),300);
line(50,350,250,350);
line(150,385,(width-30),385);

//Vertical
line(100,5,100,50);
line(250,5,250,385);
line((width-30),10,(width-30),(height-5));
line(50,50,50,(width-5));
line(150,250,150,(height-5));
line(325,150,325,250);
