
nitrogen[] nit = new nitrogen[0];
hydrogen[] hyd = new hydrogen[0];


void setup(){
  
  size(950,700); 
  smooth(); 
  background(255);
  frameRate(29.97);
  for(int n = 0; n < nit.length; n++){
    nit[n] = new nitrogen(random(0,950),random(0, 700), random(1,10),random(1,10));
  }
  for(int h = 0; h < hyd.length; h++){
    hyd[h] = new hydrogen(random(0,950),random(0, 700), random(1,10),random(1,10));
  } 
}

void draw(){
  
  background(255);
  for (int n = 0; n < nit.length; n++){
    nit[n].moveNit();
    nit[n].bounceNit();   
    nit[n].disNit();
  }
  for (int h = 0; h < hyd.length; h++){
    hyd[h].moveHyd();
    hyd[h].bounceHyd();
    hyd[h].disHyd();
  }  

if(keyPressed){
  if(key == 'n' || key == 'N'){
  nitrogen N = new nitrogen(mouseX, mouseY,random(1,10),random(1,10)); 
  
  nit = (nitrogen[]) append(nit,N);
  }
}
  
 if(keyPressed){ 
    if(key == 'h' || key == 'H'){
      hydrogen H = new hydrogen(mouseX, mouseY,random(1,10),random(1,10));
      
      hyd = (hydrogen[]) append(hyd,H);
}
}
}


