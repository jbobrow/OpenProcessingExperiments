
void setup(){
size(500, 500);
smooth();
background(#f49797);

}

void draw() {
  for( float i=0; i<width; i=i+40){
  for (float j=0; j<height; j=j+40){
  
noStroke();
fill(#dd5252);
rect(i+10, j+10, 9, 9);  // deep pink
rotate(HALF_PI);

pushMatrix();
translate(0, 0);
fill(#eabebe,5);  
rect(i, j, 15, 15);  // baby pink
popMatrix();
rotate(PI);

strokeWeight(.25);
pushMatrix();
translate(0, 0);
noFill();
stroke(#eabebe);  
rect(i, j, j*8, i*8);  // baby pink no fill
popMatrix();
rotate(PI/3);


  }
  }
}


