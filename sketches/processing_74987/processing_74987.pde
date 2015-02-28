
variateur r1, r2, c, rv;
float angle = 0;

void setup(){
  size(500,500);
  background(255);
  colorMode(HSB);
  noStroke();
 // smooth();
  r1 = new variateur(10, width/2, random(0.5,1.5));
  r2 = new variateur(10, width/2, random(0.5,1.5));
  rv = new variateur(50, 200, random(1,5));
  c = new variateur(0, 255, random(0.1,0.5));
}

void draw(){
  copy(0,0,width, height, -1, -1, width+2, height+2);
  angle+=TWO_PI*0.01;
  cible(width/2+cos(angle)*r1.avance(), height/2+sin(angle)*r2.avance()); 
}
 
void cible(float x, float y){  
  float r=rv.avance();
  boolean bk = true;
  
  fill(0,50);
  ellipse(x+3, y+3, r, r);
  
  if(random(100)<50){bk=false;} 
  while (r>10){
    if(bk){
      fill(255);
    } else {
      fill(c.avance(), 250,254);
    }
    ellipse(x,y, r, r); 
    r*=random(0.70,0.96); 
    bk=!bk;
  }
}

class variateur{
  float etat, mini, maxi, pas, ecart,v;
  variateur(float _min, float _max, float _pas){
    ecart=(_max-_min)/2;
    mini=_min+ecart;
    etat = random(-1,1);
    v=random(0.01,0.02);
  }
  float avance(){
    etat+=v;
    return (mini+cos(etat)*ecart);
  }
}
