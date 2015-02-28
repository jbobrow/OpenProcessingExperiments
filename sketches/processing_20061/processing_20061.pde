
class Eye 
{
  int ex, ey;
  int size1;
  float angle = 0.0;

  float dotEyeX = 0, dotEyeY = 0;

  int radiusR = 100;
  //lerp outer ring
  float lerp_radiusR = 0.0;
  color oRR_Color;
  color oLR_Color;
  //color dotColor = color(255, 255, 255);
  float greenDotC = 255;
  float blueDotC = 255;
  float redDotC = 255;

  //polar to cartesian
  float xV = 0;
  float yV = 0;

  //springy eyes and dot
  //orignally as global but causes only one eye to work at a time
  //depending on which eye gets to end state fastest (i.e. which distance is closer)
  boolean spring_eyes = false;

  private float sp_x, sp_y; //lense
  private float sp_x2, sp_y2; //white dot 
  private float sp_tempX;
  private float sp_tempY;

  private float sp2_tempX;
  private float sp2_tempY;


  char whichEye; 
  color from = color(63, 196, 177, 200);
  color to = color(175, 18, 18, 200);
  color interA = lerpColor(from, to, .33);
  color interB = lerpColor(from, to, .66);
  color interC = lerpColor(from, to, .80);

  color[] colorArray = new color[7];

  float mapColorR, mapColorG, mapColorB;

  //distance from left lense aperture to mouse position
  float ldist = 0.0;

  boolean fadeback = false;

  //EYE EXTENSION
  EyeExtension e_E;


  ///////////////

  Eye(int x, int y, int s, char eyeLR) {


    e_E = new EyeExtension(true);

    colorArray[6] = color(63, 196-60, 177-10, 200);
    colorArray[5] = color(63, 196-50, 177-10, 200);
    colorArray[4] = color(63, 196-40, 177-10, 200);
    colorArray[3] = color(63, 196-30, 177-10, 200);
    colorArray[2] = color(63, 196-20, 177-10, 200);
    colorArray[1] = color(63, 196, 177-10, 200);
    colorArray[0] = color(63, 196, 177, 200);

    whichEye = eyeLR;

    ex = x; 
    ey = y;

    sp_x2 = ex;
    sp_y2 = ey;

    size1 = s+120;
  }

  void update(int mx, int my) {

    angle = atan2(my-ey, mx-ex);

    ldist = dist(ex+xV, ey+yV, mX, mY);

    mapColorR = map(mX, 0, 640, 0, 50);
    mapColorG = map(mY, 0, 480, 0, 225);
    mapColorB = map(mX, 0, 640, 0, 255);

    radiusR = int(abs((mYS + mXS)/3)) + 100;

    lerp_radiusR = abs(((mYS + mXS)/2))/60;

    oRR_Color = lerpColor(from, to, lerp_radiusR);
    oLR_Color = lerpColor(to, from, lerp_radiusR);

    dotEyeX = map(mouseX, 0, 640, -12, 12);
    dotEyeY = map(mouseY, 0, 480, -12, 12);
    //println(lerp_radiusR);
  }

