
float r;


void setup(){
  size(800,800);

}


void draw (){
  background(0);

  translate(150,120);
  rotate(r/2);
  triangle(0,0,50,100,100,50);
  resetMatrix(); 
 
  
  translate(600,120);
  rotate(r*1.5);
  triangle(0,0,50,100,100,50);
  resetMatrix();
  
  translate(600,300);
  rotate(r);
  triangle(0,0,50,100,100,50);
  resetMatrix();
  
  translate(150,300);
  rotate(r/3);
  triangle(0,0,50,100,100,50);
  resetMatrix();
  
  translate(300,200);
  rotate(r*1.1);
  triangle(0,0,50,100,100,50);
  r+=PI/128;

}
