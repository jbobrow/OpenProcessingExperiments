
size(400,400);

int x = 155;            // X-coordinate
int y = 250;             // Y-coordinate


color gray = color(200);
color green = color(41,224,170);


background(green);


fill(gray);

//feet
ellipse(x + 55, y +45, 25, 25);
ellipse(x + 22, y +58, 25, 25);

//body
ellipse (x,y, 170, 130);
ellipse(x-50,y+10, 110, 65);
ellipse(x-50,y+ 50, 150, 75);

//eyes
fill(0);
ellipse(x- 20,y+9,4,4);
ellipse(x- 80,y+9,4,4);

//nostrils
ellipse(x- 40,y+70,2,2);
ellipse(x- 60,y+70,2,2);
