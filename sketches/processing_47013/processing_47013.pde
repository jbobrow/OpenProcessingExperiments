
int s=1100;
PVector[]v=new PVector[s];


void setup(){
  size(800,800);
background(230,235,254);
  smooth();
  
}
void draw(){
  // .do: Copy & Paste !!
  for(int a=0;a<s;a++){
    // ASDASDASDASDASDASDASDASDASD
  if(v[a]==null)v[a]=new PVector(a*2.5,0);
  float g=noise(v[a].x*.04,v[a].y*.01)*109*sin(a);
  stroke(a/2);
  point(v[a].x+=noise(g)*.5*sin(a*g),v[a].y+=noise(g));
  
  }
    for(int a=0;a<s;a++){
    // ASDASDASDASDASDASDASDASDASD
  if(v[a]==null)v[a]=new PVector(a*2.5,0);
  float g=noise(v[a].x*.04,v[a].y*.01)*109*sin(a);
  stroke(a/2);
  point(v[a].x+=noise(g)*.5*sin(a*g),v[a].y+=noise(g));
  
  }
    for(int a=0;a<s;a++){
    // ASDASDASDASDASDASDASDASDASD
  if(v[a]==null)v[a]=new PVector(a*2.5,0);
  float g=noise(v[a].x*.04,v[a].y*.01)*109*sin(a);
  stroke(a/2);
  point(v[a].x+=noise(g)*.5*sin(a*g),v[a].y+=noise(g));
  
  }
    for(int a=0;a<s;a++){
    // ASDASDASDASDASDASDASDASDASD
  if(v[a]==null)v[a]=new PVector(a*2.5,0);
  float g=noise(v[a].x*.04,v[a].y*.01)*109*sin(a);
  stroke(a/2);
  point(v[a].x+=noise(g)*.5*sin(a*g),v[a].y+=noise(g));
  
  }
    for(int a=0;a<s;a++){
    // ASDASDASDASDASDASDASDASDASD
  if(v[a]==null)v[a]=new PVector(a*2.5,0);
  float g=noise(v[a].x*.04,v[a].y*.01)*109*sin(a);
  stroke(a/2);
  point(v[a].x+=noise(g)*.5*sin(a*g),v[a].y+=noise(g));
  
  }

  
 

  

  
  

}

