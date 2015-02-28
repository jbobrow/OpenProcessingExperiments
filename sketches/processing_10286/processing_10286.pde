
PGraphics img;
poin[] ligne; 

void setup(){
  img = createGraphics(1200, 600, JAVA2D);
  img.beginDraw();
  img.background(0);
  img.stroke(255);
  img.noFill();
  img.smooth();
  img.endDraw();
  int n = 1200/24;
  ligne = new poin[n];
  float diff1 = 1200.0/n;
  float diff2 = (-260.0)/n;
  for(int a=0;a<n;a++){
    ligne[a]=new poin(diff1*a, 280-diff2*a);
  }
  smooth();
  size(500,500);
}

void draw(){
  img.beginDraw();
  img.noFill();
  img.copy(0, 0, img.width, img.height, 4, -3, img.width, img.height);  
  img.beginShape();
   for(int a=0;a<ligne.length;a++){
    ligne[a].dessine();
     img.vertex(ligne[a].x, ligne[a].yy);
     img.line(ligne[a].x,ligne[a].yy,ligne[a].x,img.height);
   }
   img.endShape();
  img.fill(0,4);
  img.rect(-1,-1,img.width+2,img.height+2);
  img.endDraw();
  copy(img,700, 50, 500, 500, 0, 0 , 500, 500);  
}

class poin{
  float x, y, hauteur,v,an,t,yy;
  poin(float _x, float _y){
    x=_x;y=_y;hauteur=0; 
    t=random(25);
    an=random(TWO_PI);
    v=random(-PI*0.1,PI*0.1);
  }
  void dessine(){ 
    an+=v; 
    yy=y+cos(an)*t +t/2 ;
    if(random(10)<0.5){
    v=random(-PI*0.1,PI*0.1);
    }
  }
}

