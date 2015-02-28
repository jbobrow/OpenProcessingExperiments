
/*
 * Recursive Tree and rotation
 * antoine claux ebooki.fr
 * original Daniel Shiffman. 
 *
  */
float a;
float theta =random(0, 6.289);  
 
void setup() {
  size(600, 600);
  }
 
void draw() {
  translate(width/2, height/2);
  background(50);
   stroke(150, 75, 30);
  theta=theta+0.003;///(2*pi)
   branch(180);
  rotate(PI/4);
  branch(180);
  rotate(PI/4);
  branch(180);
  rotate(PI/4);
  branch(180);
  rotate(PI/4);
}
 
void branch(float h) {
  h *= 0.7;
  if (h > 3) {
    pushMatrix();   
    rotate(theta);  
    line(0, 0, 0, -h); 
    translate(0, -h);
    branch(h);    
    popMatrix();   
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}



