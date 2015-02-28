
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
rect(xpos-120,ypos-150, 230,290);

/*inner rect*/
stroke(255);
line(xpos-120,ypos-110, 358, ypos-110);

/*inner circ*/
ellipse(340,120, 15,15);




