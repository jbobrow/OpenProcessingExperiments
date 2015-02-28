
float [] r=new float [255];
float []g=new float [255];
float []b=new float [255];

float []j=new float[1024];


void setup(){
  size(1024,200);
  for(int i=0;i<r.length;i++){
    r[i]=(int)random(200,255);
  }
  
  for(int i=0;i<g.length;i++){
    g[i]=(int)random(20,30);
  }
  
  for(int i=0;i<b.length;i++){
    b[i]=(int)random(70,85);
  }

for(int i=0;i<j.length;i++){
    j[i]=(int)random(1024);
  }

}

void draw(){
  background(255);
    for(int i=0;i<255;i++){
    stroke(r[i],g[i],b[i],70);
    line(j[i],0,width/3,height);
    smooth();
    
     j[i]=j[i]+10;
    if(j[i]>1024){
      j[i]=i;
    }
    
    
    
    
    
    }
    
   
  
  }

  


