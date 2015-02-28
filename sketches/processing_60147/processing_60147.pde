
class Polygon {

  int n,i ;
  float cx, cy;
  float w, h;
  float startAngle;

  Polygon ()
  {
    n = 8; //number of sides
    cx = centrePos+50;
    cy = centrePos+50;
    w = width;
    h = height;
    startAngle = 1.0;
  }

  Polygon(int n_, float cx_, float cy_, float w_, float h_, float startAngle_) 
  {

    n = n_;
    cx = cx_;
    cy = cy_;
    w = w_ / 2.0;
    h = h_ /2.0;
    startAngle = startAngle_;
  }

  void render() 
  {
    stroke(random(0.2, 2.0));
    polyShape(n, cx/8, cy/8, w*cx/4, h*cy/4);
  }

  void polyShape(int n_, float cx_, float cy_, float a_, float startAngle_) 
  {


    strokeWeight(n_*random(0.025, 1));
    noFill();

    beginShape();

    float a = a_;

    float angle = TWO_PI / n; //radius divided by number of sides
    a = random(-PI, PI)+a_;
    float cxi = cos(a)*startAngle_ + cx_;
    float cyi = sin(a)*startAngle_ + cy_;

    line(cx_, cy_,cxi, cyi);

    stroke(random(255), 130, 150, 195);
    fill(0, 16);


    if(startAngle_ > cxi*cyi) {
      rotate(TWO_PI*i);
      polyShape(n_,cxi, cyi, a_ *cos(startAngle + angle), cy + h * sin(startAngle + angle));
    }

    endShape(CLOSE);
  }
}


