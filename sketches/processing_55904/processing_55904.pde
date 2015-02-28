
size (1000, 1000);
smooth();
background (200);

int x=400; //Head x-coordinate
int y=500; //Head y-coordinate
int bodyHeight = 200; //Body Height

//Neck
stroke(0);
strokeWeight(20);
line(x-50,y-100,550,600);

//Arm
noStroke();
quad(610,610,620,620,750,510,740,500);
fill(100);
triangle(750,510,790,525,820,460);
triangle(740,500,720,460,780,420);

//Legs
fill(0);
rect(500,700,10,100);
rect(570,700,10,100);
fill(100);
quad(510,800,500,800,450,820,510,820);
quad(570,800,580,800,630,820,570,820);

//Head
fill(0);
stroke(1);
strokeWeight(8);
line(x-55,y-150,x-55,y-250);
line(x-10,y-130,x+70,y-200);
fill(200);
strokeWeight(6);
ellipse(x-55,y-250,20,20);
ellipse(x+70,y-200,20,20);
noStroke();
fill(255);
ellipse(x-50,y-100,100,100);
fill(200);
stroke(100);
strokeWeight(3);
rectMode(CENTER);
rect(x-55,y-80,40,20);

//Eye
noStroke();
fill(150);
quad(x-50,y-130,x-70,y-110,x-200,y-210,x-130,y-270);
fill(255);
stroke(160);
strokeWeight(15);
ellipse(x-220,y-300,180,180);
noStroke();
fill(10);
ellipse(x-220,y-300,60,60);

//Body
fill(255);
ellipse(550,650,250,bodyHeight);
fill(100);
stroke(150);
strokeWeight(3);
ellipse(600,600,50,bodyHeight/4);
ellipse(600,700,50,bodyHeight/4);
ellipse(630,650,50,bodyHeight/4);
fill(200);
triangle(500,650,570,600,570,700);

