
void setup(){
size(500, 500);
smooth();
background(150);
}

void draw() {
  for( float i=0; i<width; i=i+20){
  for (float j=0; j<height; j=j+20){
  
noStroke();
fill(#05fdcb);
rect(i+10, j+10, 20, 20);  // deep pink
rotate(HALF_PI);

pushMatrix();
translate(0, 0);
fill(#fba7c9);  
rect(i, j, 15, 15);  // baby pink
popMatrix();
rotate(PI);


strokeWeight(.25);
pushMatrix();
translate(0, 0);
noFill();
stroke(#eabebe);  
rect(i, j, j*2, i*2);  // baby pink no fill
popMatrix();
rotate(PI);


  }
  }
}
      

   


