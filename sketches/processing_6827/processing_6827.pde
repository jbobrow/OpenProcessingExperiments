
cellule[] mesCellules;
float cellT ; float[][] traits;float wmax,hmax,cellT2,w2,h2;

void setup(){
  size(500,500,P2D);
  cellT=12; cellT2=cellT*0.5;
  w2=width/2 ;h2=height/2 ;
  wmax=width-cellT*0.2;
  hmax=height-cellT*0.2;
  mesCellules = new cellule[0];
  int n=30;
  float t=width/n;float o=t/2;
  for(int a=0;a<n;a++){
    for(int b=0;b<n;b++){
      float d=dist(a*t+o, b*t+o, w2, h2);
      if(d<w2){
      mesCellules = (cellule[]) append (mesCellules, new cellule(a*t+o, b*t+o));
      }
    }
  }
  noFill(); background(0);smooth();
}

void draw(){ 
  traits= new float[0][4];
  background(80);stroke(255,0,0);//ellipse(width/2,height/2,width,height);
  for(int a=0;a<mesCellules.length;a++){
    mesCellules[a].dessine();
  }
  stroke(255,100); 
  for(int a=0;a<traits.length;a++){
    line(traits[a][0],traits[a][1],traits[a][2],traits[a][3]);
  }
}

class cellule{
  float x,y,v,an;boolean chef = (random(10)<1);
  color c = color(random(160,255),random(120, 255),random(255) );
  cellule(float _x, float _y){
    x = _x; y = _y; v = random(0.5, 3); an = random(TWO_PI);
  }
  void dessine(){
    an = an + random(-0.2, 0.2); 
     x = x+cos(an)*v; y = y+sin(an)*v; 
     float di=dist(x,y,w2,h2);
     if(di>w2){
       x=w2+((x-w2)/di)*w2;
       y=h2+((y-h2)/di)*h2;an+=PI;
     }
    
     for(int a=0;a<mesCellules.length;a++){
        cellule cell = mesCellules[a];
        if(cell != this ){ 
          float d = dist(x,y,cell.x, cell.y);
          if(d<cellT*1.3){
            x = cell.x+((x-cell.x)/d)*cellT*1.01;
            y = cell.y+((y-cell.y)/d)*cellT*1.01;
            cell.an = an+random(-0.2,0.2); an+=random(-0.2, 0.2); //an = an+(PI+random(-0.2,0.2));
            float nv = cell.v;cell.v=v;v=nv;
            if(random(4)<1){cell.c = c;}
           //line(x,y,cell.x,cell.y);
           float[] t = {x,y,cell.x, cell.y};
           traits = (float[][]) append (traits, t);
            if(chef){an+=random(-0.5,0.5);}
          }
        }
     }
     if(v>3){v*=0.99;}
     if(random(100)>99){v=4.5;}
    stroke(c);
    ellipse(x,y,cellT*0.5,cellT*0.5);
  }
} 

void mousePressed(){
  color c=color(random(160,255),random(80, 255),random(255));
  for(int a=0;a<mesCellules.length;a++){
     cellule cell = mesCellules[a];
     if(dist(mouseX,mouseY,cell.x,cell.y)<50){
       cell.c=c;
     }
  }
}



