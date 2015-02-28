
blob[] blobs; poussiere[] poussieres;

void setup(){
 size(500,500);
 smooth();
 stroke(255,100);
 //strokeWeight(1);
 noFill();
 blobs=new blob[10];
 for(int a=0;a<10;a++){
 blobs[a]=new blob(random(-10,510),random(-10,600)); 
 }
 poussieres = new poussiere[20];
 for(int a=0;a<20;a++){
   poussieres[a]=new poussiere();
 }
}

void draw(){
  background(0);
  for(int a=0;a<poussieres.length;a++){
  stroke(random(160,180),200);
    poussieres[a].dessine();
  } 
  stroke(255,100);
  for(int a=0;a<blobs.length;a++){
    blobs[a].dessine();
  } 
}

class variateur{
  float mini, vitesse, angle, val, diff;
  variateur(float mini1, float maxi1, float etapes, float depart){
    val=mini; angle=depart;mini=mini1;diff=maxi1-mini1;
    vitesse=360.0/etapes;
  }
  void avance(){
    angle+=vitesse;
    float rad = (cos(angle/(180.0/PI))+1)/2; 
    val= mini+rad*diff;  
  }
}

class blob{
  float x, y, vX, vY;float[] angles;variateur[] rayons;int n;color couleur;
  variateur respiration;
  blob(float ix, float ig){
    couleur=color(random(230,255),random(100,230),0,200);
    x=ix;y=ig;
    n= floor(random(8,20));
    float depart=random(90);
    angles=new float[n]; 
    rayons=new variateur[n];
    float dec = 360.0/n;
    float raydebase = random(20,100); 
    vY=-random(100-raydebase)*0.01;
    vX=random(-0.03,0.03);
     respiration=new variateur(-5.5,5.5,200,random(360));
   //  minray=raydebase*0.1; maxray=minray+raydebase*0.1;
    for(int a=0;a<n;a++){
      angles[a]= (a*dec)/(180.0/PI); 
      rayons[a]=new variateur(raydebase+random(raydebase/17),raydebase+ random(raydebase/30,raydebase/20),random(120,160),random(360));
    }
  }
  void dessine(){
  float fx=0, fy=0, fx2=0, fy2=0, fx3=0, fy3=0; 
  y+=respiration.val*0.05;
  y+=vY;boolean rien=true;
  respiration.avance();
  x+=random(-0.4,0.4)+vX;
  beginShape();
    fill(couleur);
    float plus=random(-0.01,0.01);
    for(int a=0;a<n;a++){ 
      angles[a]+=plus;
      rayons[a].avance(); 
      float rad=angles[a] ;
      float ix=cos(rad)*(rayons[a].val+respiration.val);
      float ig=sin(rad)*(rayons[a].val-respiration.val); 
      curveVertex(x+ix,y+ig); 
      if((y+ig)>0){rien=false;}
      if(a==0){
          fx = x+ix;
         fy = y+ig;
      }
      if(a==1){
          fx2 = x+ix;
         fy2 = y+ig;
      }
      if(a==2){
          fx3 = x+ix;
         fy3 = y+ig;
      }
    }
    curveVertex(fx,fy); 
    curveVertex(fx2,fy2); 
    curveVertex(fx3,fy3); 
    endShape(CLOSE); 
    if(rien==true){
      y=700 ;
      x=random(-20,520);
    }
  }
  
  
}

class poussiere{
  float x,y;
  poussiere(){
    y=random(500);
    init();
  }
  void init(){
    x=random(500);
  }
  void dessine(){
    y+=random(0.3,2);
    x+=random(-1,1);
    if(y>510){
      y=-10;
      init();
    }
    point(x,y);
  }
}

