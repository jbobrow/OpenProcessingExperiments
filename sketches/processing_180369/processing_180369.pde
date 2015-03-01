
float a = 0;
float b=0;

void setup(){

size(500, 500,P3D);
background(255);
}

void draw(){
  
  translate(width/2, height/2);
  rotateZ(a);
  stroke(a,b,0);
  strokeWeight(b);
  triangle(-75,-300,250,75, 400,300);

a=a+1;
b=3;


}


