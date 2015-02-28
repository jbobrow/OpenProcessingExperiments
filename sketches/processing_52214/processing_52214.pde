
float cir;
float aca;
float iqui;
void setup(){
size (800,600); 
  background(255);
  smooth();
  


  

}

void draw(){
  noStroke ();
cir=random(200);
aca=random(100,250);
iqui=random(150,300);
  fill(random(100,255),0,0,random(100));
  ellipse (mouseX+random(15),mouseY+random(15),cir,cir);
 
}


