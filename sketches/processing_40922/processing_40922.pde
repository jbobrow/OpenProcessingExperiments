
//homework 9
//copyright Jessica Schafer, Oct. 2011

color col1, col2, col3, col4;
int i, z;

void setup ()
{
  size (400, 400, P3D);
  //background (255);
  //noStroke();
  z = -80;
  i = 1;
  col1 = color (186, 220, 221); //light blue
  col2 = color (84, 123, 151); // medium blue
  col3 = color (33, 43, 64); //navy
  col4 = color (163, 109, 92); //dusty rose

}


void draw ()
{
  setScreen();
  drawSpheres();
  drawBox();
  draw2D();
}

void draw2D()
{
 fill (col2);
 //ellipseMode (CORNER);
 ellipse (-width/4,0, 100, 200); 
 pushMatrix();
   fill (col3);
   textAlign(CENTER);
   translate(0, 150);
   textSize(14);
   text ("Press a key or move the mouse\naround to noodle.", 0, 0);
 popMatrix();
  
}

void drawBox()
{
  pushMatrix();
    translate (-width/4, -height/4, 0);
    fill (col1);
    box (75); 
  popMatrix();
  
}

void keyReleased()
{
  z = -50;
  i = i*-1; 
}

void drawSpheres()
{
  pushMatrix();
    fill (col2);
    rotateY(PI*mouseX/width);
    sphere(100);
  popMatrix();
  
  pushMatrix();
    noStroke();
    fill(col4);
    translate (100, -200, i*z);
    sphere(25);
    stroke(0);
  popMatrix();
  z++;
}


void setScreen()
{
  background (255);
  translate (width/2, height/2, 0);
  //lights();
  pointLight(255, 255, 255, -width/2, 0, 200);
}

