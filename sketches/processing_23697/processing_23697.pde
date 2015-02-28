

void setup () {
size (500,500);
background (random (255), random (255), random (255));
smooth ();
}

void draw (){

fill (random (255), random (255), random (255));
ellipse (random (width), random (height), 150, 150);
fill (random (255), random (255), random (255));
ellipse (random (width), random (height), 70, 70);

}

