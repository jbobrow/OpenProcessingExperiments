
float tam = 200;
float tam1 =50;
float creci = 8;
float creci1 = 10;

void setup(){
  size(600,600);
  background(30);
  smooth();
}

void draw(){
  rectMode(CENTER);
  stroke(255);
  
  
  fill(random(20,60),random(230,255),tam-80,5);
   for(int i=0; i<30; i++){
rect(width/2,height/2,tam,tam);
   }
   
    tam = tam + creci;
  
  if ((tam>550)||(tam<15)){
    creci = creci*-1;
  }
  
  
  
fill(random(160,220),random(90,100),random(30,90),5);
  for(int u=0; u<30; u++){
rect(width/2,height/2,tam1,tam1);
}
  
 
  tam1 = tam1 + creci1;
  
  if ((tam1>550)||(tam1<15)){
    creci1 = creci1*-1;
  }
 
 
 
  
}

