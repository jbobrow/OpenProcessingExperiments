
size(300,300);
smooth();
strokeWeight(1);
background(255,204,0); //background colour


//HEAD

stroke(0);
fill(0);
arc(150,117,75,75, 0.6, 6);  
strokeWeight(3);
stroke(255,255,255);
line(145,105,152,100);



//NECK
strokeWeight(2);
fill(205,205,193);
rect(140,160,20,5); //(x,y, width, height)
rect(140,170,20,5);
rect(140,180,20,5);

strokeWeight(3);
stroke(255,255,255);
//BODY
fill(0);
triangle(75,190,150,255,225,190);


//ARMS
line(216,200,260,210); 
line(212,205,257,215);
line(261,212,264,180);
line(264,212,267,180);
fill(255,153,18);
ellipse(265,180,11,11);
ellipse(262,212,10,10);

line(86,202,44,220);
line(89,207,46,225);
line(45,223,60,245);
line(42,223,57,245);
fill(255,153,18);
ellipse(60,250,11,11);
ellipse(45,223,10,10);

strokeWeight(2); //stroke thickness
//WHEELS
ellipse(135,260,17,17);
ellipse(165,260,17,17);


