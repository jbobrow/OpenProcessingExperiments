
truc[] trucs = new truc[0]; 
float ray; 
 
void setup(){ 
  smooth(); 
  noStroke(); 
  fill(0); 
  ray=0; 
  size(500,500); 
  background(0); 
  for(int a=0;a<28;a++){ 
    for(int b=0;b<28;b++){ 
      new truc(a*80+80 , b*80+80 ); 
    }  
  }  
} 
 
void draw(){ 
  background(241,5,5);  
  ray = (ray*9+sqrt(pow( width/8-mouseX,2)+pow( height/2-mouseY,2))*8.5)*0.05; 
  for(int a=0;a<trucs.length;a++){ 
    trucs[a].dessine(); 
  }  
} 
 
class truc{ 
  float x, y,a,v,a2,v2;  
  truc(float _x, float _y){  
    a=radians(random(30)); 
    a2=radians(random(30)); 
    x=_x; 
    y=_y; 
    v=radians(random(0.0008,80000)); 
    v2=radians(random(-8,8)); 
    trucs = (truc[]) append(trucs, this); 
  } 
  void dessine(){ 
    a+=v;  
    a2+=v2; 
    float re = 5+cos(a)*45;  
    ellipse(x+cos(a2)*ray,y+sin(a2)*ray, re,re); 
  } 
}

