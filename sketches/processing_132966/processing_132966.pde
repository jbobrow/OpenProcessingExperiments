
size (800, 400);
background(#28A9E8); 

float headX=width/2;


noStroke();
fill(#4A1BDB);
ellipse (headX, 200, 280, 200);

stroke (255, 255, 255);

line (headX-50, 200-20, headX-10, 200-20);
line (headX+10, 200-20, headX+50, 200-20);
smooth();
ellipse(headX-4,205, 10, 10);
ellipse(headX+8, 205, 10, 10);


//arguments: x,y, width, height
rectMode(CENTER);


//bocca
stroke (255, 255, 255);
line (headX-40, 240, headX+40, 240);

/*my portfolio--> export from web
www.openprocessing.org/classroom/3644 
//invitation code:102DED
*/
