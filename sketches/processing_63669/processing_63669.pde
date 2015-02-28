
//Particle class 
class Form {

  //Set up variables

  int w, h;
  float x, y, z, space;
  float aX, aY, aZ;
  float ff, fam;
  float aaX, aaY, anamX, anamY;
  float xoff = 0.0;

  Form( float nX, float nY, float nZ, float nAmX, float nAmY, float nAmZ,
  float nFf, float nFam, float nAnX, float nAnY, float nAnamX, float nAnamY) {

    //variables galore!!

    x = nX;
    y = nY;
    z = nZ;
    aX = nAmX;
    aY = nAmY;
    aZ = nAmZ;
    ff = nFf;
    fam = nFam;
    aaX = nAnX;
    aaY = nAnY;
    anamX = nAnamX;
    anamY = nAnamY;
    w = width;
    h = height;
  }

  void update() 
  {


    if (ff < 0) 
    {
      x = mX;
      y = 0;
      z = 0;
      aX = random(-0.2, 0.2);
      aY = random(-0.2, 0.2);
      aZ = random(-0.2, 0.2);
      ff = random(1, 30);
      fam = random(-1, -0.01);
    }
    x = x + aX;
    y = y + aY;
    z = z + aZ;
    ff = ff + fam;
    aaX = aaX + anamX;
    aaY = aaY + anamY;
  }

  void display() {

    //by putting rotate functions in the display I have greater control over the whole form's 
    //movement
    rotateX(radians(aaX));
    rotateY(radians(aaY));
    stroke(0, 200);
    strokeWeight(random(0.5, 2));
    line(x, y, x+y, -z);


    if(mousePressed == true) {
      for(int i = 0; i < num; i++) {
        if(mousePressed == true) {
          aaX = mouseX/TWO_PI;
          aaY = mouseY/TWO_PI;
        }

        else if(mouseX > 100  == false) {
          aaX = mouseX / HALF_PI;
          aaY = mouseY /HALF_PI;
        }
      }
      frameRate(30);
    }
  }
}


