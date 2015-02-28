
size(300,300);

smooth();

float birthday = 11;

//red circle
fill(255,0,0);
ellipseMode(CENTER);
ellipse(150,150,3*birthday,3*birthday);

//yellow circle
fill(255,255,0);
ellipseMode(CENTER);
ellipse(250,150,60,60);

//green cube
fill(0,255,0);
rectMode(CENTER);
rect(width/birthday,150,80,80);

//orange line
stroke(255,150,0);
strokeWeight(2);
line(width*2/3,150-birthday*3,width*2/3,150+birthday*3);

//blue triangle
stroke(0);
strokeWeight(1);
fill(0,0,255);
triangle(width/3,height/2-birthday*2,width/3-birthday*2,height/2+birthday*2,width/3+birthday*2 ,height/2+birthday*2);









