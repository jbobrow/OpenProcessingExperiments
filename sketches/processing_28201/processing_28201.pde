
float deg=30;

void setup(){
size (450, 450);
}

void draw(){
  background (255);
  
float ang = atan2 (mouseY-height,mouseX-width/2); 


//// centro flor
pushMatrix();
fill (255);
stroke (0);
translate (0,-250);
ellipse (0,0,20,20);
pushMatrix();
translate (width/2,height);
rotate (ang+PI*0.7);


///Petalos
fill(255);
strokeWeight(1);

for (int i=0; i<20;i++){
pushMatrix();
float rad = radians(deg*i);
rotate (rad);
translate (0, -45);
ellipse (0,0,18,80);
popMatrix();
}

popMatrix();
popMatrix();

}

