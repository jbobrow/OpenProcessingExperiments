
class Bar {
  float theta;
  int i, j, polarity;
  float R1, R2;
  YinYang yinyang;
  Gua gua;

  public Bar(Gua gua, int j){
    this.gua = gua;
    this.yinyang = gua.yinyang;
    this.i = gua.i;
    this.j = j;

    this.polarity = (gua.process>>j)&1;
    theta = PI * (polarity + 0.5);

    float R1 = gua.R1;
    float R2 = gua.R2;
    this.R1 = ((j+1)/3.0)*R1 + (1-(j+1)/3.0)*R2;
    this.R2 = (j/3.0)*R1 + (1-j/3.0)*R2;
  }

  public void draw(){
    float angle = TWO_PI/8.0;
    float d = 5;
    float lambda = max(0,min(sin(QUARTER_PI),sin(theta)))/4;

    float y1 = -R1*cos(angle/2.0) - d;
    float y2 = -R2*cos(angle/2.0) + d;

    float x1 = R1*sin(angle/2.0) - d/tan((PI+angle)/4.0);
    float x2 = R2*sin(angle/2.0) - d/tan((PI-angle)/4.0);

    stroke(0);//,500*abs(sin(theta)));
    fill(0);//,500*abs(sin(theta)));
    
    beginShape();
    vertex(x1,y1);
    vertex(x2,y2);
    if(lambda>0){
      vertex(x2*lambda,y2);
      vertex(x1*lambda,y1);
      endShape(CLOSE);
      beginShape();
      vertex(-x1*lambda,y1);
      vertex(-x2*lambda,y2);
    }
    vertex(-x2,y2);
    vertex(-x1,y1);
    endShape(CLOSE);

    float gamma = (1+j)/3.0+(1 ^ this.polarity ^ gua.polarity);
    
    theta += (yinyang.X * yinyang.Y) * .0001 * gamma;
    while(theta < 0)       theta += TWO_PI;
    while(theta >= TWO_PI) theta -= TWO_PI;
    polarity = int( theta >= PI ) ;
  }
}

