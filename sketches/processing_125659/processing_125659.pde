
ArrayList<Drops> drops;
float h, s, b;
float t1, t2, t3;       
void setup() {  
  size(800, 400);
  //frameRate(24);    
  smooth();
  stroke(0);
  strokeWeight(3); 
  drops=new ArrayList<Drops>();  
  colorMode(HSB, 100);
  h=0; 
  s=10; 
  b=20;
  t1=0;
  t2=13;
  t3=5;
}

// frame loop   
void draw() {
  h=map(sin(t1), -1, 1, 50, 60);
  s=map(sin(t2), -1, 1, 70, 80);
  b=map(sin(t3), -1, 1, 70, 80);    
  background(h, s, b);
  for(int i=0; i<drops.size(); i++){
    Drops d=drops.get(i);
    d.display();
    d.update();
    if(d.dead())
    drops.remove(d);
  }
  t1+=0.01;
  t2+=0.007;
  t3+=0.015;
}
void mousePressed(){
  drops.add(new Drops(mouseX, mouseY));
}
class Drops{
  float r, x, y;
  float h, s, b, o;
  float ha, sa, ba;
  Drops(float x_, float y_){
    x=x_;
    y=y_;
    r=10;
    h=0; 
    s=0;
    b=0;
    ha=0;
    sa=50;
    ba=31;
    o=70;
  }
  void update(){
    h=map(sin(ha), -1, 1, 0, 100);
    s=map(sin(sa), -1, 1, 0, 100);
    b=map(sin(ba), -1, 1, 0, 100);
    ha+=0.003;
    sa+=0.005;
    ba+=0.002;
    o--;
  }
  void display(){
    color c=color(h, s, b, o);
    fill(c);
    ellipse(x, y, r, r);
    r+=10;
  }
  boolean dead(){
    if(r>1600)
    return true;
    else return false;
  }
}
