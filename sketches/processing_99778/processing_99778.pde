
void setup(){size(500,450);}

void draw(){background(255);

if ((mouseX < 166) && (mouseY <250)) {noStroke();
fill(mouseX,mouseY,144);
ellipse(250,220,400,190);
ellipse(250,330,300,125);
strokeWeight(30);
stroke(0);
line(250,100,250,400);
strokeWeight(5);
line(245,90,215,40);
line(255,90,285,40);}

else if ((mouseX<=166) && (mouseY >250)) {noStroke();
fill(mouseX,height-mouseY,144);
ellipse(250,220,400,190);
ellipse(250,330,300,125);
strokeWeight(30);
stroke(0);
line(250,100,250,400);
strokeWeight(5);
line(245,90,215,40);
line(255,90,285,40);}

else if ((mouseX < 332) && (mouseY <250)) {noStroke();
fill(mouseX-77,mouseY,77);
ellipse(334,220,400,190);
ellipse(334,330,300,125);
strokeWeight(30);
stroke(0);
line(334,100,334,400);
strokeWeight(5);
line(329,90,299,40);
line(339,90,369,40);}

else if ((mouseX<=332) && (mouseY >250)) {noStroke();
fill(mouseX-77,height-mouseY,77);
ellipse(334,220,400,190);
ellipse(334,330,300,125);
strokeWeight(30);
stroke(0);
line(334,100,334,400);
strokeWeight(5);
line(329,90,299,40);
line(339,90,369,40);}

else if ((mouseX < 500) && (mouseY <250)) {noStroke();
fill(mouseX-245,mouseY,231);
ellipse(166,220,400,190);
ellipse(166,330,300,125);
strokeWeight(30);
stroke(0);
line(166,100,166,400);
strokeWeight(5);
line(161,90,131,40);
line(171,90,201,40);}

else if ((mouseX<=500) && (mouseY >250)) {noStroke();
fill(mouseX-245,height-mouseY,231);
ellipse(166,220,400,190);
ellipse(166,330,300,125);
strokeWeight(30);
stroke(0);
line(166,100,166,400);
strokeWeight(5);
line(161,90,131,40);
line(171,90,201,40);}}
