
/*
  night curls
  (c)2009 by reyhan a.k.a. rce-ordinary
  made in processing 1.0
  rce-ordinary.deviantart.com
  feel free to modify it :)
*/

painter[] pt;
int nmb=100;
color clr;
int tm=0;

void setup(){
  size(800,800,P3D);
  smooth();
  background(0);
  clr=color(random(255),random(255),random(255));
  
  pt=new painter[nmb];
  for(int a=0;a<nmb;a++){
    pt[a]=new painter();
  }
}

void draw(){
  if(tm++>1000){
    tm=0;
    fill(0,96);
    rect(0,0,width,height);
  }
  
  for(int a=0;a<nmb;a++){
    pt[a].trail(clr);
  }
}

void mousePressed(){
  background(0);
  clr=color(random(255),random(255),random(255));
  
  pt=new painter[nmb];
  for(int a=0;a<nmb;a++){
    pt[a]=new painter();
  }
  
  tm=0;
}

void keyPressed(){
  if(key=='s' || key=='S'){
    save("night_curls"+day()+month()+year()+hour()+minute()+second()+".jpg");
  }
}

