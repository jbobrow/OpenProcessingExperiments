
class Shape{ 
  float xoff = 0.3;
  float xincrement = 0.01; 
  float yoff= 0.6;
  float yincrement = 0.01;
  float nx, ny;
  float colornoise;

  Shape (float xoff_, float yoff_){
    xoff=xoff_;
    yoff=yoff_;
  }

  void update()
  {
    // Get a noise value based on xoff and scale it according to the window's width
    nx = noise(xoff)*width;
    ny = noise(yoff)*height;
    colornoise= noise(xoff)*255;
    // With each cycle, increment xoff
    xoff += xincrement;
    yoff += yincrement;
    fill(colornoise,255,255);
    ellipse(nx,ny,16,16);
  }
}

class Square extends Shape{


  Square(float xoff_, float yoff_){
    super(xoff_, yoff_);

  }

  void update(){
    nx = noise(xoff)*width;
    ny = noise(yoff)*height;

    // With each cycle, increment xoff
    xoff += xincrement;
    yoff += yincrement;
    colornoise= 150-noise(xoff)*255;
    fill(colornoise,255,255);
    rect(nx, ny, 55, 55);

  }
}






class Triangle extends Shape{
  Triangle(float xoff_, float yoff_){
    super(xoff_, yoff_);
  }
  void update(){
    nx = noise(xoff)*width;
    ny = noise(yoff)*height;

    // With each cycle, increment xoff
    xoff += xincrement;
    yoff += yincrement;
    colornoise= 255-noise(xoff)*255;

    fill(colornoise,255,255);
    triangle(30+nx, 75+ny, 58+nx, 20+ny, 86+nx, 75+ny);
  }
  /* void avoid(){
   if (Square.nx==Triangle.nx){
   fill(243,60,255);
   ellipse(nx,ny,5,5);
   }*/
}






