
void setup ()
{ size (400,400);
background (5);
println();
float d = degrees(PI/4); // transforme des radians en degrés
smooth ();

}

void draw ()
{ noStroke();
fill(#050505);
//je fais une ellipse
ellipse (200,200,200,200);
//je fais des petites ellipses autour
noFill();
strokeWeight(2);
stroke(#050505);
translate(width/2, height/2); for (int i=0;i<360;i+=10){
rotate(radians(10));
ellipse(70,70,20,20);
//autres cercles blancs
stroke(255);
rotate(radians(10));
ellipse(60,60,20,20);
ellipse(50,50,15,15);
ellipse(40,40,10,10);
ellipse(30,30,5,5);

}
}

