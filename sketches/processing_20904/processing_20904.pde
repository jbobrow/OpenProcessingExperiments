
void setup(){
size(400,400,P3D);

}

int m = 0;

void draw(){
 background(2);
lights();
 translate(width/2,height/2,-100);
 noStroke();
 translate(0,0,0);
 fill(237,214,0);
 sphere(70);

 
 
  //earth
pushMatrix();
 noStroke();
 rotateY(frameCount*PI/6*0.03);
 translate(180,0,0);
 fill(0,148,237);
 sphere(23);
 rotateY(m*PI/6*0.05);

 m++;


 
 
 stroke(255,255,150,50);
  strokeWeight(2);
  noFill();
  rotateX(PI/2);
  noStroke();
  fill(200,200,150);
  translate(50,30,0);
  sphere(12);
  popMatrix();
 
}


