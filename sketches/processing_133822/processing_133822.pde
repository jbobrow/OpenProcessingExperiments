
/*
Jaeseong Yi
Feb 13 2014
Creative Computing Section B
Benjamin Bacon
*/

size(800,450);

//background

stroke(100,100,100);
fill(100,100,100);
rect(800,450,0,0);

//variables
int xposition;
int yposition;

xposition=round(random(100,700));
yposition=round(random(50,400));


//outline

//reference point
/*
stroke(0,0,0);
fill(0,0,0);
rect(100,100,40,20);
*/

stroke(0,0,0);
fill(0,0,0);
rect(xposition,yposition,40,20);

stroke(0,0,0);
fill(0,0,0);
rect(xposition+40,yposition-20,100,20);

stroke(0,0,0);
fill(0,0,0);
rect(xposition+140,yposition,40,20);

stroke(0,0,0);
fill(0,0,0);
rect(xposition+180,yposition+20,20,20);

stroke(0,0,0);
fill(0,0,0);
rect(xposition+200,yposition+40,20,40);

stroke(0,0,0);
fill(0,0,0);
rect(xposition+220,yposition+80,20,120);

stroke(0,0,0);
fill(0,0,0);
rect(xposition+200,yposition+200,20,40);

stroke(0,0,0);
fill(0,0,0);
rect(xposition+180,yposition+240,20,20);

stroke(0,0,0);
fill(0,0,0);
rect(xposition+140,yposition+260,40,20);

stroke(0,0,0);
fill(0,0,0);
rect(xposition+20,yposition+280,120,20);

stroke(0,0,0);
fill(0,0,0);
rect(xposition-20,yposition+260,40,20);

stroke(0,0,0);
fill(0,0,0);
rect(xposition-40,yposition+240,20,20);

stroke(0,0,0);
fill(0,0,0);
rect(xposition-60,yposition+220,20,20);

stroke(0,0,0);
fill(0,0,0);
rect(xposition-80,yposition+140,20,80);

stroke(0,0,0);
fill(0,0,0);
rect(xposition-60,yposition+120,20,20);

stroke(0,0,0);
fill(0,0,0);
rect(xposition-80,yposition+80,20,40);

stroke(0,0,0);
fill(0,0,0);
rect(xposition-60,yposition+60,20,20);

stroke(0,0,0);
fill(0,0,0);
rect(xposition-40,yposition+40,20,20);

stroke(0,0,0);
fill(0,0,0);
rect(xposition-20,yposition+20,20,20);



//white

stroke(255,255,255);
fill(255,255,255);
rect(xposition+40,yposition+20,100,20);

stroke(255,255,255);
fill(255,255,255);
rect(xposition,yposition+40,180,40);

stroke(255,255,255);
fill(255,255,255);
rect(xposition-20,yposition+60,20,20);

stroke(255,255,255);
fill(255,255,255);
rect(xposition-40,yposition+80,240,40);

stroke(255,255,255);
fill(255,255,255);
rect(xposition-20,yposition+120,220,60);

stroke(255,255,255);
fill(255,255,255);
rect(xposition-40,yposition+140,240,60);

stroke(255,255,255);
fill(255,255,255);
rect(xposition-40,yposition+200,220,20);

stroke(255,255,255);
fill(255,255,255);
rect(xposition-20,yposition+220,200,20);

stroke(255,255,255);
fill(255,255,255);
rect(xposition+20,yposition+240,140,20);



//facial features

stroke(0,0,0);
fill(0,0,0);
rect(xposition,yposition+140,20,20);

stroke(0,0,0);
fill(0,0,0);
rect(xposition-20,yposition+80,20,60);

stroke(0,0,0);
fill(0,0,0);
rect(xposition,yposition+80,40,20);

stroke(0,0,0);
fill(0,0,0);
rect(xposition+40,yposition+100,20,20);

stroke(0,0,0);
fill(0,0,0);
rect(xposition+120,yposition+60,20,60);

stroke(0,0,0);
fill(0,0,0);
rect(xposition+160,yposition+60,20,60);


//mouth

stroke(255,0,0);
fill(255,0,0);
rect(xposition+100,yposition+160,100,40);

stroke(255,0,0);
fill(255,0,0);
rect(xposition+100,yposition+140,20,20);

stroke(255,0,0);
fill(255,0,0);
rect(xposition+140,yposition+140,20,20);

stroke(255,0,0);
fill(255,0,0);
rect(xposition+180,yposition+140,20,20);

stroke(255,0,0);
fill(255,0,0);
rect(xposition+80,yposition+180,20,40);

stroke(255,0,0);
fill(255,0,0);
rect(xposition+120,yposition+200,20,20);

stroke(255,0,0);
fill(255,0,0);
rect(xposition+160,yposition+200,20,20);


