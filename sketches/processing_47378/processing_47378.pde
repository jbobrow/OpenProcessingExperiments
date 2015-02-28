

void setup() 
{
  size(500, 500); 
  noStroke();
  rectMode(CENTER);
}

void draw () {
  
  background (255);


smooth ();
stroke (0);
strokeWeight (2);
line ( 250, 250, 300, 120);


smooth ();
stroke (0);
strokeWeight (5);
line ( 250, 250, 200, 120);

noStroke ();

fill ( 90, 60, 90, 90);
smooth ();
ellipse ( 250, 250, 200, 200);

fill ( 90, 60, 90, 50);
smooth ();
ellipse ( 200, 250, 100, 100);

fill ( 90, 60, 90, 50);
smooth ();
ellipse ( 300, 250, 100, 100);

fill (255);
smooth ();
stroke (0);
strokeWeight (2);
ellipse ( 200, 250, 50, 50);

fill (255);
smooth ();
stroke (0);
ellipse ( 300, 250, 50, 50);

noStroke ();
fill (0);
smooth ();
ellipse (mouseX, height/2, mouseY/-30, mouseY/-30);

fill (0);
smooth ();
ellipse (mouseX, height/2, mouseY/-30, mouseY/-30);

int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  ellipse (inverseX, height/2, (inverseY/2)-30, (inverseY/2)-30);

stroke (0);
fill (255, 218, 3);
smooth ();
ellipse ( 250, 290, 30, 70);

noStroke ();
fill ( 90, 60, 90, 70);
smooth ();
ellipse ( 250, 600, 200, 500);

fill ( 90, 60, 90, 98);
smooth ();
stroke (0);
ellipse ( 180, 450, 70, 150);

fill ( 90, 60, 90, 98);
smooth ();
stroke (0);
ellipse ( 320, 450, 70, 150);

fill (255, 218, 3);
smooth ();
ellipse ( 230, 490, 30, 10);

fill (255, 218, 3);
smooth ();
ellipse ( 270, 490, 30, 10);

noStroke ();
fill (0);
smooth ();
ellipse ( 250, 470, 5, 5);

stroke (0);
strokeWeight (50);
noFill ();
smooth ();
ellipse ( 250, 250, 600, 600);

}










