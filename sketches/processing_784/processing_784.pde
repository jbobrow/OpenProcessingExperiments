
/*
By Sajid Saiyed
http://www.ssdesigninteractive.com/g2
http://www.ssdesigninteractive.com/blog
Do let me know if you happen to imrovise this code
*/


class Petals{
  //
  float r;
  float l;
  float a;
  float t;
  float x,y;
  //float c;
  float Ang = 0;
  float inc = random(1, 10);
  color c;
  Petals(float rIn, float lIn, float aIn, float tIn, color cIn, float xIn, float yIn){
    r = rIn;
    l = random(lIn);
    a = aIn;
    t = tIn;
    c = cIn;
    x = xIn;
    y = yIn;
  }
  
  public void update(){
    a += inc;
    Ang += inc;
  }
  
  public void render(){
    //float w = width/2;
    //float h = height/2;
    translate(x, y);
    rotate(a);
    stroke(c, 10);
    fill(c,10);
    bezier(0, 0, random(50), random(200), random(50), random(80), 0, 0);
  }
  
}

