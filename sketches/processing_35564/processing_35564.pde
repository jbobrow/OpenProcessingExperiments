
void setup () {
  size (300, 300);
  smooth ();
}


int x = 0;


void draw () {
  background (x);
  
  //room
  
  strokeWeight (1);
  rectMode(CENTER);
  fill (x);
  rect (150, 150, 150, 150);
  //Psychedelic light
  fill (mouseY,mouseX,100);
  rect (150, 150, 100, 100); 
  
  //Side walls
  fill(x);
  float A = width/4;
  float B = height/4;
  quad (0, 0, A, B, A, 3*B, 0, height);
  quad (width, 0, 3*A, B, 3*A, 3*B, width, height);

  //Human figure 1
  fill (0);
  ellipseMode (CENTER);
  ellipse (200-x, 163, 15, 16);
  ellipse (200-x, 200, 19, 60);
  ellipse (192-x, 175, 7, 7);
  ellipse (208-x, 175, 7, 7);
  ellipse (195-x, 240, 7, 30);
  ellipse (195-x, 265, 7, 23);
  ellipse (205-x, 240, 7, 30);
  ellipse (205-x, 265, 7, 23);  
  
  //Human figure 2
  ellipse (100+x, 163, 15, 16);
  ellipse (100+x, 200, 19, 60);
  ellipse (92+x, 175, 7, 7);
  ellipse (108+x, 175, 7, 7);
  ellipse (95+x, 240, 7, 30);
  ellipse (95+x, 265, 7, 23);
  ellipse (105+x, 240, 7, 30);
  ellipse (105+x, 265, 7, 23);  

  //Arms
  strokeWeight (4);  
  //H1
  line (192-x, 175, mouseX, mouseY);
  line (208-x, 175, mouseY, mouseX);
  //H2
  line (92+x, 175, mouseX, mouseY);
  line (108+x, 175, mouseY, mouseX);
  x++;

}










