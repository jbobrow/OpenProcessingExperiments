
float rotY, rotX; 
float i,j; //vertex parameters
float t; //hinge factor
float r=100;//scale factor

void setup(){ 
  size(600,600,P3D); 
  frameRate(30); 
} 

void draw(){ 
  background(255);
  translate(width/2,height/2, mouseY-100); 
  rotateY(rotY+=.02); 
  rotateX(rotX+=.008);

  float margin =20;
  t=map(mouseX,margin,width-margin,0,2); //Each vertex moves along a "corner" shaped path
  if(mouseX<=margin)
  t=0;
  if(mouseX>=width-margin)
  t=2;
  
  i=t;
  j=map(t,1,2,1,0);
  if(t<=1)
    j=1;
  if(t>=1)
    i=1;

  smooth();
  strokeWeight(2);
  fill(0,127,255,127);
  strokeCap(ROUND);
  beginShape(TRIANGLES);
  drawTriangle(0,4,8);
  drawTriangle(3,5,8);
  drawTriangle(0,7,9);
  drawTriangle(3,6,9);
  drawTriangle(1,4,11);
  drawTriangle(2,5,11);
  drawTriangle(1,7,10);
  drawTriangle(2,6,10);
  endShape();
} 

void drawTriangle(int i, int j, int k){
  drawVertex(i);
  drawVertex(j);
  drawVertex(k);
}

void drawVertex(int n){
  switch(n){
  case 0:
    vertex(r*j,0,r*i);
    break;
  case 1:
    vertex(r*j,0,r*-i);
    break;
  case 2:
    vertex(r*-j,0,r*-i);
    break;
  case 3:
    vertex(r*-j,0,r*i);
    break;  
  case 4:
    vertex(r* i,r* j,0);
    break;
  case 5:
    vertex(r*-i,r* j,0);
    break;
  case 6:
    vertex(r*-i,r*-j,0);
    break;
  case 7:
    vertex(r* i,r*-j,0);
    break;  
  case 8:
    vertex(0,r*i,r*j);
    break;
  case 9:
    vertex(0,r*-i,r*j);
    break;
  case 10:
    vertex(0,r*-i,r*-j);
    break;
  case 11:
    vertex(0,r*i,r*-j);
    break;
  }
}














