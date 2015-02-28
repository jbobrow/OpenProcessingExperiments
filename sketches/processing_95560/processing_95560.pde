
Root[] akar;
int akarNo;

void setup(){
  size(400, 600);
  background(204);
  stroke(0);
  smooth();
  akarNo = 10;
  
  akar = new Root[akarNo];
  for(int i = 0; i<akarNo; i++){
    akar[i] = new Root();
  }//for
}//setup

void draw(){
   for(int i = 0; i<akarNo; i++){
     akar[i].fly();
   }//for
}//draw

void mousePressed(){
  background(204);
  for(int i = 0; i<akarNo; i++){
    akar[i].posy = 0;
  }//for
}//mousePressed

class Root{
  int ballWidth = 5;
  float posx, posy,peak,jarak,speed;
  
  Root(){
    posy = -ballWidth;
    posx = 0;
    peak = random(5,70);
    jarak = random(0.01,0.02);
    speed = random(0.5,1);
    

  }//Root consructor
  
  void fly(){
   posy = posy + speed;
   posx = sin(posy*jarak)*peak;
   if(posy > height + ballWidth + posy*0.1){
     posy = -ballWidth;
   }//if
   
   if(posx < 1 && posx > -1){
     peak = random(5,70);
   }//if
   fill(255);
   ellipse(posx + width/2,posy,ballWidth + posy*0.05,ballWidth + posy*0.05); 
   
  }//fly
}//Root class
