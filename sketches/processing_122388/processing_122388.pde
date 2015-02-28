
lot[] lots;
float an1=0, an2=0;
float t=20;int num=16;

void setup() {
  size(500, 500, P3D);
  colorMode(HSB);
  rectMode(CENTER);
  noStroke();
  lots = new lot[0];
  lots = (lot[]) append(lots, new lot(num, t));
}

void draw() { 
  an1+=(mouseX-width/2)*0.0001;
  an2+=(mouseY-height/2)*0.0001;
  background(0);
  translate(width/2, height/2,0); 
 camera(70.0, 35.0, 120.0, 50.0, 50.0, 0.0, 0.0, 1.0, 0.0);
  rotateY(an1); 
  rotateZ(an2); 
  translate(0,0,(num*t)/2);
  for(lot l:lots){
    l.dessine();
  }
  translate(0,0,-(num*t)); 
  for(lot l:lots){
    l.dessine();
  }
  translate(0,0,(num*t)/2);
  rotateX(PI/2);
  translate(0,0,(num*t)/2);
  for(lot l:lots){
    l.dessine();
  }
  translate(0,0,-(num*t));
  for(lot l:lots){
    l.dessine();
  }
  translate(0,0,(num*t)/2);
  rotateY(PI/2);
  translate(0,0,(num*t)/2);
  for(lot l:lots){
    l.dessine();
  }
  translate(0,0,-(num*t));
  for(lot l:lots){
    l.dessine();
  }
  
  
}

class lot {
  face[] faces;
  lot(int n, float taille) { 
    faces = new face[0];
    float offset =  (taille*n)/2-(taille/2);
    for (int a=0;a<n*n;a++) { 
      //face f=new face();
      faces = (face[]) append(faces, new face((a/n)*taille-offset,(a%n)*taille-offset, taille*0.8) ); 
    }
  }
  void dessine(){
    for(face f:faces){
      f.dessine();
    }
  }
}

class face {
  float c, v, x, y, taille;
  face(float _x, float _y, float _taille) {
    c = random(255);v=random(-0.3,0.3);
    x=_x;y=_y;taille=_taille;
  }
  void dessine(){
    c+=v;
    c=c%255;
    if(c<0){c+=255;}
    fill(c,255,255);
    rect(x,y,taille, taille);
  }
}

