
public class Mass
{
  float x,y,mass;
  color col;
  boolean ALIVE=true;
  
  Mass()
  {
    x=random(0,width);
    y=random(0,height);
    mass=random(-1000,1000);
    colorMode(HSB);
    col=color(random(0,255),random(120,200),random(90,210));
  }
  Mass(float tmass)
  {
    x=random(0,width);
    y=random(0,height);
    mass=tmass;
    //colorMode(HSB);
    //col=color(random(0,255),random(120,200),random(90,210));
    col=color(200,0,0,30);
  }
  
  Mass(float tmass,color tcol)
  {
    x=random(0,width);
    y=random(0,height);
    mass=tmass;
    colorMode(RGB);
    col=tcol;
  }
  
  void draw()
  {
    if (mass>1||mass<1)
    {/*
      //fill(col);
      //noStroke();
      noFill();
      stroke(col);
      strokeWeight(.6);
      ellipse(x,y,10,10);*/
    }
    else
    {
      strokeWeight(.6);
      stroke(col);
      point(x,y);
    }
  }
  
  void calculate(float tx,float ty,float tmass)
  {
    float distance=dist(tx,ty,x,y);
    {
      float masss=(distance<=15)?tmass/(16-distance):tmass;
      //float force=-50*masss/pow(distance,2);
      float force=-masss/pow(distance,1.1);
      x=x+force*sin(atan2(tx-x,ty-y));
      y=y+force*cos(atan2(tx-x,ty-y));
      if (x>width||x<0||y>height||y<0||distance<10) ALIVE=false;
    }
  }
  
}

