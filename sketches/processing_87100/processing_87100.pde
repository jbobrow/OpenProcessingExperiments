
int x = 25;
int y = 3;

size(600,600);
smooth();
strokeWeight(3);
background(242,239,223);

// Pattern
for (int a=0; a<= height; a+=20){
  for (int b=0; b<= width; b+=20){
  fill(242,239,223);
  rect(a, b, 20, 20);
  }
}


// Head
fill(101,111,140);
rect(250,150,100,100);
fill(155,191,171);
ellipse(320,190,30,30);
fill(0);
rect(315,160,x,y);
rect(325,220,x,y);
ellipse(320,190,10,10);

// Body
fill(101,111,140);
rect(250,250,100,100);
fill(0);
ellipse(340,295,2,2);

// Shorts
fill(65,54,89);
rect(250,350,100,50);
point(265,360);
point(260,380);
point(280,390);
point(300,380);
point(320,390);
point(335,360);
point(340,380);


//Arm
fill(101,111,140);
rect(275,275,50,100);
line(290,360,290,375);
line(310,360,310,375);

//Foot
fill(33,20,38);
rect(265,400,100,25);


