
traceur[] traceurs = new traceur[0];

void setup(){
  size(500,500);
  background(0);
  for(int a=0;a<5;a++){
    for(int b=0;b<5;b++){
      new traceur(a*100+50,b*100+50);
    }
  }
}

void draw(){
 for(int a=0;a<traceurs.length;a++){
   traceurs[a].avance();
 }
}

class traceur{
  int x; 
  int y; int echecs;
  int[] vx = {-1,0,1,0}; 
  int[] vy = {0,-1,0,1}; ;
  color couleur;
  traceur(int _x, int _y){
    echecs=0;
    int n = int(random(4));
    for(int a=0;a<n;a++){
      vx=avanceListe(vx);
      vy=avanceListe(vy);
    }
    if(random(2)<1){
      vx=reverse(vx); vy=reverse(vy);
    }
    x=_x; 
    y=_y;
    couleur=color(random(128,255),random(50,150),0); 
    traceurs = (traceur[]) append(traceurs, this);
  } 
  void avance(){ 
    int newx = x+vx[0];
    int newy = y+vy[0];
    color c = get(newx, newy);
    if(c!=color(0)){
      vx=avanceListe(vx);
      vy=avanceListe(vy);
      echecs++;
    } else { 
      x=newx;y=newy;
      stroke(couleur);
      point(x,y);echecs=0;
    }
    if(echecs>4){
      newx = int(random(width));
      newy = int(random(height));
      if (get(newx, newy)==color(0)){
        x=newx;y=newy;
      }
    }
  }
}

int[] avanceListe(int[] l){
  l = append(l, l[0]);
  l = subset(l, 1);
  return l;
}


