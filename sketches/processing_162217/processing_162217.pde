
int dim = 600;
int nr = 500;
int sigma = 10;
float radius = 10;
Particle[] ps = new Particle[nr];
Particle[] psAux =  new Particle[nr];


void setup(){
  size(dim,dim); 
  //smooth();
  frameRate(30);
  colorMode(HSB, TWO_PI, 1, 1);
  for(int i = 0; i < ps.length; i++){
    ps[i] = new Particle(
      i,
      random(0, TWO_PI),
      dim/2 + randomGaussian()*(dim/sigma),
      dim/2 + randomGaussian()*(dim/sigma));
  }
  background(0);
}

void draw(){
  update();
  
  //background(0);
  noStroke();
  fill(0,0,0,1);
  rect(0,0,dim,dim); 
  for(int i = 0; i < ps.length; i++){
    //ps[i].drawP(); // dots
    
    strokeWeight(6);  
    stroke(ps[i].c,1,1);
    line(ps[i].x,ps[i].y,psAux[i].x,psAux[i].y);
  }
}

void update(){
  for(int i = 0; i < ps.length; i++){
    psAux[i] = ps[i].clone();
  }
  for(int i = 0; i < ps.length; i++){
    ps[i].move(psAux);
  }
}


class Particle {
  float c, x, y;
  final int id;
  float vx = 0;
  float vy = 0;
  float slowdown = 1;
  public Particle(int id, float c, float x, float y){
    this.id = id;
    this.c = c;
    this.x = x;
    this.y = y;
  }
  public void drawP(){
    fill(c, 1,1);
    ellipse(x,y,radius,radius);
  }
  public void move(Particle[] aux){

    float force = 5000;
    for(int i = 0; i < psAux.length; i++){
      Particle that = psAux[i];
      if(! this.equal(that)){
        float r2 = max((this.x-that.x)*(this.x-that.x) + (this.y-that.y)*(this.y-that.y),1);
        float r  = sqrt(r2);  
        float m  = force*cos(this.c-that.c);
        float ux = (that.x-this.x)/r;
        float uy = (that.y-this.y)/r;
        vx += (ux*m)/(r2);
        vy += (uy*m)/(r2);
        
      }
    }


    
    // normalize
    float dv = 0.2*sqrt(vx*vx+vy*vy);
    vx = vx/dv;
    vy = vy/dv;
    
        // fluctuate
    float fluctuation = 4;
    float px = fluctuation*randomGaussian();
    float py = fluctuation*randomGaussian();
    
    
    
    // attract to center
    float pull = 0.0000000005;
    float r2 = ((this.x-dim/2)*(this.x-dim/2) + (this.y-dim/2)*(this.y-dim/2));
    float r  = sqrt(r2);
    float ux = (dim/2-this.x)/r;
    float uy = (dim/2-this.y)/r;
    float fgx = (ux*pull)*r2*r2;
    float fgy = (uy*pull)*r2*r2; 
    
    
    // add
    x += (vx+fgx+px);
    y += (vy+fgy+py);
    
    
    // slowly change alliance
    c = mod(c+0.05*randomGaussian(), TWO_PI);
  }
  public Particle clone(){
    return new Particle(id, c, x, y);
  }
  public Boolean equal(Particle p){
    return this.id == p.id;
  }

}

  
public static float mod(float a, float b){
  return (a % b + b) % b;
}




public float randomGaussian() {
     float v1, v2, s;
     do {
       v1 = random(-1f, 1f);  // between -1.0 and 1.0
       v2 = random(-1f, 1f);   // between -1.0 and 1.0
       s = v1 * v1 + v2 * v2;
     } while (s >= 1 || s == 0);
     float multiplier = sqrt(-2 * log(s)/s);
     nextNextGaussian = v2 * multiplier;
     return v1 * multiplier;
 }
