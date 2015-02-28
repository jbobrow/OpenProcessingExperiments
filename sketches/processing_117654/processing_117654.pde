




////Cell Fly////I have started coding with the aim of simulating randomly moving bacterias in 3D.
///But I have ended up with a fly-resembling object, then called ot Cell fly.


Cell[] mycell= new Cell[200];

void setup(){

  size(500,500,P3D);
  
  for (int i=0; i<mycell.length; i++){
    
    mycell[i]=new Cell();
  }

}

void draw(){
  
  background(125,180,125);
  for (int i=0; i<mycell.length; i++){
    
    mycell[i].drawCell();
    mycell[i].update();
  }

}
float shiftx,shifty,r,shiftz,a;

class Cell{

 Cell(){
  
 shiftx=250;
  shifty=250;
  shiftz=250;
  r=random(0,120);

 }
 
 void drawCell(){
   
 strokeWeight(0.1);
 pushMatrix();
 translate(shiftx,shifty,shiftz);
 rotateX(radians(a));
 rotateY(radians(a));
 rotateZ(radians(a));
 
 line(0,0,0,20,15,25);
 a=a+random(1,2);
 popMatrix();

 }
 
 void update(){
   
shiftx=shiftx+random(-0.2,0.2);
  shifty=shifty+random(-0.2,0.2);
  shiftz=shiftz+random(-0.2,0.2);

 }

}




