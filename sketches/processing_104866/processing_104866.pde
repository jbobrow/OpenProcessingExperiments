
size(400,400);

int x = width/2;            // X-coordinate
int y = height/2;             // Y-coordinate

color gray = color(200);
color green = color(41,224,170);


background(green);


fill(gray);

//legs
//right leg
ellipse(x + width/8,y + width/8,width/6, height/9);
//left leg
ellipse(x - width/8,y + width/8,width/6, height/9);

//body
ellipse(x,y,width/2,height/3);
ellipse(x,y,width/6, height/9);
