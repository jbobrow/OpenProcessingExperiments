
void setup ()
{ size (400,400);
background (255);
smooth ();
println();
}

void draw ()
{ noFill();
//je fais une ellipse
strokeWeight (2);
ellipse (200,200,200,200);
//je fais des petites ellipses autour
strokeWeight (1);
ellipse(200,100,20,20);
ellipse(200,300,20,20);
ellipse(300,200,20,20);
ellipse(100,200,20,20);
//je fais des ellipses autour de ces petites ellipses
ellipse(200,100,20,40);
ellipse(200,300,20,40);
ellipse(300,200,40,20);
ellipse(100,200,40,20);
//je continue ce processus dans l'autre sens
ellipse(200,100,60,40);
ellipse(200,300,60,40);
ellipse(300,200,40,60);
ellipse(100,200,40,60);
//jessaye de faire la même chose en diagonale
ellipse(130,130,20,20);
ellipse(270,130,20,20);
ellipse(130,270,20,20);
ellipse(270,270,20,20);
//je fais des ellipses autour de ces petites ellipses
ellipse(130,130,30,30);
ellipse(270,130,30,30);
ellipse(130,270,30,30);
ellipse(270,270,30,30);
ellipse(130,130,40,40);
ellipse(270,130,40,40);
ellipse(130,270,40,40);
ellipse(270,270,40,40);
}

