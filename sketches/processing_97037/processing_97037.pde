
float posx,posy,vel,velx,vely;

int r;


void setup(){
  
  size(600,600);

  background(0);
  ellipseMode(CENTER);
  
  posx= width/2;
  posy=height/2;
  velx=0;
  vely=0;
  r=100;
}
void mousePressed(){
  
 if(mousePressed == true){
strokeWeight(20);
 stroke(random(255),random(255),random(255));
 velx=random(5,10);
 vely=random(10,15);
 }
}
void draw(){
  
  background(0);
//  
  //posiciones
  
  posx=posx+velx;
  posy=posy+vely;
  vel=velx+vely;
  
  
  //ellipse1
  
  fill(random(255),random(255),random(255));
  ellipse(posx,posy,r,r);
  


if(posx<0 || posx>width){
  velx=-velx;
  

}

if(posy<0 || posy>height){
  vely=-vely;
  
}

}








 


 













