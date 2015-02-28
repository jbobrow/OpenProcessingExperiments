
//Joy's Ode To Piet Mondrain

void setup(){
size(500, 500); 
smooth();
background(255);


color c1 = color(250, 3, 7);
color c2 = color(12, 6, 113);
color c3 = color(244, 2245, 17); 

//Color 1, Red
strokeWeight(0);
fill (c1);
rect(130, 10, 355, 310);

//color 2, Blue
strokeWeight(0);
fill (c2);
rect(15, 320, 115, 175);

//color 3, Blue
strokeWeight(0);
fill (c3);
rect(408, 408, 80, 80);

//Top Line, Horizontal
smooth();
strokeWeight(20);
line(600, 1, 1, 1);

//Bottom Line, Horizontal
smooth();
strokeWeight(20);
line(600, 495, 0, 495);

//Left Line, Vertical
smooth();
strokeWeight(20);
line(5, 1, 5, 600);

//Rightt Line, Vertical
smooth();
strokeWeight(20);
line(495, 0, 495, 600);

//Vertical Line 1 Full
smooth();
strokeWeight(15);
line(125, 10, 125, 600);

//Vertical Line 2 Short
smooth();
strokeWeight(15);
line(400, 325, 400, 500);

//Horizontal Line 1 Short+Thick
smooth();
strokeWeight(20);
line(120, 100, 0, 100);

//Horizontal Line 2 Long+Thin
smooth();
strokeWeight(15);
line(600, 325, 0, 325);

//Horizontal Line 3 Short
smooth();
strokeWeight(15);
line(400, 400, 500, 400);




}



