

void setup(){
  frameRate(12);
  size (600,600) ;
  background (255);
  noStroke(); 
}


void draw(){
  
 if (mousePressed){  
   negyzet(mouseX,mouseY); 
 }
 
}

void negyzet(int x,int y){
    
  int nm= (int) random (width/3);
  int bl=(int)random(127)+80;
  int op=(int)random(255) ;
  fill(255,bl,255,op);;
  rect(x,y,nm,nm);

}

