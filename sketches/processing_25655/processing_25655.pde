
void setup (){
size (500,500);
background (255);
}

void draw (){
 // vertcal lines
noStroke ();
fill (50, 100, 200);
rect (60, 410, 140, 20);
fill (0, 0, 0);
rect (50, 0 , 10, 500);
rect (120, 0 , 10, 500);
rect (170, 0 , 10, 500);
rect (200, 0 , 10, 500);
rect (300, 0 , 10, 500);
rect (380, 0 , 10, 500);
rect (415, 0 , 10, 500);
rect (465, 0 , 10, 500);
//horizontal lines
rect (0, 100, 500, 10);
rect (0, 170, 500, 10);
rect (0, 230, 500, 10);
rect (0, 320, 500, 10);
rect (300, 400, 120, 10);
rect (300, 480, 120, 10);
//squares
fill (255, 220, 0);
rect (0, 0, 50, 100);
fill (255, 2, 20);
rect (310, 330, 70, 70);
fill (255, 2, 20);
rect (475, 410, 25, 20);
}
