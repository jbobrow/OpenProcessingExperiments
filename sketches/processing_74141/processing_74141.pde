
//Alvin Ha, Computer Programming 4-5, Mr Simon
//Rotating Cube

float x = 0.01;
float y = 0.01;
float z = 10;
float r = 10;
float s = 10;
float p = 50;
float q = 40;
float l = 30;

void setup()
{
  size(600, 600, P3D);
  smooth();
  strokeWeight(5);
}

void draw()
{
  background(0);
  fill(255);
  translate(300, 300, 0);

  if (mousePressed != true)
  {
    fill(180, 8, 255); 
    rotateX(x);
    rotateY(y);
    box(50);
    translate(50, 0, 0);
    box(50);
    translate(-50, -50, 0);
    box(50);
    translate(-50, 50, 0);
    box(50);


    fill(75, 247, 255);
    translate(50, 0, 0);
    rotateX(-x);
    rotateY(-y);
    translate(150, 150, 0);
    box(50);
    translate(50, 0, 0);
    box(50);
    translate(50, 0, 0);
    box(50);
    translate(50, 0, 0);
    box(50);


    fill(0, 0, 255);
    translate(-300, -150, 0);
    translate(-100, -100, -100);
    rotateX(x);
    rotateY(y);
    box(50);
    translate(-50, 0, 0);
    box(50);
    translate(0, 50, 0);
    box(50);
    translate(0, 50, 0);
    box(50);

    fill(255, 0, 0);
    rotateX(-x);
    rotateY(-y);
    translate(150, 0, 100);
    translate(100, 100, 200);
    box(50);
    translate(50, 0, 0);
    box(50);
    translate(0, 50, 0);
    box(50);
    translate(50, 0, 0);
    box(50);

    fill(233, 255, 0);
    rotateX(x);
    rotateY(y);
    translate(-200, -150, -200);
    translate(-100, -100, -250);
    box(50);
    translate(50, 0, 0);
    box(50);
    translate(0, 50, 0);
    box(50);
    translate(-50, 0, 0);
    box(50);

    rotateX(-x);
    rotateY(-y);
    fill(0, 255, 0);
    translate(100, 50, 250);
    translate(-200, 100, 200);
    box(50);
    translate(50, 0, 0);
    box(50);
    translate(0, 50, 0);
    box(50);
    translate(50, 0, 0);
    box(50);

    fill(255, 153, 0);
    rotateX(x);
    rotateY(y);
    translate(100, -150, -300);
    translate(-100, -250, 0);
    box(50);
    translate(-50, 0, 0);
    box(50);
    translate(0, 50, 0);
    box(50);
    translate(0, 50, 0);
    box(50);  
  }
  
  if (mousePressed == true)
  {
    fill(180, 8, 255); 
    box(50);
    translate(50, 0, 0);
    box(50);
    translate(-50, -50, 0);
    box(50);
    translate(-50, 50, 0);
    box(50);
  }


  x = x + 0.01;
  y = y + 0.01;
  z = z - 0.01;
  r = r - 0.01;
  s = s - 0.01;
  p = p - 0.01;
  q = q + 0.01;
  l = l + 0.01;
}
