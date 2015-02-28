
void setup()
{
size(500,500);
background(255);
 
}
 
void draw()
{
noStroke();
strokeWeight(6);
fill(#F282D2);
ellipse(270,270,200,200);

noStroke();
//1
fill(#0B119B);
translate(90,90);
rect(0,0,50,50);
//2
fill(11,17,155,200);
translate(30,30);
rect(0,0,50,50);

//3
fill(11,17,155,160);
translate(30,30);
rect(0,0,50,50);

//4
fill(11,17,155,70);
translate(30,30);
rect(0,0,50,50);
noLoop();
}


