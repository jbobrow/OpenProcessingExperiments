
class Dancer{
  private float x1,y1;   //starting point
  private float angle;
  private float s;       //size
  private float weight;  //line weight
  private float a;       //alpha
  
  public float getAlpha(){ return a;}
  
  public Dancer(float x, float y){
    x1=x;
    y1=y;
    s=0;
    weight=8;
    a=255;
    angle=random(0,TWO_PI);
  }
  
  public void update(){
    s+=0.4;                         //make the line longer
    angle+=random(-PI/100,PI/100);  //adjust the angle
    if (weight>0.2)  weight-=0.02;
    if (a>0)         a-=0.7;
    display();
  }
  
  public void display(){
    strokeWeight(weight);
    stroke(0,a);
    float x2=x1+cos(angle)*s;
    float y2=y1+sin(angle)*s;
    line(x1,y1,x2,y2);
  }
}

