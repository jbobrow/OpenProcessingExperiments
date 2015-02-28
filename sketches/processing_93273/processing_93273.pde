
//variables for position
int x=50;
int y=50;

background(250);
noStroke();
fill(57,169,220);
ellipseMode(CENTER);
ellipse(x-5,y-35,10,10);
stroke(1);
point(x-5,x-35);
noStroke();
fill(135,210,235);
rectMode(CENTER);
rect(x+10,y-30,10,10);
stroke(1);
point(x+10,y-30);
fill(0,160,150,95);
stroke(11,82,181);
rectMode(CORNER);
quad(x-5,y+20,x+20,y+20,x+20,y+30,x-5,y+30);
noStroke();
fill(11,82,181);
quad(x-5,y+15,x+3,y+15,x+6,y+20,x-5,y+20);
quad(x+12,y+15,x+20,y+15,x+20,y+20,x+10,y+20);
fill(151,191,13);
triangle(x+5,y+32,x+15,y+32,x+10,y+40);
triangle(x-10,y+15,x+3,y+15,x-10,y-10);
triangle(x+12,y+15,x+25,y+15,x+20,y-10);
strokeWeight(2);
stroke(196,222,150);
noFill();
triangle(x-5,y-10,x+15,y-10,x+7,y+15);
fill(57,169,220,60);
triangle(x,y-17,x+5,y-30,x+15,y-17);
strokeWeight(1);
stroke(135,210,235);
noFill();
arc(x+8,y-27,30,30,0,PI);

