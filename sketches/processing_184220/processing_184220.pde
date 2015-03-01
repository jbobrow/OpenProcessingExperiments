

float pelota = 0;
float opelota = 0;
void setup() {
background(200,150,180);
  size(600,600);
  pelota = 1;
}


void draw() {
 
  
pelota = pelota +5;
opelota = opelota +9;

  ellipse(pelota, 100, 50, 50);
  
pelota = pelota ;
  ellipse(opelota, 200, 50, 50);
 
 pelota = pelota ;
  ellipse(opelota*2, 300, 50, 50);
 
 

 // println(pelota);
  
  
}


