
float xpos;
float ypos;

size(500,500);
background(0);

xpos = width/2;
ypos = height/2;

/*outside rect*/
stroke(255);
strokeWeight(2);
fill(0);
rect(xpos-130,ypos-130, 250,250);

/*outside circ*/
stroke(255);
strokeWeight(2);
fill(0);
ellipse(xpos-5,ypos-5, 245,245);

/*cross*/
line(xpos-150,ypos-110, xpos+150,ypos+110);
line(xpos-150,ypos+110, xpos+150,ypos-110);


