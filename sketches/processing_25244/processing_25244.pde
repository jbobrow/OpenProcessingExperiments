
/* TRANSFORMATION FROM TETRAHEDRON TO HIGHER SOLID POLYGONS
BY KADAMBARI SAHU
 please move mouse and or keyboard keys UP, DOWN, RIGHT, LEFT to fully view the capacity 
 of the code*/


//GLOBAL VARIABLES
float i=-1000;
float c;
float rotX = 0;
float rotY = 0;
PImage bg;

void setup()
{
  size(1023, 768, P3D);
  bg = loadImage("fab1.jpg");
}

void draw()
{

  background(bg);
  lights();
  rotateX(rotX);
  rotateY(rotY);
  translate(width/2,height/2,-1000);
  int k=2;
  for(i=-100;i<=100;i=i+10) {


    c=map(i,0,100,0,255);

    rotateZ((PI)/8);
    stroke(255, 50);
    rotateX(mouseX/100.);
    rotateY(mouseY/100.);
    fill(i * 2, 0, 160,100);
    sphereDetail(k);
    sphere(80);
    translate(0,200,30);
    k=k+1;
  }
}
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP)
      rotX += 0.05;
    else if (keyCode == DOWN)
      rotX -= 0.05;
    else if (keyCode == LEFT)
      rotY -= 0.05;

    else if (keyCode == RIGHT)
      rotY += 0.05;
  }
}


