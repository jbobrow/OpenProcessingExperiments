
size(800,400);
float headx = 400;
float heady = 200;

fill(0,0,0);
rectMode(CENTER);
stroke(0,0,0);
//Body
rect(headx,heady,80,100);

//Sleeves
rect(headx-40,heady-30,40,40);
rect(headx+40,heady-30,40,40);

//Legs
rect(headx-20,heady+100,20,100);
rect(headx+20,heady+100,20,100);

//Feet
rect(headx-30,heady+150,40,15,2);
rect(headx+30,heady+150,40,15,2);

//Hair
stroke(72,53,21);
fill(72,53,21);
ellipse(headx,heady-110,60,75);
ellipse(headx,heady-110,30,20);

//Face
stroke(245,220,180);
fill(245,220,180);
ellipse(headx,heady-100,60,75);

//Neck
rect(headx,heady-60,20,30,8);

//Arms
rect(headx-45,heady-90,15,120);
rect(headx-50,heady-150,5,30);

rect(headx+45,heady-90,15,120);
rect(headx+50,heady-150,5,30);

//Diller
//rect(400,200+70,10,40,8);

stroke(255,255,255);
line(headx-50,heady+158,400-10,200+158);
line(headx+50,heady+158,400+10,200+158);

//Glasses
stroke(72,53,21);
fill(255,255,255);
ellipse(headx-12,heady-100,20,20);
ellipse(headx+12,heady-100,20,20);
line(headx-2,heady-100,headx+2,heady-100);

line(headx+30,heady-100,headx+22,heady-100);
line(headx-30,heady-100,headx-22,heady-100);

line(headx-20,heady-110,headx-5,heady-110);
line(headx+20,heady-110,headx+5,heady-110);

//Mouth
ellipse(headx,heady-80,30,10);

//Teeth
line(headx-15,heady-80,headx+15,heady-80);
line(headx-10,heady-82.5,headx-10,heady-77.5);
line(headx+10,heady-82.5,headx+10,heady-77.5);
line(headx-5,heady-84,headx-5,heady-75);
line(headx+5,heady-84,headx+5,heady-75);

//eyes
fill(72,53,21);
ellipse(headx-12,heady-100,5,5);
ellipse(headx+12,heady-100,5,5);

//Hair






