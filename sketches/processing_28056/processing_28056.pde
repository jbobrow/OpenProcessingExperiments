

int numHojas= 15;
float deg= 360/numHojas;

void setup(){
size (600,500);
}

void draw(){
  
  /////fondo
for (int i=0;i<height;i++){
  stroke (50,150-i*0.1,255);
  line (0,i,width,i);
}






///// Tallo
pushMatrix();
translate (width/2,height);
float ang = atan2 (mouseY-height,mouseX-width/2); 
//print (ang);
  rotate (ang+0.5*PI);
stroke (0,188,53);
strokeWeight (5);
line (0,0,0,-200);

/////hoja
pushMatrix();
fill (0,188,53);
strokeWeight (2);
translate (20,-70);
ellipse (0,0,40,15);
popMatrix();


//// centro flor
pushMatrix();
fill (255,255,0);
stroke (0);
translate (0,-200);
ellipse (0,0,50,50);


///Petalos
fill(255);
strokeWeight(1);

for (int i=0; i<numHojas;i++){
pushMatrix();
float rad = radians(deg*i);
rotate (rad);
translate (0,-60);
ellipse (0,0,30,70);
popMatrix();
}

popMatrix();
popMatrix();

}

