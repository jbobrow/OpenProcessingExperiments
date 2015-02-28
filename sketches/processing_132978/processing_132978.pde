
///write to the console
println("hello"); 

///set the canvas size
size(800,400);

background(#56C7FA);

float headX = 400;
float headY = 200;

///arguments: x, y, width, height
noStroke();
fill( #FFE9CE);
ellipse( headX, 200, 170, 200 );

///arguments: x1, y1, x2, y2
stroke( 0, 0, 0);
strokeWeight(4);
curve(headX-50, 200-10, 400-35, 200-40, 400-25, 200-40, 400-20, 200-10 );
curve(headX+50, 200-10, 400+35, 200-40, 400+25, 200-40, 400+20, 200-10 );

strokeWeight(4);
line(headX, 160, headX+10, 220);
line(headX-5, 220, 410, 220);
line(headX-15, 250, 415, 250);

strokeWeight(5);
line(headX-55, 70, headX-55, 360);
line(headX-50, 80, headX-50, 360);
line(headX-45, 90, headX-45, 360);
line(headX-60, 100, headX-60, 360);
line(headX-65, 110, headX-65, 360);
line(headX-70, 110, headX-70, 360);
line(headX-75, 130, headX-75, 360);
line(headX-80, 130, headX-80, 360);
line(headX-85, 130, headX-85, 360);

line(headX+55, 70, headX+55, 360);
line(headX+50, 80, headX+50, 360);
line(headX+45, 90, headX+45, 360);
line(headX+60, 100, headX+60, 360);
line(headX+65, 110, headX+65, 360);
line(headX+70, 110, headX+70, 360);
line(headX+75, 130, headX+75, 360);
line(headX+80, 130, headX+80, 360);
line(headX+85, 130, headX+85, 360);

fill(0,0,0);
rect(headX-85, 70, 170, 70);


