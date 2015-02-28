
void setup()
{
size (600,600);
background (255,0,255);
}
void draw ()
{
//the begining
scale (4);
fill (random (0,255),random (0,255),random (0,255));
text ("HAPPY MOTHERS DAY",10,20);
scale (1);
fill (0);
text ("click and see what happens",1,130);

//smiley face
if (mousePressed) {
strokeWeight (1);
fill (255,0,255);
//reset
rect (0,0,600,600);
//face
ellipse (70,70,100,100);
//eyes
rect (40,40,10,30);
rect (80,40,10,30);
fill(0);
rect (45,40,5,15);
rect (85,40,5,15);
//smile
fill (255,0,255);
arc (65,80,20,10,0,3.14);
//change this to your personal message
fill (0);
text ("luv u mom ;)",10,145);

} 
}
