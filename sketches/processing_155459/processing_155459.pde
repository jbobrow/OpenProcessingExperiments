
Star s;
ArrayList <Star> stars=new ArrayList <Star>(); 
PImage img;
PImage img;
float deep0=1;
float deep1=.72;
float deep2=.65;
float deep3=.72;
float deep4=.74;
int nbcols=5;
float [] ratios= {
  .01, .015, .02, .025, .03
};
float []colors=new float[nbcols];
int nbepoints=55;
int n=0;
int sens=1;
void setup() {
  size(500, 500);
  background(255, 255, 255);
  strokeWeight(.1);
  noStroke();
  colorMode(HSB); 
  colors[4]=color(40,70,255);
  colors[0]=color(20,255,255);
  colors[1]=color(40,255,255);
  colors[2]=color(0,255,255);
  colors[3]=color(210,255,205);
  float dia=width*1.1;
  int p=0;
  pushMatrix();
  translate(width/2, height/2);
  while (dia>15) {
    dia/=1.15;
    Star s=new Star(dia, nbepoints, p);
    s.display();
    p++;
  }
  popMatrix();
}

class Star {
  float dia;
  int nbpoints, index;
  Star(float dia, int nbpoints, int index) {
    this.dia=dia;
    this.index=index;
    this.nbpoints=nbpoints;
  }
  void display() {
    deep1=.6;
    for (j=0; j<5; j++) {
      deep1-=ratios[(index+j)%5];//random(.01,.03);//.02;//ratios[(index+j)%4];
      if (j==4)deep1=.49;
      fill(colors[j]);
      for (int i=0; i<nbpoints; i++) {        
        int nextpoint=(i+1)%nbpoints;
        float angle1=i*TWO_PI/nbpoints;
        float angle2= nextpoint*TWO_PI/nbpoints;
        beginShape();
        vertex(0, 0);
        vertex(dia*sin(angle1), dia*cos(angle1));
        bezierVertex(dia*sin(angle1)*deep1, dia*cos(angle1)*deep1, 
        dia*sin(angle2)*deep1, dia*cos(angle2)*deep1, 
        dia*sin(angle2), dia*cos(angle2));
        endShape();
      }
    }
  }
}



