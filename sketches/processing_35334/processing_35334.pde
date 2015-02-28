
size(300,300);
background(210);
smooth();

float e = 12;

ellipseMode(RADIUS);
fill(250,0,0);
ellipse(.5 * width, .5 * height, 3 * e, 3 * e);

ellipseMode(RADIUS);
fill(250,250,85);
ellipse(.5 * width + 100, .5 * height, 30,30);

fill(0,250,0);
rectMode(CENTER);
rect(width / e, .5 * height, 80,80);

fill(0,0,250);
triangle(width/3, height/2-e*2, width/3-e*2,height/2+e*2,width/3+e*2, height/2+e*2);

strokeWeight(2);
stroke(250,120,50);
line((width*2)/3 , ((height/2)+(3*e)) , (width*2)/3 , ((height/2)-(3*e)));