  void display() {

    //rotate(angle);
    //we are using polar to cartesian system instead of atan2 directly

      pushMatrix();
    translate(ex, ey);

    pushStyle();

    //LEFT EYE
    if (whichEye == 'l') {
      for (int i = 0; ++i < 5;) {


        if (ldist < 50) {
          fill(colorArray[i]);
        } 
        if (ldist >= 50 && ldist < 100) {
          //fill(mouseX, mouseY, mouseX, 50);
          fill(colorArray[i]);
        }
        if (ldist >= 100 && ldist < 200) {
          fill(colorArray[4-i]);
        }
        if (ldist >= 200) {
          fill(colorArray[6-i]);
        }

        ellipse(i*10-20, -2, size1-i*20, size1-i*20);
      }

      fill(oLR_Color);
      //outer ring left eye
      for (int i = 0; i < 360; i+=10) {
        float x2 = radiusR * cos(radians(i));
        float y2 = radiusR * sin(radians(i));

        ellipse(x2-10, y2, 10, 10);
      }
    } 

    popStyle();

    pushStyle();
    //RIGHT EYE
    if (whichEye == 'r') {

      for (int i = 0; --i > -5;) {
        //fill(225, 200, 100, mY);
        fill(mapColorR, mapColorG, mapColorB, 50);
        ellipse(i*10+20, -2, size1+i*20, size1+i*20);
      }

      //outer ring
      fill(oRR_Color);
      for (int i = 0; i < 360; i+=10) {
        float x2 = radiusR * cos(radians(i));
        float y2 = radiusR * sin(radians(i));

        ellipse(x2+10, y2, 10, 10);
      }
    }
    popStyle();

    popMatrix();

    //CAMERA LENSES & WHITE DOT
    pushMatrix();
    pushStyle();

    fill(redDotC, greenDotC, blueDotC);

    if (gazeMethod) {
      xV = 5 * cos((angle));
      yV = 5 * sin((angle));
    } 
    else {
      //method 2 using the map function
      xV = dotEyeX;
      yV = dotEyeY;
    }

    //ellipse(size1/4, 0, size1/2, size1/2);
    //translate(ex+xV, ey+yV);

    if (this.spring_eyes == false && fadeback == false) {

      sp_x = ex+xV;
      sp_y = ey+yV;

      //sp_tempX += (sp_x-sp_tempX) * 0.02;
      //sp_tempY += (sp_y-sp_tempY) * 0.02;

      image(camEyeLeft, ex+xV, ey+yV);
      //image(camEyeLeft, sp_tempX, sp_tempY);

      sp_x2 = ex + dotEyeX;
      sp_y2 = ey + dotEyeY;

      ellipse(2 + sp_x2+dotEyeX, sp_y2+dotEyeY, 10, 10);
    }
    if (this.spring_eyes) {

      greenDotC = greenDotC - 2;
      redDotC = redDotC - 10;

      sp_x += (mX-sp_x) * 0.02;
      sp_y += (mY-sp_y) * 0.02;

      //for white dot
      sp_x2 += (mX-sp_x2) * 0.02;
      sp_y2 += (mY-sp_y2) * 0.02;

      e_E.display(ex, ey, sp_x, sp_y); //eye extension
      image(camEyeLeft, sp_x, sp_y);
      println(whichEye);

      //greater than the ratio of the distance for each eye to mouse pos
      //use instead of hard number like 100 so that retraction is identical for both eyes. 
      if (abs(dist(ex+xV, ey+yV, sp_x, sp_y)) > abs(dist(ex+xV, ey+yV, mX, mY))*0.6) {

        sp_tempX = sp_x;
        sp_tempY = sp_y;

        sp2_tempX = sp_x2 + dotEyeX;
        sp2_tempY = sp_y2 + dotEyeY;

        spring_eyes = false;
        fadeback = true;
      }


      ellipse(2 + sp_x2+dotEyeX, sp_y2+dotEyeY, 10, 10);
    } 

    if (this.spring_eyes == false && fadeback == true) {

      //rough and dirty fade back
      greenDotC = greenDotC + 2;
      redDotC = redDotC + 10;

      sp_x = ex+xV;
      sp_y = ey+yV;

      sp_x2 = ex+ dotEyeX *2 ;
      sp_y2 = ey + dotEyeY * 2;

      sp_tempX += (sp_x-sp_tempX) * 0.02;
      sp_tempY += (sp_y-sp_tempY) * 0.02;

      sp2_tempX += (sp_x2-sp2_tempX) * 0.02;
      sp2_tempY += (sp_y2-sp2_tempY) * 0.02;


      e_E.display(ex, ey, sp_tempX, sp_tempY);
      e_E.orbitEye(ex, ey);
      image(camEyeLeft, sp_tempX, sp_tempY);
      ellipse(2 + sp2_tempX, sp2_tempY, 10, 10);


      if (abs(dist(sp_tempX, sp_tempY, sp_x, sp_y)) < 5) {

        fadeback = false;
        greenDotC = 255;
        redDotC = 255;
        //spring_eyes = false;
      }
    }

    popStyle();
    popMatrix();
  }
}


