
class SuperFormulaShape {
  float a, b, m, n1, n2, n3, ss, step;
  PVector loc;
  float h,s,v,_alpha;

  SuperFormulaShape(PVector l) {
    init();
    h=random(0,360);
    s=random(0.2,0.5);
    v=random(1,1);
    _alpha=random(1,1);
    loc=l.get();
    render();   
  }

  void init() {
    a=b=1f;
    m=random(0,20);
    n1=random(0,20);
    n2=random(0,20);
    n3=random(0,100);
    ss=10;
    step=0.05;
  }

  void render() {
    fill(h,s,v,_alpha);   
    pushMatrix();
    translate(loc.x*gridW+gridW*0.5,loc.y*gridH+gridH*0.5);
    beginShape();    
    for (float theta=0;theta<=TWO_PI;theta+=step) {   
      float r=pow((pow((abs(cos(m*theta/4)/a)), n2)+pow((abs(sin(m*theta/4)/b)), n3)), -1*(1/n1));
      float x=r*cos(theta);
      float y=r*sin(theta);         
      vertex(x*ss, y*ss);
    }
    endShape(CLOSE);
    popMatrix();
  }
}


