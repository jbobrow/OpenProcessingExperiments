
int dim=2; //dimensionality
int spikes = 10; // max size of spikes
int tot=100;
float speed = 10;
planet[] planets;
color[] pal={#244B49,#080E0D,#6D2506,#546916,#CC5A0D,#3C9A43,#B8B536,#C3D2C0};//@ flowers

float colorDiff(color c1, color c2){
  float a=hue(c1);
  float b=hue(c2);
  float ans1=b-a;
  float ans2=a+b-1;
  return random(0.4)-((abs(ans1)<abs(ans2))?ans1:ans2);}

class planet{
  float[] p = new float[dim]; //current position
  color c;
  planet(float[] inP, color inC) {
    p = inP;
    c = inC;
  }
  void step(){
    for(int i = 0; i < tot; i++){
      if(planets[i] != this){
        float insqrt = 0;
        for(int d = 0; d < dim; d++)
          insqrt += pow(planets[i].p[d] - p[d], 2);
        float diff = colorDiff(planets[i].c, c);
        for(int d = 0; d < dim; d++)
          p[d] += speed * ((planets[i].p[d] - p[d]) * diff) / insqrt;
        }
      }
    manifest();
  }
  void manifest(){
    stroke(hue(c), random(0.5), 1, 0.1);
    line(p[0], p[1], p[0] + random(-1,1), p[1] + random(-1,1));
    
    stroke(hue(c), random(0.6), random(1), 0.08);
    line(p[0], p[1], p[0] + random(-spikes,spikes), p[1] + random(-spikes,spikes));
    
    stroke(c);
    point(p[0], p[1]);
  }
}

void setup() {
  size(640,360,P2D);
  colorMode(HSB, 1);
  background(0);
  
  planets = new planet[tot];
  for(int i = 0; i < tot; i++){
    float[] p = new float[dim];
    for(int d = 0; d < dim; d++)
      p[d]= random(-width, width) / 2;
    color c = pal[int(random(pal.length))];
    planets[i]=new planet(p, color(hue(c),saturation(c),brightness(c), 0.1));
  }
}
    
void draw() {
  translate(width/2, height/2);
  for(int i=0;i<tot;i++)
    planets[i].step();
}

void mousePressed() {
  setup();
}

