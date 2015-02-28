
//William Tsang, Penguin, CP1 mods 14-15
//url:http://azsanggetsu.webs.com/Kirby.html
smooth();
size(650,400);
//Background
fill(42,221,229);
rect(0,0,700,550);
fill(37,201,81);
rect(0,325,700,150);
//Background Tree Boss
fill(229,192,118);
rect(500,0,200,400);
triangle(575,150,450,175,575,200);
//Tree Eyes + Mouth
fill(0);
ellipse(575 - 30,100,38,75);
ellipse(575 + 30,100,38,75);
ellipse(575,250,40,75);
//"Leaves"
fill(44,216,91);
noStroke();
int x = 650;
ellipse(x,10,100,100);
x = x - 50;
ellipse(x,10,100,100);
x = x - 50;
ellipse(x,10,100,100);
x = x - 50;
ellipse(x,10,100,100);
x = x - 50;
ellipse(x,10,75,75);
x = x - 25;
ellipse(x,10,50,50);
x = x - 10;
ellipse(x,10,25,25);

//Feet
stroke(0);
fill(255,0,0);
ellipse(300 - 100,350,125,100);
ellipse(300 + 100,350,125,100);
//Body+Arms
fill(255,182,193);
ellipse(300 - 175,200,125,100);
ellipse(300 + 175,200,125,100);
ellipse(300,200,350,350);
//Blush+Mouth
fill(255,130,171);
noStroke();
ellipse(300 - 90,250,75,50);
ellipse(300 + 90,250,75,50);
fill(176,23,31);
arc(300,250,80,80,0,PI);
fill(255,182,193,200);
ellipse(300,275,75,30);
//Eyes
fill(0);
ellipse(300 - 60,150,50,100);
ellipse(300 + 60,150,50,100);
fill(255);
ellipse(300 - 60,130,35,55);
ellipse(300 + 60,130,35,55);
fill(55,97,219);
arc(300 - 60,170,35,50,0,PI);
arc(300 + 60,170,35,50,0,PI);
fill(0);
ellipse(300 - 60,170,35,25);
ellipse(300 + 60,170,35,25);
