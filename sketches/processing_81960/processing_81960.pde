
void setup ()
{ size (400,400);
background (255);
println();
float d = degrees(PI/4); // transforme des radians en degrés
smooth ();

}

void draw ()
{ noFill();
//je fais une ellipse
strokeWeight (2);
ellipse (200,200,200,200);
//je fais des petites ellipses autour
strokeWeight (1);
translate(width/2, height/2); for (int i=0;i<360;i+=10){
rotate(radians(20));
ellipse(100,100,20,20);
rotate(radians(10));
ellipse(70,70,20,20);
ellipse(70,70,30,20);
ellipse(70,70,40,20);
ellipse(70,70,50,20);
//autre sens
ellipse(70,70,20,30);
ellipse(70,70,20,40);
ellipse(70,70,20,50);
ellipse(70,70,20,60);
}

}

