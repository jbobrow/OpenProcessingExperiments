
int col;
float spin = 0.0;
void setup(){

    size(640, 360, P3D);
  noStroke();
    background(255,0,0);
    fill(100,100,255,100);
colorMode(HSB);
col = 0;
}

void draw(){
 col = (col+1) % 256;
fill(col,255,255,100); 
 

  lights();
  
  spin += 0.01;
  
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(PI/7);
  rotateY(PI/9 + spin);
  sphere(50);
  popMatrix();
  
  rect( random(width) , random(height) , 40 , 40 );   

}
void mousePressed(){

    background(0);

}

