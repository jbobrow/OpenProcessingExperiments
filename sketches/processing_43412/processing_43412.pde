
//Now too much just like the lines example
//just pretend I guess
//I wanted this to do womething with first seeking out
//the brightest pixels then making the fireworks but
//yeah, not so much...

PImage _pow;
int pw;
int ph;

void setup(){
  _pow = loadImage("fireworks.jpg");
  _pow.loadPixels();
  pw = _pow.width;
  ph = _pow.height;
  size (pw, ph);
  println(pw + " " + ph);
  background (255);

}

void draw(){

  ellipseMode(CENTER);

  float brightestWeHaveSeen = 0;
  int brightestX = 0;
  int brightestY = 0;

  for (int y=0; y<ph; y++){
    for(int x=0; x<pw; x++){

      color c = getColorAtXYFromImage(x, y, _pow);
      float bri = (red(c) + green(c) + blue(c))/3.0;

      if (bri > brightestWeHaveSeen){
        brightestWeHaveSeen = bri;
        brightestX = x;
        brightestY = y;
      }
    }
  }

  //image(pow,0,0);
  for (int i=0;i<50;i++){
    int rx1 = (int)random(pw-1);
    int ry1 = (int)random(ph-1);
    color c1 = _pow.pixels[ry1*pw+rx1];

    int rx2 = 297;
    int ry2 = 214;
    //int rx2 = (int)max (random,10)(pw-1);
    //int ry2 = (int)max (random,10)(ph-1);
    color c2 = _pow.pixels[ry2*pw+rx2];

    //int rx3prep = (int)random(pw-1);
    //int ry3prep = (int)random(ph-1);
    //int rx3 = constrain(rx3prep, 1,10);
    //int ry3 = constrain(ry3prep, 1,10);
    //color c3 = pow.pixels[ry3*pw+rx2];
    int rx3 = 159;
    int ry3 = 313;
    color c3 = _pow.pixels[ry3*pw+rx3];

    int rx5prep = (int)random(pw-1);
    int ry5prep = (int)random(ph-1);
    int rx5 = constrain(rx5prep, 82,324);
    int ry5 = constrain(ry5prep, 211,442);
    color c5 = _pow.pixels[ry5*pw+rx5];

    int rx4 = 149;
    int ry4 = 486;
    color c4 = _pow.pixels[ry4*pw+rx4];

    beginShape(LINES);
    strokeWeight (5);
    stroke (red(c3), green(c3), blue(c3));
    vertex (rx3, ry3);
    stroke (red(c5), green(c5), blue(c5));
    vertex (rx5, ry5);
    strokeWeight (1);
    stroke (red(c2), green(c2), blue(c2));
    vertex (rx2, ry2);
    stroke (red(c1), green(c1), blue(c1));
    vertex (rx1, ry1);
    stroke (red(c4), green(c4), blue(c4));
    vertex (rx4, ry4);
    stroke (red(c1), green(c1), blue(c1));
    vertex (rx1, ry1);

    //stroke (red(c3), green(c3), blue(c3));
    //vertex (rx3, ry3);
    endShape();
  }
}

color getColorAtXYFromImage(int x, int y, PImage img){
  int maxloc= img.width*img.height;
  int loc = (y * img.width) + x;
  if (loc < maxloc){
    return img.pixels[loc];
  } else {
    return 0;
  }
}

