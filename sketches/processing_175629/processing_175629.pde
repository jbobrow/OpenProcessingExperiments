
size(480,120);  //part of an ellipse 
arc(90,60,80,80,0,HALF_PI);
arc(190,60,80,0,PI+HALF_PI);
arc(290,60,80,80,PI,TWO_PI+HALF_PI);
arc(390,60,80,80,QUARTER_PI,PI+QUARTER_PI);

size(480,120);  //draw with degrees 
arc(90,60,80,80,0,radians(90));
arc(190,60,80,0,radians(270));
arc(290,60,80,80,radians(180),radians(450));
arc(390,60,80,80,radians(45),radians(225));

size(480,120);  //control your drawing order 
ellipse(140,0,190,190);
rect(160,30,260,20);

size(480,120);  //put it in reverse
rect(160,30,260,20);
ellipse(140,0,190,190);
