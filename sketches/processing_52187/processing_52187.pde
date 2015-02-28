
// Inicio
  int stop;
  int hor;
  int ver;

void setup(){
  size(500,500);
  smooth();
  hor=25;
  stop=0;
  ver=25;
  noStroke();
  fill(random(255),random(255),random(255),random(255));
 
}
void draw(){
  background(0);
  ellipse(hor,ver,50,50);
  
 if (stop==0){
   ver=ver+50;
    
    
 }
  
 if (ver==475){
   stop=10;
   fill(random(50),(150),(210));
 }
  
 if (stop==10){
 hor=hor+50;
 }
  
 if (hor==475){
   stop=20;
   fill((250),random(50),(130));
 }
  
 if (stop==20){
   ver=ver-50;
 }
  
 if (ver==25){
   stop=30;
   fill((170),(200),random(50));
 }
  
 if (stop==30){
   hor=hor-50;
 }
  
 if (hor==25){
 stop=0;
 fill((250),random(50),50);
 }
}

