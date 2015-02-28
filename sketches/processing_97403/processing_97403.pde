
void setup(){ 
 size(500,300);
 
  }
  
  
void draw(){
background(255);

translate(mouseX/2, mouseY/2);
rotate(radians(mouseY/2));
 at();

}
  
void at(){
pushMatrix();  
translate(100,100);
translate(random(-5, 10), random(-5, 5));
a();

popMatrix();

pushMatrix();
translate(240,100);
translate(random(-5, 10), random(-5, 5));
plu();
popMatrix();

pushMatrix();
translate(380,100);
translate(random(-5, 10), random(-5, 5));
t();
popMatrix();

}
  
  
void a(){
   pushMatrix();
   rotate(PI);
   fill(0);
  quad(-10,30,10,30,30,-30,15,-30);
  quad(10,30,-10,30,-30,-30,-15,-30); 
  quad(20,-5,20,-17,-20,-17,-20,-5);
   popMatrix();
 }
 
void plu(){
  pushMatrix();
   fill(0);
  quad(10,35,10,-35,-10,-35,-10,35);
  quad(35,10,-35,10,-35,-10,35,-10);
   popMatrix();

}



void t(){
  pushMatrix();
   fill(0);
  quad(10,30,10,-30,-10,-35,-10,35);
  quad(30,-25,30,-35,-30,-35,-30,-25);
   popMatrix();
  
  
  
}
