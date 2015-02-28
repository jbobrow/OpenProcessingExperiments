
float x = 0;
float y = 0;
float easing = 0.05;

void setup()
{
  size(500,500);
}

void draw()
{
background(0);
stroke(75,190,235);
strokeWeight(3);
smooth();

if ((mouseX > 125) && (mouseX < 375) &&
(mouseY > 125) && (mouseY < 375)) {
fill(252,249,38);
} else {
  fill(255);
}

if (mousePressed == true) {
  fill(250,15,30);
}
  
float targetX = mouseX;
float targetY = mouseY;

x+=(targetX - x)*easing;
y+=(targetY - y)*easing; 

rect(x-50,y+30,20,20);
triangle(x-30,y+30,x,y+40,x-30,y+50);
triangle(x-30,y+50,x-40,y+80,x-50,y+50);
triangle(x-50,y+50,x-80,y+40,x-50,y+30);
triangle(x-50,y+30,x-40,y,x-30,y+30);
ellipse(x-80,y+80,5,5);
ellipse(x-85,y+90,8,8);
ellipse(x-95,y+75,10,10);
ellipse(x-105,y+95,20,20);
triangle(x-125,y+90,x-140,y+95,x-133,y+100);
triangle(x-140,y+110,x-120,y+120,x-130,y+140);
triangle(x-170,y+80,x-180,y+110,x-150,y+120);
quad(x-180,y+130,x-170,y+120,x-160,y+130,x-170,y+140);
rect(x-160,y+150,10,10);
ellipse(x-210,y+110,15,15);
ellipse(x-190,y+140,10,10);
ellipse(x-195,y+160,8,8);
ellipse(x-170,y+170,5,5);
ellipse(x-225,y+130,20,20);

translate(100,100);

rect(x-50,y+30,20,20);
triangle(x-30,y+30,x,y+40,x-30,y+50);
triangle(x-30,y+50,x-40,y+80,x-50,y+50);
triangle(x-50,y+50,x-80,y+40,x-50,y+30);
triangle(x-50,y+30,x-40,y,x-30,y+30);
ellipse(x-80,y+80,5,5);
ellipse(x-85,y+90,8,8);
ellipse(x-95,y+75,10,10);
ellipse(x-105,y+95,20,20);
triangle(x-125,y+90,x-140,y+95,x-133,y+100);
triangle(x-140,y+110,x-120,y+120,x-130,y+140);
triangle(x-170,y+80,x-180,y+110,x-150,y+120);
quad(x-180,y+130,x-170,y+120,x-160,y+130,x-170,y+140);
rect(x-160,y+150,10,10);
ellipse(x-210,y+110,15,15);
ellipse(x-190,y+140,10,10);
ellipse(x-195,y+160,8,8);
ellipse(x-170,y+170,5,5);
ellipse(x-225,y+130,20,20);

translate(200,-200);
rect(x-50,y+30,20,20);
triangle(x-30,y+30,x,y+40,x-30,y+50);
triangle(x-30,y+50,x-40,y+80,x-50,y+50);
triangle(x-50,y+50,x-80,y+40,x-50,y+30);
triangle(x-50,y+30,x-40,y,x-30,y+30);
ellipse(x-80,y+80,5,5);
ellipse(x-85,y+90,8,8);
ellipse(x-95,y+75,10,10);
ellipse(x-105,y+95,20,20);
triangle(x-125,y+90,x-140,y+95,x-133,y+100);
triangle(x-140,y+110,x-120,y+120,x-130,y+140);
triangle(x-170,y+80,x-180,y+110,x-150,y+120);
quad(x-180,y+130,x-170,y+120,x-160,y+130,x-170,y+140);
rect(x-160,y+150,10,10);
ellipse(x-210,y+110,15,15);
ellipse(x-190,y+140,10,10);
ellipse(x-195,y+160,8,8);
ellipse(x-170,y+170,5,5);
ellipse(x-225,y+130,20,20);

translate(-150,-100);
rect(x-50,y+30,20,20);
triangle(x-30,y+30,x,y+40,x-30,y+50);
triangle(x-30,y+50,x-40,y+80,x-50,y+50);
triangle(x-50,y+50,x-80,y+40,x-50,y+30);
triangle(x-50,y+30,x-40,y,x-30,y+30);
ellipse(x-80,y+80,5,5);
ellipse(x-85,y+90,8,8);
ellipse(x-95,y+75,10,10);
ellipse(x-105,y+95,20,20);
triangle(x-125,y+90,x-140,y+95,x-133,y+100);
triangle(x-140,y+110,x-120,y+120,x-130,y+140);
triangle(x-170,y+80,x-180,y+110,x-150,y+120);
quad(x-180,y+130,x-170,y+120,x-160,y+130,x-170,y+140);
rect(x-160,y+150,10,10);
ellipse(x-210,y+110,15,15);
ellipse(x-190,y+140,10,10);
ellipse(x-195,y+160,8,8);
ellipse(x-170,y+170,5,5);
ellipse(x-225,y+130,20,20);
}









