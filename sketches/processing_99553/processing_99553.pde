
int[] posx,posy,velx,vely;

int szx,szy,numPilotes;

void setup(){
  size(500,500);
  
  numPilotes=10;
  posx=new int[numPilotes];
  posy=new int[numPilotes];
  velx=new int[numPilotes];  
  vely=new int[numPilotes];
  
  szx=width/20;
  szy=height/20;
  
  for(int i=0; i<numPilotes; i++){
    posx[i]=width/2;
    posy[i]=height/2;
    velx[i]=int(random(-10,10));
    vely[i]=int(random(-10,10));
    if(velx[i]==0){
      velx[i]=1;
    }
    if(vely[i]==0){
      vely[i]=1;
    }
  }
}

void draw(){
  pintaFons();
  actualitzaPosicio();
  dibuixarPilotes();
  dibuixarPilotes(5);
}


void pintaFons(){
  background(255);
  for(int x=width/20; x<width; x+=width/20){
    for(int y=height/20; y<height; y+=height/20){
      fill(x-50,2*y,y-x);
      rect(x,y,width/25,height/25);
    }
  }
}

void actualitzaPosicio(){
  for(int i=0; i<numPilotes; i++){
    posx[i]+=velx[i];
    posy[i]+=vely[i];
    
    if((posx[i]<szx)||(posx[i]>width-szy)){
      velx[i]=-velx[i];
    }
    if((posy[i]<szx)||(posy[i]>width-szy)){
      vely[i]=-vely[i];
    }
  }
}


  void dibuixarPilotes(){
    for(int i=0; i<numPilotes; i++){
    fill(0);
    ellipse(posx[i],posy[i],szx,szy);
    }
  }





void dibuixarPilotes(int num_element){  
    for(int i=0; i<numPilotes; i++){
      fill(255,0,0);
    ellipse(posx[num_element],posy[num_element],szx*2,szy*2);
    }
  }


