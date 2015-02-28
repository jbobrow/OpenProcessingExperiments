
//Max Milà
//dibuix, el centre del qual segueix les coordenades del ratolí
//mida en funció del valor a, pot ser més gran o més petit




void setup(){

  size(800,800);
  background(0,155,255);
}


void draw(){
  int a;
  a=10;
  

 background(0,155,255);
 
 


  
  fill(0,255,249);
 
   
   triangle(mouseX-8*a,mouseY-3*a,mouseX-8*a,mouseY+3*a,mouseX-5*a,mouseY); //aleta posterior

   triangle(mouseX,mouseY-3*a,mouseX-2*a,mouseY-2*a,mouseX-2*a,mouseY-4*a); //aleta dorsal
   
   
   ellipse(mouseX,mouseY,12*a,6*a); //cos
   
   triangle(mouseX,mouseY+a,mouseX-2*a,mouseY,mouseX-2*a,mouseY+4*a); //aleta lateral
   
   arc(mouseX+3*a,mouseY,4*a,4*a,3*PI/5,PI); //branquia
   arc(mouseX+3*a,mouseY,3*a,3*a,3*PI/5,PI); //branquia petita
   
   
   fill(255,255,0); //ull
   ellipse(mouseX+3*a,mouseY-a,a,a);
   fill(0); //pupila
   ellipse(mouseX+3*a,mouseY-a,a/3,a/3);
   
  
  
}  
  


