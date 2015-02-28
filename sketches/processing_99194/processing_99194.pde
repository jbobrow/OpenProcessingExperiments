
void setup ()
{
 size(300,400);
 background(255,255,250);
 smooth();
 frameRate(3);
 textSize(20);
}

void draw()
{
stroke(0);
line(0,85,300,85);

stroke(30,50,100);
fill(150);
rect(90,100,20,100);

stroke(30,50,100);
fill(0);
rect(101,202,29,8);
rect(70,202,29,8);

fill(255);
ellipse(100,70,60,60); 

fill(0);
ellipse(100,93,10,10);


fill(0); 
ellipse(90,70,10,15); 
ellipse(110,70,10,15);

stroke(0,0,0);
line(90,100,80,160);
line(110,100,120,160);

fill(255,0,0);
stroke(0);
triangle(85,95,85,115,100,105);
triangle(115,95,115,115,100,105);

fill(0);
quad(102,107,102,103,98,107,98,103);

stroke(255,255,255);
fill(255,255,255);
ellipse(90,73,6,6);
ellipse(110,73,6,6);

fill(0);
ellipse(92,74,5,4);
ellipse(112,74,5,4);

fill( random(255), random(255), random(255), 255 );
ellipse( random(width), random(height), 10, 10);

fill(0);
textAlign(CENTER);

text("PAINTBALL ATTACK.",width/2,300);
}
