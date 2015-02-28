
void setup () {
  size (800,800, P3D);
  background (255);
  
}

void draw (){
 


noStroke ();
fill (250,50,50,0);
ellipse ( 400,400, mouseX, mouseY);
noStroke ();



smooth ();
fill (random (30,255), 60);
arc (random (800), random (800),random (50), random (50), random (120), random (129));
}

