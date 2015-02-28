
size(400,400);

background(237,242,227);//background off white


strokeCap(SQUARE); 
stroke(0); //grid line black and thickness 
strokeWeight(7);

line(6 ,150 ,378 ,150); //med line b EXTRA LINE

noStroke();
fill(255,0,0);//red
rect(375,297,25,103); //bottom right red box
fill(255,0,0);//red
rect(41,45,209,209); //big red square


noStroke();
fill(239,200,72);//yellow
rect(247,0,134,147); //top left yellow box
rect(0,297,45, 400);//bottom left yellow box


strokeCap(SQUARE); 
stroke(0); //grid line black and thickness 
strokeWeight(7);


line(5,45,375,45);// big line B
line(41,45,41, 385); //big line A
line(378,15, 378, 390); //big line C
line(5, 300, 400, 300); //big line D EXTRA LINE

line(250, 7, 250, 375);//med line c
line(145,375 , 378, 375); //med line a
line(41, 253, 378,253);//med line d


line(146, 253, 146, 390);//small line e
line(41,347 , 250, 347);//small line g
line(314,150,314, 253);//small line f
line(92,5 ,92,45);//small line h


noStroke();
fill(0);//black
rect(41,253, 110,94); //black square
rect(143,349, 104, 28);//black rectangle

fill(7,43,142);//blue
rect(253,303,122,70); //blue rectangle
