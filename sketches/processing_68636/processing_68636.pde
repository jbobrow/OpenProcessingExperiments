
size(400,400);
smooth();

println("Hello Kitty");

background(255);
stroke(random(255),random(255),random(255)); //random stroke color
strokeWeight(2); //thicker stroke weight
line(0,10,400,10);
stroke(random(255),random(255),random(255));
strokeWeight(1);
fill(random(255),random(255),random(255)); //random fill color
triangle(200,30,30,350,350,350);
point(200,200);
noStroke();
fill(random(255),random(255),random(255));
rect(210,210,100,100);
fill(#33008E,200);
ellipse(260,260,200,200);
fill(random(255),random(255),random(255));
quad(45,45,100,100,50,200,5,100);
strokeWeight(2);
stroke(random(255),random(255),random(255));
bezier(45,45,100,100,50,200,5,100);
