

int dim = 720;  
int numDiamonds = 18; 
float dsize=dim/numDiamonds;
int index=0;
float mouseover=0;
float FWHM=dsize*1.5;
Diamond[] diamonds = new Diamond[(numDiamonds+1)*(numDiamonds+1)*2]; 

void setup() {
  size(dim,dim,P3D); 
  background(0); 
  noStroke();
  for (int i=0; i<(numDiamonds+1)*(numDiamonds+1)*2; i++){
      diamonds[i] = new Diamond(dsize);
  }
}

  void draw(){
    background(0);
    index=0;
    pointLight(255,255,255,dim/16,dim/16,dim/4); 
    for(int k=0; k<2; k++){                
      for(int i=0; i<numDiamonds+1;i++){    
        for(int j=0; j<numDiamonds+1;j++){  
          pushMatrix();
          translate(dsize*(i-0.5)+dsize/2*k,dsize*(j-0.5)+dsize/2*k);   
          mouseover=exp(-((mouseX-dsize*i-dsize/2*k)*(mouseX-dsize*i-dsize/2*k)+(mouseY-dsize*j-dsize/2*k)*(mouseY-dsize*j-dsize/2*k))/(FWHM/2)/(FWHM/2));
          if(mouseover>1){mouseover=1;}
          if(mouseX==0 && mouseY==0){mouseover=0;} 
          diamonds[index].display(mouseover);
          popMatrix();
          index++;
        }
      }
    }
  }

class Diamond{
  float size;
  float x,y;
  float theta=0; 
  float thetad=0; 
  float dtheta=0.005; 
  float damp=0.01;
  float speedlimit=PI/32; 
  
  Diamond(float dsize){
    size=dsize;
    }

  void display(float mouseover){
 
    if(mousePressed==false){
    thetad+=dtheta*mouseover; 
    }else{
    if(abs(theta)>PI/64){mouseover=mouseover*10000; if(mouseover>1){mouseover=1;} thetad=thetad-theta/200*mouseover;}else{theta=0; thetad=0;}             
    }
 
    thetad-=thetad*damp;    
    if(thetad>speedlimit){thetad=speedlimit;}else if(thetad<-speedlimit){thetad=-speedlimit;}    
    theta+=thetad;
    if(theta>PI){theta-=2*PI;}
 
    pushMatrix();
    translate(dsize/2,dsize/2);
    rotateY(theta);             
    rotate(PI/4);              
    scale(1/sqrt(2));
      box(dsize,dsize,2);    
    popMatrix();
  }

}
