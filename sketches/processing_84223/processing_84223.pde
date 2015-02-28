
void setup()
{
size(500,500);
smooth();

}

void draw()
{

 background(0);
 noFill();
 stroke(255);
strokeWeight(0.5);

rotate(random(PI/360));
scale(random(0,1));
triangle(20,20,30,50,60,90);
triangle(20,30,50,20,30,90);
triangle(40,30,50,20,30,90);
triangle(120,130,150,120,130,190);
triangle(220,320,150,220,320,190);
triangle(320,420,250,320,420,290);
triangle(420,500,350,420,500,390);


stroke(random(0,320),random(0,320),random(0,320));
ellipse(250,250,250,250);
ellipse(500,500,500,500);

}
