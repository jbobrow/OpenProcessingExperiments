
ligne[] lignes;
float ix=0,ig=0;
float centre =100;

void setup(){
  size(500,500,P3D);
  background(0);stroke(255);
  lignes = new ligne[0];
  colorMode(HSB,100,1,1);
  for(int a=0;a<50;a++){
    new ligne();
  }
  sphereDetail(5);
  noFill();strokeWeight(2);
   smooth(); 
}

void draw(){
  background(0); 
  ix-=(mouseX-width/2)*0.0005;
  ig+=(mouseY-height/2)*0.0005;
  translate(width/2, height/2);
  rotateY(ix);  rotateX(ig);
  sphere(100);
  for(int a=0;a<lignes.length;a++){
    lignes[a].dessine();
  }
}

class ligne{
  float x,y,z,vx,vy,vz,c;
  PVector[] v=new PVector[1]; 
  ligne(){
    v[0]=new PVector(0,0,0);
    x=y=z=0;c=random(100);
    vx=random(-1,1);
    vy=random(-1,1);
    vz=random(-1,1);
    lignes = (ligne[]) append(lignes, this);
  }
  void dessine(){
    c+=0.1;c%=100;
    vx+=random(-0.3,0.3);
    vy+=random(-0.3,0.3);
    vz+=random(-0.3,0.3); 
    float nx=x+vx, ny=y+vy, nz=z+vz;
    float d = dist(0,0,0,nx,ny,nz);
    if(d>200){
      nx=(nx/d)*200;
      ny=(ny/d)*200;
      nz=(nz/d)*200;
      vx = x-nx;vy=y-ny;vz=z-nz;
      vx+=random(-0.1,0.1);
      vy+=random(-0.1,0.1);
      vz+=random(-0.1,0.1); 
      
    }
    stroke(c,1,1);
    v = (PVector[]) append(v, contrains(new PVector(nx,ny,nz)));
    if(v.length>100){
      v = (PVector[]) subset(v, 1);
    }  
    line((nx/d)*centre,(ny/d)*centre,(nz/d)*centre,nx,ny,nz);
    
    
    beginShape(LINES);
    for(int a=0;a<v.length;a++){
      vertex(v[a].x, v[a].y, v[a].z);
    }
    endShape(); 
    x=nx;y=ny;z=nz;
  }
}

PVector contrains(PVector v){
  float d = dist(0,0,0,v.x, v.y, v.z);
  if(d<centre){
   v.x=(v.x/d)*centre;
    v.y=(v.y/d)*centre;
    v.z=(v.z/d)*centre;
    
  }
  return v;
}

void keyPressed(){
  save("truc.png");
}

