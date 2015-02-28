
void setup()
{
size( 480,480 );
background( 0 );
stroke( 255,40,20 );
}

void draw()
{
  


if (mousePressed) {
translate(mouseX,mouseY);
rotate(random(PI));

strokeWeight (8);
stroke (193,197,192,70);
point(1,4);

stroke (17,128,180,60);
point (10,6);

strokeWeight (5);
stroke(0 ,62 ,72,30);
point (9,15);

strokeWeight (4);
stroke(215 ,214 ,202,50);
point (-10,- 6);

strokeWeight(10);
stroke(130 ,156 ,120, 20);
point (-20,-30);


strokeWeight (3);
stroke(193,197,192,80);
point (10,20);

 strokeWeight(5);
 stroke (228 ,219 ,197,80);
 point(20,15);


}
}
void keyReleased()
{
if (key=='c' || key=='C') {
background(0);
}
}
