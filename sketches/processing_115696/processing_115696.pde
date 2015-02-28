
void setup () {
  size (1300, 600);
  smooth ();
  noLoop();
  noStroke();
  
}

void draw () {
  background (random(255),random(255),random(255));

  //---------------------- RULES

  float r = random(255);
  float g = random(255);
  float b = random(255);

  float r2= r+30;
  float g2= g+30;
  float b2= b+30;
  for (int x=0; x<width+100; x+=120) {

    float y;
    y=height/2;

    int n = 2;
    float d = random (0, n+1);

//--------boba
    pushMatrix();
    translate(x, random(y, y+20));

    stroke (r, g, b);

    boba ();
    boba ();
    boba ();
    boba ();
    fill(r, g, b);

    noStroke();
    popMatrix();

    //---------------------- bobacup
  }

}

  void boba () {
    //straw
    fill(245, 242, 237, 175);
    rect(95+55, 20+60, 10, 150);
    fill(255, 0, 0);
    rect(100+55, 20+60, 3, 150);
    //cup
    fill(245, 242, 237, 175);
    quad(105, 115, 105+100, 115, 195, 115+150, 115, 115+150);
    fill(95, 178, 52);
    rect(100, 115, 110, 5);

    //drink
    fill(random(255), random(255),random(255), 175);
    noStroke();
    quad(107, 140, 103+100, 140, 195, 140+125, 115, 140+125);

    //tapioca
    fill(0,random(255));
    int x = 1;
    while (x<=50)
    {
      ellipse(int(random(117, 193)), int(random(210, 260)), 9, 9);
      x=x+1;
   

  }
  }



//---------------------- REDRAW
void mousePressed () {
  redraw();
}



