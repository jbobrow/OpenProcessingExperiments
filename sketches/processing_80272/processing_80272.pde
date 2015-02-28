
//AUTOR: ARANTXA PAVIA LOPEZ DE FELIPE

int y=0;
void setup(){
  size(300,200);
  background(255,255,0);
  
  rectMode(CENTER);
}
 //ROSA
void draw(){
  background(250,5,181);
  y=mouseY/25;
 int i=0;
  fill(0);
  stroke(0);
  for(int x=0;x<320;x=x+15){
    rect(x,150,y,300);
   
   
  }
  
  fill(125);
  
  stroke(255);
  //AZUL
 if (mousePressed){
     background(12,5,250);
       y=mouseY/25;

  fill(0);
  stroke(0);
  for(int x=0;x<320;x=x+15){
    rect(x,150,y,300);
   
  } 
  //VERDE 
  if(key=='s'||key=='S'){
background(0);
       y=mouseY/25;

  fill(5,250,19);
  stroke(0);
  for(int x=0;x<320;x=x+15){
    rect(x,150,y,300);
}

}
}
}


