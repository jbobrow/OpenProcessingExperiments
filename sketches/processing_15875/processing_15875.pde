
class Polygon{
  float x1, y1, x2, y2, x3, y3, r, g, b, a;

Polygon(float x1_, float y1_, float x2_, float y2_, float x3_, float y3_, float r_, float g_, float b_, float a_){
  x1=x1_;
  y1=y1_;
  x2=x2_;
  y2=y2_;
  x3=x3_;
  y3=y3_;
  r=r_;
  g=g_;
  b=b_;
  a=a_;
}

void mutate(){
  //randomize parameters, constrain values within logical bounds
  x1=constrain(x1*random(0.9,1.1),1,sourceimg.width);
  y1=constrain(y1*random(0.9,1.1),sourceimg.height,2*sourceimg.height);
  x2=constrain(x2*random(0.9,1.1),1,sourceimg.width);
  y2=constrain(y2*random(0.9,1.1),sourceimg.height,2*sourceimg.height);
  x3=constrain(x3*random(0.9,1.1),1,sourceimg.width);
  y3=constrain(y3*random(0.9,1.1),sourceimg.height,2*sourceimg.height);

  r=constrain(r*random(0.7,1.3),1,255);
  g=constrain(g*random(0.7,1.3),1,255);
  b=constrain(b*random(0.7,1.3),1,255);

//  ra*=random(0.9,1.1); 
}

void display(){
  //draw polygon on screen based on parameters
  fill(r,g,b,a);
  triangle(x1, y1, x2, y2, x3, y3);
}

}

