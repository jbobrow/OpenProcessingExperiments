
Wave[] mywave = new Wave[20];

void setup(){
  size(900,400);
  
  for(int i=0;i<mywave.length;i=i+1){
    mywave[i]=new Wave(random(100),random(height),random(30),0,random(200));
  }
  
  
  
}

void draw(){
  background(0);
  
  for(int i=0; i<mywave.length;i=i+1){
  mywave[i].move();
  mywave[i].bounce();
  mywave[i].display();
  }
}
   
  

