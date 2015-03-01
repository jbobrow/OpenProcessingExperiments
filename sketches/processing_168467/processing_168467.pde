
//playing with 3D. My first 3D's creation XD

void setup(){
 size(500, 500, P3D); 
background(255);
lights();
}

void draw(){
  pushMatrix();
  translate(200, 200, 0);
  rotateY(0.8);
  rotateX(-0.2);
  fill(10, 219, 245);
  box(200);
  popMatrix();
}


