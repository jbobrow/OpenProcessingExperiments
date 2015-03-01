
float rot = 0.0;
      
void setup() {
  size(400, 400, OPENGL);
  background(0);
  rectMode(CENTER);
  frameRate(30);
  smooth();
  generatePositions();
}
 
 
    
int[] xs = new int[20];
int[] ys = new int[20];
int[] zs = new int[20];
      
void generatePositions(){
    for(int i = 0; i < xs.length; i++){
        xs[i] = random(-width/2,width/2);
        ys[i] = random(height);
        zs[i] = random(-width/2,width/2);
    }
}
      
void draw() {
  background(0);
  lights();
    
  if(rot > TWO_PI){
      rot = 0.0;
      generatePositions();
  }
    
  stroke(255);
  fill(255);
  translate(width/2,0,0);
  
  for(int a = 0; a < xs.length; a++){
      pushMatrix();
      rotateY(rot);
      translate(xs[a], ys[a], zs[a]);
      box(40);
      popMatrix();
  }
 
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(rot);
  noFill();
  stroke(255);
  strokeWeight(1)
  box(width*2);
  popMatrix();
  
  rot+=0.05;
}
      

