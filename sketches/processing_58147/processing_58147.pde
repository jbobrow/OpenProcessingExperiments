

class Ball {
  
  // centre
  float x; float y;
  
  // radius
  float r;
  
  float colour;
  
  Ball(float newx, float newy, float newr, float newcolour) {
    x=newx; y=newy; r = newr;
    colour = newcolour;
  }
  
  void draw() {
    stroke(255*colour*colour,200*colour*colour,155*colour, 255*colour);
    fill(255*colour*colour,100*colour*colour,255*colour, 255*colour);
    colour = colour*0.995;
    ellipse((int)x,(int)y,(int)r,(int)r);
     x = x*SCALING; y=y*SCALING; r=r*SCALING;
  }
}

