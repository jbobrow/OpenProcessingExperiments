
ellipseMode(CENTER);
rectMode(CENTER);
size(200,200);//size of screen
background(255);//background color
fill(0,127,127,150);//outer eye color
smooth();
ellipse(100,35,30,20);//outer eye
fill(0,0,255,255);
smooth();
ellipse(100,35,20,10);//inner eye
fill(127,100,0,63);//head color
smooth();//smooth head shape
ellipse(100,40,65,50);//head
fill(255,0,0);//body color
ellipse(100,110,50,70);//belly
fill(150,0,0,67);
ellipse(100,110,80,90);//outer belly
stroke(0);//left arm color
smooth();
strokeWeight(5);
line(70,75,40,105);//upper left arm
smooth();
strokeWeight(5);
line(40,105,65,130);//lower left arm
stroke(0);//right arm color
smooth();
strokeWeight(5);
line(130,75,160,105);//upper right arm
smooth();
strokeWeight(5);
line(160,105,130,130);
println("I HAVE NO FEET!");

