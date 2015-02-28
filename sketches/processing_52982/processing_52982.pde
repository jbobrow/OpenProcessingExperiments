
int y;
float angulo=0.0;
boolean haciaAbajo;
void setup(){
  

size(500,500);
smooth();

haciaAbajo = true; 

}
void draw(){
translate(200,y);
rotate(angulo);
background(230,0,126);
fill(0,25,255);
  rect(-30,-30,60,60);
  angulo=angulo+0.01;
if( haciaAbajo ){


y++; 
if( y > width ){ 

haciaAbajo = false; 

}

}else{

y--;  
if( y < 0 ){ 

haciaAbajo = false; 

}

}

}
