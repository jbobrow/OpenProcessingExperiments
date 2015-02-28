
void setup() {
  size(200, 200);
  background(255);
  frameRate (5);
}

int x= 100;
int y= 25;
int dtelhax= 10;  // lado direito telhado
int dtelhay= 6;
int ptx= 10;
int pty= 9;

int xpassaro = -5;

void draw() {

  background (255);

  noStroke ();
  fill (255, 185, 15);
  ellipse (10, xpassaro, 20, 20); 

  stroke (165, 42, 42);
  strokeWeight (4);
  for (int i=0; i<9; i++)
  {
    line (x, y, x+dtelhax, y+dtelhay);
    x+=ptx;
    y+=pty;
  }

  x= 90; 
  y= 58;

  dtelhax= 10;  // lado esquerdo telhado
  dtelhay= -6;
  ptx= -10;
  pty= 9;

  for (int i=0; i<9; i++)
  {
    line (x, y, x+dtelhax, y+dtelhay);
    x+=ptx;
    y+=pty;
  }
  stroke (0, 0, 0); 
  strokeWeight (1);
  line (180, 100, 180, 200);
  line (20, 120, 20, 200);
  line (100, 25, 100, 55);  // paredes

  strokeWeight (3);
  stroke (139, 69, 19);
  fill (209, 238, 238);
  rect (25, 130, 15, 60);
  rect (110, 140, 60, 30); // janelas
  rect (60, 130, 20, 20);
  line (100, 48, 100, 35);



  stroke(0);
  line(xpassaro, 5, xpassaro+5, 10);
  line(xpassaro, 15, xpassaro+10, 5); //passaro
  xpassaro+=2 ;

  x= 100;
  y= 25;
  dtelhax= 10;  // lado direito telhado
  dtelhay= 6;
  ptx= 10;
  pty= 9;
}
