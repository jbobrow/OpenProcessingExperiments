
void setup () {
size (500,500);
background (random (255), random (255), random (255));
smooth ();
}

void draw (){

  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,70,70);
  
fill (random (255), random (255), random (255));

}


