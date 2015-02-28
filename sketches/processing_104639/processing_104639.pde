
size(400,400);
strokeWeight(7);
background(255);

fill(220);//grey
noStroke();
rect(0,0,95,45);
rect(0,145,45,255);
rect(147.5,250,102.5,100);
rect(380,0,20,300);

fill(222,45,27);//red
stroke(0);
strokeWeight(7);
rect(45,45,205,205);
noStroke();
rect(380,300,20,100);

fill(36,14,157);//blue
stroke(0);
rect(250,300,130,80);

fill(252,211,106);//yellow
noStroke();
rect(250,0,130,45);
rect(0,300,45,100);
stroke(0);
strokeWeight(7);
rect(250,45,130,100);

fill(0);//black
rect(45,250,102.5,100);
rect(147.5,350,102.5,30);

fill(255);//white
rect(250,250,130,50);
rect(315,145,65,105);

//lines
strokeCap(SQUARE);
//top
line(95,45,95,10);
line(250,45,250,5);
line(380,45,380,15);

//left
line(45,45,10,45);
line(45,145,10,145);
line(45,300,10,300);

//bottom
line(45,300,45,380);
line(147.5,300,147.5,390);
line(380,300,380,390);

//right
line(380,300,400,300);

//others
line(147.5,300,250,300);
