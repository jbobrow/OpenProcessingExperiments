
//Assignment #1
//Brenna Lash
//blash@brynmawr.edu
//9-7-2010

void setup(){
size(500,500);
smooth();

}

void draw(){
//picnic blanket background  
background(250);
strokeWeight(10);
stroke(255,0,0,225);
fill(255,0,0,225);
rect(25,0,50,499);
rect(125,0,50,499);
rect(225,0,50,499);
rect(325,0,50,499);
rect(425,0,50,499);

stroke(255,0,0,0);
fill(255,0,0,100);
rect(0,25,499,50);
rect(0,125,499,50);
rect(0,225,499,50);
rect(0,325,499,50);
rect(0,425,499,50);

//watermelon
strokeWeight(15);
stroke(29,116,54);
fill(232,87,191);
arc(250,200,300,300,0,PI);
stroke(74,197,58);
fill(247,77,208,0);
arc(250,200,275,275,0,PI);

//seeds
strokeWeight(0);
stroke(0);
fill(0);
ellipse(150,233,10,20);
ellipse(190,255,10,20);
ellipse(240,250,10,20);
ellipse(295,260,10,20);
ellipse(340,230,10,20);

//bite
stroke(250);
fill(250);
ellipse(198,203,28,30);
ellipse(202,200,23,24);
ellipse(205,200,30,20);

//ants
fill(0);
stroke(0);
ellipse(293,400,5,5);
ellipse(296,401,5,5);
ellipse(299,402,5,5);
line(293,400,296,393);
line(293,400,291,392);

ellipse(103,75,5,5);
ellipse(106,76,5,5);
ellipse(109,77,5,5);
line(103,75,107,67);
line(103,75,102,67);

ellipse(450,190,5,5);
ellipse(453,191,5,5);
ellipse(456,192,5,5);
line(450,190,452,182);
line(450,190,447,182);

//interactive ant
ellipse(mouseX+6,mouseY+2,5,5);
ellipse(mouseX+9,mouseY+3,5,5);
ellipse(mouseX+12,mouseY+4,5,5);
line(mouseX+3,mouseY+3,mouseX+3,mouseY-5);
line(mouseX+3,mouseY+3,mouseX+9,mouseY-5);

}




