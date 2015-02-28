
void setup ()
{ size (400,400);
background (255);
smooth ();
}

void draw ()
{ noFill();
//je fais une ellipse
strokeWeight (2);
ellipse (200,200,50,200);
//je fais d'autres ellipse concentriques
ellipse (200,200,100,200);
ellipse (200,200,150,200);
ellipse (200,200,200,200);
//je fais d'autres ellipses qui viendrons deformer le cercle
strokeWeight (1);
ellipse (200,200,225,200);
ellipse (200,200,250,200);
ellipse (200,200,275,200);
ellipse (200,200,300,200);
ellipse (200,200,325,200);
ellipse (200,200,350,200);
ellipse (200,200,375,200);





}

