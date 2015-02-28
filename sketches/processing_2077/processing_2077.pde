
poinpoin[] tousmespoints ;PFont maPolice = createFont("arial",18);
int nombre;

void setup(){
  nombre = -1;
  size(400,400);strokeWeight(2);smooth();
  background(0);
  stroke(255);
  textFont(maPolice, 18);textAlign(CENTER, CENTER);
  instructions();
}

void draw(){
  if(nombre>-1){
  background(0);
  beginShape();
  for(int a=0;a<tousmespoints.length;a++){
    tousmespoints[a].dessine();
  }
  endShape(CLOSE); 
  for(int a=0;a<tousmespoints.length;a++){
    tousmespoints[a].trace();
  }
  }
}

class poinpoin{
  float an,r; variateur v;float[] mesp={0,0};
  poinpoin(float _an){
    an = _an;
    v = new variateur(120,198,random(99.99,100.01), _an*nombre);
    tousmespoints = (poinpoin[]) append(tousmespoints, this);
    
  }
  void dessine(){
    r = v.avance();
    mesp[0]=200+cos(an)*r;
    mesp[1]=200+sin(an)*r;
    vertex(mesp[0],mesp[1]);
  }
  void trace(){
    line(200,200,mesp[0],mesp[1]);
  }
}

class variateur{
  float mini, etapes , pas, an, v, taille;
  variateur(float _mini, float _maxi, float _etapes, float depart){
    mini=_mini;
    an=depart; 
    taille = _maxi-mini;
    v = TWO_PI/_etapes;
  }
  float avance(){
    an+=v;
    return mini+((cos(an)+1)*taille)/2;
  }
}

void keyPressed(){
  if(keyCode==38){
    nombre++;
       reparsAZero();
  } else {
    if(keyCode==40){
       nombre--;
       if(nombre<0) { nombre=-1; instructions();} else { reparsAZero(); }
    }  
  } 
}

void reparsAZero(){
  fill(255,60,20,180);
    tousmespoints = new poinpoin[0];
  for(int a=0;a<180;a++){
   new  poinpoin(radians(a*2));
  }
}

void instructions(){
  fill(255);
  background(0);
  text("Use up and down arrows", 200,200);
}

