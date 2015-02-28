
void setup ()
{size (500,500);}

void draw()
{ background(0);

stroke(250);
strokeWeight(3);
fill(250,90);
triangle(150, 200, 250, 48, 350, 200);
translate(125,200);
scale(0.5);
triangle(150, 200, 250, 48, 350, 200);
scale(2);
translate(375,150);
rotate(radians(180));
triangle(150, 200, 250, 48, 350, 200);

translate(500,-80);
rotate(radians(90));
stroke(250);
strokeWeight(2);
fill(250,80);
triangle(50, 150, 50, 48, 150, 150);
translate(50,200);
rotate(radians(270));
triangle(50, 150, 50, 48, 150, 150);
translate(-50,-50);
stroke(250);
strokeWeight(2);
fill(250,80);
translate(-50,200);
rotate(radians(270));
triangle(50, 150, 50, 48, 150, 150);
translate(-50,200);
rotate(radians(270));
triangle(50, 150, 50, 48, 150, 150);

translate(400,0.5);
rotate(radians(90));
stroke(250);
strokeWeight(2);
fill(250,80);
triangle(50, 150, 50, 48, 150, 150);
translate(50,200);
rotate(radians(270));
triangle(50, 150, 50, 48, 150, 150);
translate(-50,-50);
stroke(250);
strokeWeight(2);
fill(250,80);
translate(-50,200);
rotate(radians(270));
triangle(50, 150, 50, 48, 150, 150);
translate(-50,200);
rotate(radians(270));
triangle(50, 150, 50, 48, 150, 150);
}


